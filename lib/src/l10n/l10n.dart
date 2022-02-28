import 'package:flutter/widgets.dart';
import 'package:ioka/src/l10n/lang/base.dart';
import 'package:ioka/src/l10n/lang/en.dart';
import 'package:ioka/src/l10n/lang/ru.dart';

export './l10n_inherited_widget.dart';
export './lang/base.dart';

class IokaLocalizations {
  static final Map<Locale, IokaLocalization> localizations = {
    const Locale('ru'): RuIokaLocalization(),
    const Locale('en'): EnIokaLocalization(),
  };

  static const defaultLocale = Locale('ru');

  static IokaLocalization get defaultLocalization =>
      localizations[defaultLocale]!;

  static IokaLocalization resolve(Locale locale) {
    final acceptableLocalizations = localizations.entries
        .where(((element) => element.key.languageCode == locale.languageCode));

    if (acceptableLocalizations.isEmpty) {
      return defaultLocalization;
    }

    return acceptableLocalizations.first.value;
  }
}
