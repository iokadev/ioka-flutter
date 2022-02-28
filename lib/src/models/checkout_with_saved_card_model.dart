import 'package:credit_card_validator/security_code.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/models/checkout_model.dart';

class CheckoutWithSavedCardModel extends CheckoutModel {
  CheckoutWithSavedCardModel({
    required String orderAccessToken,
    required OrderOut order,
    required this.savedCard,
  }) : super(order: order, orderAccessToken: orderAccessToken);

  final SavedCard savedCard;

  final cvcNotifier = ValueNotifier<String?>(null);
  String get cvc => cvcNotifier.value ?? '';

  @override
  bool get isValid => savedCard.cvcRequired
      ? validateSecurityCode(cvc, savedCard.cardType).isValid
      : true;

  @override
  Future<ExtendedPayment> createPayment() {
    return Ioka.api.createSavedCardPayment(
      orderAccessToken: orderAccessToken,
      cardId: savedCard.id,
      cvc: cvc,
    );
  }

  @override
  Future<void> onSuccess(BuildContext context) {
    Navigator.pop(context);
    return super.onSuccess(context);
  }

  @override
  Future<void> onFailure(BuildContext context, {String? reason}) async {
    Navigator.pop(context);

    await showCupertinoPaymentFailureDialog(
      context,
      reason: reason,
    );
  }

  @override
  void dispose() {
    cvcNotifier.dispose();
    super.dispose();
  }
}
