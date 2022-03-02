import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';

import '../view_test_utils.dart';

Future<void> main() async {
  group('CupertinoPaymentFailureView', () {
    autoGoldenTest(
      name: 'cupertino_payment_failure_view_without_reason',
      child: const CupertinoPaymentFailureView(),
    );

    autoGoldenTest(
      name: 'cupertino_payment_failure_view_with_reason',
      child: const CupertinoPaymentFailureView(
        reason: 'reason',
      ),
    );
  });
}
