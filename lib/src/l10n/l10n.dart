import 'package:flutter/widgets.dart';
import 'package:ioka/src/l10n/lang/ru.dart';

abstract class IokaLocalization {
  String checkoutFormTitle(int amount);
}

class IokaLocalizations {
  static final Map<Locale, IokaLocalization> localizations = {
    const Locale('ru'): RuIokaLocalization(),
  };

  static const defaultLocale = Locale('ru');

  static IokaLocalization get defaultLocalization =>
      localizations[defaultLocale]!;

  static IokaLocalization resolve(Locale locale) {
    final acceptableLocalizations = localizations.entries
        .where(((element) => element.key.countryCode == locale.countryCode));

    if (acceptableLocalizations.isEmpty) {
      return defaultLocalization;
    }

    return acceptableLocalizations.first.value;
  }
}
