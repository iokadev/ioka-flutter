import 'package:alchemist/alchemist.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';

import '../../test_utils.dart';

void main() {
  group('CardEmitterWidget', () {
    goldenTest(
      'renders correctly',
      fileName: 'card_emitter_widget',
      widget: const CardEmitterWidget(cardEmitter: 'kaspibank'),
    );

    testWidgets('shows the card if the emitter exists', (tester) async {
      await tester.pumpWidget(
        necessaryAncestors(
          child: const Center(
            child: CardEmitterWidget(cardEmitter: 'kaspibank'),
          ),
        ),
      );

      expect(find.byType(CardWidget), findsOneWidget);
    });

    testWidgets(
      'does not show the card if the emitter does not exist',
      (tester) async {
        await tester.pumpWidget(
          necessaryAncestors(
            child: const Center(
              child: CardEmitterWidget(cardEmitter: 'nonexistent'),
            ),
          ),
        );

        expect(find.byType(CardWidget), findsNothing);
      },
    );
  });
}
