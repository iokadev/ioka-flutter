import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';

abstract class CheckoutModel extends ChangeNotifier {
  CheckoutModel({
    required this.orderAccessToken,
    required this.order,
  });

  final String orderAccessToken;
  final OrderOut order;

  int get amount => order.amount!;

  var _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final isInteractableNotifier = ValueNotifier<bool>(true);
  bool get isInteractable => isInteractableNotifier.value;

  bool get isValid;
  Future<ExtendedPayment> createPayment();

  Future<ExtendedPayment?> submit(
    BuildContext context, {
    bool shouldPopRoute = true,
  }) async {
    assert(isValid);

    isInteractableNotifier.value = false;
    notifyListeners();

    ExtendedPayment? payment;
    try {
      payment = await createPayment();

      if (payment.status == PaymentStatus.pending && payment.action != null) {
        final newPayment = await IokaNavigation.showPaymentConfirmationView(
          context,
          orderAccessToken: orderAccessToken,
          url: payment.action!.url!,
          paymentId: payment.id!,
        );

        if (newPayment == null) {
          if (shouldPopRoute) {
            Navigator.pop(context);
          }

          return null;
        }

        payment = newPayment;
      }

      if (payment.status == PaymentStatus.captured ||
          payment.status == PaymentStatus.approved) {
        await onSuccess(context);
      } else {
        await onFailure(
          context,
          reason: payment.error?.message,
        );

        payment = null;
      }
    } catch (e) {
      await onFailure(
        context,
        reason: (e as dynamic).message,
      );

      payment = null;
    }

    if (shouldPopRoute) {
      Navigator.of(context).pop(payment);
    }

    isInteractableNotifier.value = true;
    notifyListeners();

    return payment;
  }

  Future<void> onSuccess(BuildContext context) {
    return IokaNavigation.showPaymentSuccessView(
      context,
      orderAmount: order.amount,
      orderNumber: order.externalId,
    );
  }

  Future<void> onFailure(BuildContext context, {String? reason}) async {
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
    isInteractableNotifier.dispose();
    super.dispose();
  }

  void reset() {
    _formKey = GlobalKey<FormState>();
    notifyListeners();
  }
}
