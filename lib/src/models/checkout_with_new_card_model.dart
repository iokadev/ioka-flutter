import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/models/checkout_model.dart';

class CheckoutWithNewCardModel extends CheckoutModel {
  CheckoutWithNewCardModel({
    required String orderAccessToken,
    required OrderOut order,
    bool? canSaveCard,
  })  : _canSaveCard = canSaveCard,
        super(order: order, orderAccessToken: orderAccessToken);

  final cardInputDataNotifier = ValueNotifier<CardInputData?>(null);
  CardInputData? get cardInputData => cardInputDataNotifier.value;

  final bool? _canSaveCard;
  bool get canSaveCard => _canSaveCard ?? order.customerId != null;

  void onChanged(CardInputData data) {
    cardInputDataNotifier.value = data;
  }

  @override
  bool get isValid => cardInputData?.isValid ?? false;

  @override
  Future<ExtendedPayment> createPayment() async {
    return Ioka.api.createNewCardPayment(
      orderAccessToken: orderAccessToken,
      pan: cardInputData!.cardNumber,
      expiryDate: cardInputData!.expiryDate,
      cvc: cardInputData!.cvc,
      save: canSaveCard && cardInputData!.isSaved,
    );
  }

  @override
  void dispose() {
    cardInputDataNotifier.dispose();
    super.dispose();
  }
}
