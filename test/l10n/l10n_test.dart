import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/l10n/lang/en.dart';
import 'package:ioka/src/l10n/lang/ru.dart';

void main() {
  group('IokaLocalizations', () {
    test('resolves locales correctly', () {
      final ruLocalization = IokaLocalizations.resolve(const Locale('ru'));
      final enLocalization = IokaLocalizations.resolve(const Locale('en'));

      expect(ruLocalization.runtimeType, RuIokaLocalization);
      expect(enLocalization.runtimeType, EnIokaLocalization);
    });

    test(
      'returns default locale in case if the supplied locale is not supported',
      () {
        final defaultLocalization = IokaLocalizations.defaultLocalization;
        final localization = IokaLocalizations.resolve(const Locale('de'));

        expect(localization, equals(defaultLocalization));
      },
    );
  });
}
