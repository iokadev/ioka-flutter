import 'package:alchemist/alchemist.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart' as g;
import 'package:provider/provider.dart';

import '../../test_utils.dart';

Widget _buildWidget(
  String orderAccessToken,
  g.OrderOut order,
) {
  return viewWrapper(
    child: ChangeNotifierProvider(
      create: (_) => CheckoutWithNewCardModel(
        orderAccessToken: orderAccessToken,
        order: order,
      ),
      builder: (_, __) => const CupertinoCheckoutWithNewCardView(),
    ),
  );
}

Future<void> _pumpView(
  WidgetTester tester,
  String orderAccessToken,
  g.OrderOut order,
) async {
  await tester.pumpWidget(_buildWidget(orderAccessToken, order));
  await tester.pumpAndSettle();
}

Future<void> main() async {
  Ioka.setupMock();

  final orderAccessToken = await Ioka.api.asMock.mockCreateOrder(amount: 100);
  final order = await Ioka.api.asMock.getOrderById(
    orderAccessToken: orderAccessToken,
  );

  group('CupertinoCheckoutWithNewCardView', () {
    goldenTest(
      'golden',
      constraints: const BoxConstraints(
        maxWidth: 720.0,
        maxHeight: 1280.0,
      ),
      fileName: 'cupertino_checkout_with_new_card_view',
      pumpBeforeTest: (t) => t.pump(),
      widget: _buildWidget(orderAccessToken, order),
    );
  });
}
