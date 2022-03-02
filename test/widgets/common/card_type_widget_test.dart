import 'package:alchemist/alchemist.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';

import '../../test_utils.dart';

void main() {
  group('CardTypeWidget', () {
    goldenTest(
      'renders correctly',
      fileName: 'card_type_widget',
      widget: const CardTypeWidget(cardType: CreditCardType.mastercard),
    );

    testWidgets('shows the card if the type exists', (tester) async {
      await tester.pumpWidget(
        necessaryAncestors(
          child: const Center(
            child: CardTypeWidget(cardType: CreditCardType.mastercard),
          ),
        ),
      );

      expect(find.byType(CardWidget), findsOneWidget);
    });

    testWidgets(
      'does not show the card if the type does not exist',
      (tester) async {
        await tester.pumpWidget(
          necessaryAncestors(
            child: const Center(
              child: CardTypeWidget(cardType: CreditCardType.unknown),
            ),
          ),
        );

        expect(find.byType(CardWidget), findsNothing);
      },
    );
  });
}
