import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/models/confirmation_model.dart';

class BindingConfirmationModel extends ConfirmationModel<ExtendedCard> {
  BindingConfirmationModel({
    required String url,
    required this.cardId,
    required this.customerAccessToken,
  }) : super(
          url: url,
          redirectUrl:
              Ioka.instance.configuration.paymentConfirmationRedirectUrl,
        );

  final String cardId;
  final String customerAccessToken;

  @override
  Future<ExtendedCard> fetchData(BuildContext context) {
    return Ioka.api.getCardById(
      cardId: cardId,
      customerAccessToken: customerAccessToken,
    );
  }
}
