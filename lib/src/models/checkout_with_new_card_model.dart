import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/models/checkout_model.dart';
import 'package:ioka/src/models/payment_confirmation_model.dart';
import 'package:ioka/src/utils/navigation.dart';
import 'package:ioka/src/views/payment_confirmation/cupertino_payment_confirmation_view.dart';
import 'package:ioka/src/views/payment_failure/cupertino_payment_failure_view.dart';
import 'package:ioka/src/views/payment_success/cupertino_payment_success_view.dart';
import 'package:ioka/src/widgets/form/card_input_form.dart';
import 'package:provider/provider.dart';

class CheckoutWithNewCardModel extends CheckoutModel {
  CheckoutWithNewCardModel({
    required String orderAccessToken,
    required OrderOut order,
    this.customerAccessToken,
  }) : super(order: order, orderAccessToken: orderAccessToken);

  final String? customerAccessToken;

  final cardInputDataNotifier = ValueNotifier<CardInputData?>(null);
  CardInputData? get cardInputData => cardInputDataNotifier.value;

  bool get canSaveCard => customerAccessToken != null;

  void onChanged(CardInputData data) {
    cardInputDataNotifier.value = data;
  }

  @override
  bool get isValid => cardInputData?.isValid ?? false;

  @override
  Future<ExtendedPayment> createPayment() async {
    return Ioka.instance.api.createNewCardPayment(
      orderAccessToken: orderAccessToken,
      customerAccessToken: customerAccessToken,
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
