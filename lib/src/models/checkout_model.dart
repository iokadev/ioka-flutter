import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/models/payment_confirmation_model.dart';
import 'package:ioka/src/utils/navigation.dart';
import 'package:ioka/src/views/payment_confirmation/cupertino_payment_confirmation_view.dart';
import 'package:ioka/src/views/payment_failure/cupertino_payment_failure_view.dart';
import 'package:ioka/src/views/payment_success/cupertino_payment_success_view.dart';
import 'package:ioka/src/widgets/form/card_input_form.dart';
import 'package:provider/provider.dart';

class CheckoutModel extends ChangeNotifier {
  CheckoutModel({
    required this.orderAccessToken,
    required this.order,
    this.customerAccessToken,
  });

  final String orderAccessToken;
  final String? customerAccessToken;
  final OrderOut order;

  int get amount => order.amount!;

  var _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final cardInputDataNotifier = ValueNotifier<CardInputData?>(null);
  CardInputData? get cardInputData => cardInputDataNotifier.value;

  final isInteractableNotifier = ValueNotifier<bool>(true);
  bool get isInteractable => isInteractableNotifier.value;

  bool get canSaveCard => customerAccessToken != null;

  void onChanged(CardInputData data) {
    cardInputDataNotifier.value = data;
  }

  Future<void> submit(BuildContext context) async {
    assert(cardInputData != null && cardInputData!.isValid);

    isInteractableNotifier.value = false;
    notifyListeners();

    try {
      var payment = await Ioka.instance.api.createNewCardPayment(
        orderAccessToken: orderAccessToken,
        customerAccessToken: customerAccessToken,
        pan: cardInputData!.cardNumber,
        expiryDate: cardInputData!.expiryDate,
        cvc: cardInputData!.cvc,
        save: canSaveCard && cardInputData!.isSaved,
      );

      if (payment.status == PaymentStatus.pending && payment.action != null) {
        final newPayment = await IokaNavigation.showPaymentConfirmationView(
          context,
          orderAccessToken: orderAccessToken,
          url: payment.action!.url!,
          paymentId: payment.id!,
        );

        if (newPayment == null) {
          Navigator.pop(context);
          return;
        }

        payment = newPayment;
      }

      if (payment.status == PaymentStatus.captured ||
          payment.status == PaymentStatus.approved) {
        await IokaNavigation.showPaymentSuccessView(
          context,
          orderAmount: order.amount,
          orderNumber: order.externalId,
        );
      } else {
        await _onFailure(
          context,
          reason: payment.error?.message,
        );
      }
    } catch (e) {
      await _onFailure(
        context,
        reason: (e as dynamic).message,
      );
    }

    isInteractableNotifier.value = true;
    notifyListeners();
  }

  Future<void> _onFailure(BuildContext context, {String? reason}) async {
    final retry = await IokaNavigation.showPaymentFailureView(
      context,
      reason: reason,
    );

    if (retry) {
      reset();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    cardInputDataNotifier.dispose();
    isInteractableNotifier.dispose();
    super.dispose();
  }

  void reset() {
    _formKey = GlobalKey<FormState>();
    notifyListeners();
  }
}
