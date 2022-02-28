import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart' as g;
import 'package:provider/provider.dart';

import '../../test_utils.dart';

Widget _buildWidget({
  required String orderAccessToken,
  required g.OrderOut order,
  Brightness? brightness,
}) {
  return viewWrapper(
    brightness: brightness,
    child: ChangeNotifierProvider(
      create: (_) => CheckoutWithNewCardModel(
        orderAccessToken: orderAccessToken,
        order: order,
      ),
      builder: (_, __) => const CupertinoCheckoutWithNewCardView(),
    ),
  );
}

Future<void> main() async {
  final orderAccessToken = await Ioka.api.asMock.mockCreateOrder(amount: 100);
  final order = await Ioka.api.asMock.getOrderById(
    orderAccessToken: orderAccessToken,
  );

  group('CupertinoCheckoutWithNewCardView', () {
    goldenTest(
      'renders correctly',
      fileName: 'cupertino_checkout_with_new_card_view',
      constraints: const BoxConstraints(
        maxWidth: 720.0,
        maxHeight: 1280.0,
      ),
      pumpBeforeTest: (t) => t.pump(),
      widget: _buildWidget(
        brightness: Brightness.light,
        orderAccessToken: orderAccessToken,
        order: order,
      ),
    );
    goldenTest(
      'renders correctly in dark mode',
      fileName: 'cupertino_checkout_with_new_card_view_dark',
      constraints: const BoxConstraints(
        maxWidth: 720.0,
        maxHeight: 1280.0,
      ),
      pumpBeforeTest: (t) => t.pump(),
      widget: _buildWidget(
        brightness: Brightness.dark,
        orderAccessToken: orderAccessToken,
        order: order,
      ),
    );
  });
}
