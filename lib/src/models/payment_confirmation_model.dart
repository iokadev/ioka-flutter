import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/models/confirmation_model.dart';

class PaymentConfirmationModel extends ConfirmationModel<ExtendedPayment> {
  PaymentConfirmationModel({
    required String url,
    required this.paymentId,
    required this.orderAccessToken,
  }) : super(
          url: url,
          redirectUrl:
              Ioka.instance.configuration.paymentConfirmationRedirectUrl,
        );

  final String paymentId;
  final String orderAccessToken;

  @override
  Future<ExtendedPayment> fetchData(BuildContext context) {
    return Ioka.instance.api.getPaymentById(
      paymentId: paymentId,
      orderAccessToken: orderAccessToken,
    );
  }
}
