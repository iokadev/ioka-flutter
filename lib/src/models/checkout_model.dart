import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/card_number.dart';
import 'package:credit_card_validator/expiration_date.dart';
import 'package:credit_card_validator/security_code.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/src/utils/navigation.dart';
import 'package:ioka/src/views/payment_confirmation/cupertino_payment_confirmation_view.dart';
import 'package:ioka/src/views/payment_failure/cupertino_payment_failure_view.dart';
import 'package:ioka/src/views/payment_success/cupertino_payment_success_view.dart';

class CheckoutModel extends ChangeNotifier {
  CheckoutModel() {
    cardNumberNotifier.addListener(_onChanged);
    cardExpiryDateNotifier.addListener(_onChanged);
    cardCvcNotifier.addListener(_onChanged);
  }

  final formKey = GlobalKey<FormState>();
  final cardNumberNotifier = ValueNotifier<String?>(null);
  final cardExpiryDateNotifier = ValueNotifier<String?>(null);
  final cardCvcNotifier = ValueNotifier<String?>(null);

  final cardTypeNotifier = ValueNotifier<CreditCardType?>(null);
  final cardEmitterNotifier = ValueNotifier<String?>(null);

  final saveCardNotifier = ValueNotifier<bool>(false);

  final isValidNotifier = ValueNotifier<bool>(false);
  bool get isValid => isValidNotifier.value;

  final isSubmittingNotifier = ValueNotifier<bool>(false);
  bool get isSubmitting => isSubmittingNotifier.value;

  void _onChanged() {
    final cardNumberValidationResult = validateCardNumber(
      cardNumberNotifier.value ?? '',
    );

    cardTypeNotifier.value = cardNumberValidationResult.ccType;

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

  Future<void> submit(BuildContext context) async {
    _onChanged();
    if (!isValid) {
      throw Exception('Invalid form data.');
    }

    isSubmittingNotifier.value = true;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 1));

      final result = await Navigator.of(context).pushWithExistingViewWrapper(
        context,
        (context, platform) => const CupertinoPaymentConfirmationView(),
      );

      if (result != null && result) {
        await Navigator.of(context).pushWithExistingViewWrapper(
          context,
          (context, platform) => const CupertinoPaymentSuccessView(
            orderNumber: '318831893',
            orderAmount: 148490,
          ),
        );

        Navigator.of(context).pop(true);
      } else {
        final retry = await Navigator.of(context).pushWithExistingViewWrapper(
          context,
          (context, platform) => const CupertinoPaymentFailureView(
            reason:
                'Проверьте, открыт ли доступ к интернет-покупкам и попробуйте снова',
          ),
        );

        if (retry != null && retry) {
          // Clear the form
          reset();
        } else {
          Navigator.of(context).pop(false);
        }
      }
    } catch (e) {}

    isSubmittingNotifier.value = false;
    notifyListeners();
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
    cardTypeNotifier.dispose();
    cardEmitterNotifier.dispose();
    isValidNotifier.dispose();
    isSubmittingNotifier.dispose();
    saveCardNotifier.dispose();
    super.dispose();
  }
}
