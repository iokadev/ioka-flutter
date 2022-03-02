import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

import '../../test_utils.dart';
import '../view_test_utils.dart';

Future<void> main() async {
  final orderAccessToken = await Ioka.api.asMock.mockCreateOrder(amount: 100);
  final order = await Ioka.api.asMock.getOrderById(
    orderAccessToken: orderAccessToken,
  );

  group('CupertinoCheckoutWithNewCardView', () {
    autoGoldenTest(
      name: 'cupertino_checkout_with_new_card_view',
      child: ChangeNotifierProvider(
        create: (_) => CheckoutWithNewCardModel(
          orderAccessToken: orderAccessToken,
          order: order,
        ),
        builder: (_, __) => const CupertinoCheckoutWithNewCardView(),
      ),
    );
  });
}
