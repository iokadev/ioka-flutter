import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/l10n/lang/en.dart';

void main() {
  group('IokaLocalizationProvider', () {
    testWidgets('provides localization from a given locale', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: IokaLocalizationProvider(
            locale: const Locale('en'),
            child: Container(),
          ),
        ),
      );

      final localizationProvider =
          tester.widget<IokaLocalizationInheritedWidget>(
              find.byType(IokaLocalizationInheritedWidget));

      expect(
        localizationProvider.localization,
        isA<EnIokaLocalization>(),
      );
    });
    testWidgets('provides localization from [MaterialApp]', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          home: IokaLocalizationProvider(
            locale: null,
            child: Container(),
          ),
        ),
      );

      final localizationProvider =
          tester.widget<IokaLocalizationInheritedWidget>(
              find.byType(IokaLocalizationInheritedWidget));

      expect(
        localizationProvider.localization,
        isA<EnIokaLocalization>(),
      );
    });
  });
}
