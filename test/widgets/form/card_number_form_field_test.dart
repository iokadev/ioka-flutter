import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';

import '../../test_utils.dart';
import '../../views/view_test_utils.dart';

void main() {
  group('CupertinoCardNumberFormField', () {
    autoGoldenTest(
      name: 'cupertino_card_number_form_field',
      child: CupertinoCardNumberFormField(onChanged: (v) {}),
    );

    // testWidgets('formats input', (tester) async {
    //   await tester.pumpWidget(
    //     necessaryAncestors(
    //       child: viewWrapper(
    //         child: CupertinoCardNumberFormField(onChanged: (v) {}),
    //       ),
    //     ),
    //   );

    //   await tester.tap(find.byType(CupertinoTextField));

    //   await tester.pumpAndSettle();
      
    //   await tester.sendKeyEvent(LogicalKeyboardKey.digit5);
    //   await tester.sendKeyEvent(LogicalKeyboardKey.digit1);

    //   await tester.pumpAndSettle();

    //   expect(find.byType(CardTypeWidget), findsOneWidget);

    //   final widget = tester.widget<CardTypeWidget>(find.byType(CardTypeWidget));

    //   expect(widget.cardType, equals(CreditCardType.mastercard));
    // });
  });
}
