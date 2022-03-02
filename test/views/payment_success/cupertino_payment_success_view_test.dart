import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';

import '../view_test_utils.dart';

Future<void> main() async {
  group('CupertinoPaymentSuccessView', () {
    autoGoldenTest(
      name: 'cupertino_payment_success_view_with_order_number',
      child: const CupertinoPaymentSuccessView(
        orderAmount: 1000,
        orderNumber: '123',
      ),
    );

    autoGoldenTest(
      name: 'cupertino_payment_success_view_without_order_number',
      child: const CupertinoPaymentSuccessView(
        orderAmount: 1000,
      ),
    );
  });
}
