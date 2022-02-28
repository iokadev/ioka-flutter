import 'package:flutter/widgets.dart';
import 'package:ioka/src/l10n/lang/base.dart';
import 'package:ioka/src/l10n/lang/en.dart';
import 'package:ioka/src/l10n/lang/ru.dart';

import 'l10n_inherited_widget.dart';

export './l10n_inherited_widget.dart';
export './lang/base.dart';

/// Предоставляет доступ к локализации.
///
/// На данный момент поддерживается только русский и английский язык.
///
/// Чтобы получить объект локализации для локали, используйте
/// [IokaLocalizations.resolve].
///
/// Подробнее можно прочитать в [doc/localization.md].
class IokaLocalizations {
  static final Map<Locale, IokaLocalization> localizations = {
    const Locale('ru'): RuIokaLocalization(),
    const Locale('en'): EnIokaLocalization(),
  };

  static const defaultLocale = Locale('ru');

  static IokaLocalization get defaultLocalization =>
      localizations[defaultLocale]!;

  /// Получает объект локализации в заданном [context].
  /// 
  /// Необходимо, чтобы предком этого [context] был 
  /// [IokaLocalizationInheritedWidget].
  static IokaLocalization of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<IokaLocalizationInheritedWidget>()!
        .localization;
  }

  /// Получает экземпляр [IokaLocalization] для переданной [locale].
  ///
  /// Если не найдено ни одной локализации для переданной [locale], то
  /// возвращается [defaultLocalization].
  static IokaLocalization resolve(Locale locale) {
    final acceptableLocalizations = localizations.entries
        .where(((element) => element.key.languageCode == locale.languageCode));

    if (acceptableLocalizations.isEmpty) {
      return defaultLocalization;
    }

    return acceptableLocalizations.first.value;
  }
}
