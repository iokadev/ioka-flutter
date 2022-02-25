import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/card_number.dart';
import 'package:credit_card_validator/expiration_date.dart';
import 'package:credit_card_validator/security_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.enums.swagger.dart';
import 'package:ioka/src/api/utils/access_token_helpers.dart';
import 'package:ioka/src/utils/navigation.dart';
import 'package:ioka/src/views/payment_confirmation/cupertino_payment_confirmation_view.dart';
import 'package:ioka/src/views/payment_failure/cupertino_payment_failure_view.dart';
import 'package:ioka/src/views/payment_success/cupertino_payment_success_view.dart';
import 'package:functional_listener/functional_listener.dart';

class CheckoutModel extends ChangeNotifier {
  CheckoutModel({
    required this.orderAccessToken,
    required this.amount,
  }) {
    cardNumberNotifier.addListener(_onChanged);
    cardExpiryDateNotifier.addListener(_onChanged);
    cardCvcNotifier.addListener(_onChanged);

    cardBinNotifier.addListener(_onBinChanged);
  }

  final String orderAccessToken;
  final int amount;

  final formKey = GlobalKey<FormState>();
  final cardNumberNotifier = ValueNotifier<String?>(null);
  final cardExpiryDateNotifier = ValueNotifier<String?>(null);
  final cardCvcNotifier = ValueNotifier<String?>(null);

  final cardBinNotifier = ValueNotifier<String?>(null);

  final cardTypeNotifier = ValueNotifier<CreditCardType?>(null);
  final cardEmitterNotifier = ValueNotifier<String?>(null);

  final saveCardNotifier = ValueNotifier<bool>(false);

  final isValidNotifier = ValueNotifier<bool>(false);
  bool get isValid => isValidNotifier.value;

  final isInteractableNotifier = ValueNotifier<bool>(true);
  bool get isInteractable => isInteractableNotifier.value;

  void _onChanged() {
    final cardNumberValidationResult = validateCardNumber(
      cardNumberNotifier.value ?? '',
    );

    cardTypeNotifier.value = cardNumberValidationResult.ccType;

    if (cardNumberNotifier.value != null &&
        cardNumberNotifier.value!.length >= 6) {
      cardBinNotifier.value = cardNumberNotifier.value!.substring(0, 6);
    } else {
      cardBinNotifier.value = null;
    }

    final expiryDateValidationResult = validateExpirationDate(
      cardExpiryDateNotifier.value ?? '',
    );

    final cvcValidationResult = validateSecurityCode(
      cardCvcNotifier.value ?? '',
      cardTypeNotifier.value ?? CreditCardType.unknown,
    );

    isValidNotifier.value = cardNumberValidationResult.isValid &&
        expiryDateValidationResult.isValid &&
        cvcValidationResult.isValid;
  }

  Future<void> _onBinChanged() async {
    try {
      if (cardBinNotifier.value == null) {
        cardEmitterNotifier.value = null;
        return;
      }

      final info = await Ioka.instance.api.getEmitterByBinCode(
        binCode: cardBinNotifier.value!,
      );

      cardEmitterNotifier.value = info.emitterCode;
    } catch (e) {
      cardEmitterNotifier.value = null;
    }
  }

  Future<void> submit(BuildContext context) async {
    _onChanged();
    if (!isValid) {
      throw Exception('Invalid form data.');
    }

    isInteractableNotifier.value = false;
    notifyListeners();

    try {
      final response = await Ioka.instance.api.createNewCardPayment(
        orderAccessToken: orderAccessToken,
        pan: cardNumberNotifier.value!,
        expiryDate: cardExpiryDateNotifier.value!,
        cvc: cardCvcNotifier.value!,
      );

      if (response.status == PaymentStatus.pending && response.action != null) {
        final result = await Navigator.of(context).pushWithExistingViewWrapper(
          context,
          (context, platform) => CupertinoPaymentConfirmationView(
            url: response.action!.url!,
          ),
        );

        if (result == null || !result) {
          await onFailure(context, reason: 'Отменён процесс 3D Secure');
        } else {
          await onSuccess(context);
        }
      } else if (response.status == PaymentStatus.declined) {
        await onFailure(context, reason: response.error?.message ?? '');
      } else {
        await onSuccess(context);
      }
    } catch (e) {
      onFailure(context, reason: (e as dynamic).message);
    }

    isInteractableNotifier.value = true;
    notifyListeners();
  }

  Future<void> onSuccess(BuildContext context) async {
    await Navigator.of(context).pushWithExistingViewWrapper(
      context,
      (context, platform) => CupertinoPaymentSuccessView(
        orderNumber: orderIdFromAccessToken(orderAccessToken).split('_').last,
        orderAmount: amount,
      ),
    );

    Navigator.of(context).pop(true);
  }

  Future<void> onFailure(BuildContext context, {required String reason}) async {
    final retry = await Navigator.of(context).pushWithExistingViewWrapper(
      context,
      (context, platform) => CupertinoPaymentFailureView(
        reason: reason,
      ),
    );

    if (retry != null && retry) {
      // Clear the form
      reset();
    } else {
      Navigator.of(context).pop(false);
    }
  }

  void reset() {
    cardNumberNotifier.value = null;
    cardExpiryDateNotifier.value = null;
    cardCvcNotifier.value = null;
    cardTypeNotifier.value = null;
    cardEmitterNotifier.value = null;
    isValidNotifier.value = false;
    saveCardNotifier.value = false;

    formKey.currentState?.reset();
  }

  @override
  void dispose() {
    cardNumberNotifier.dispose();
    cardExpiryDateNotifier.dispose();
    cardCvcNotifier.dispose();
    cardBinNotifier.dispose();
    cardTypeNotifier.dispose();
    cardEmitterNotifier.dispose();
    isValidNotifier.dispose();
    isInteractableNotifier.dispose();
    saveCardNotifier.dispose();
    super.dispose();
  }
}
