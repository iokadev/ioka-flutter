import 'package:flutter/widgets.dart';
import 'package:ioka/src/l10n/l10n.dart';

/// Передаёт инстанцию [IokaLocalization] для своих потомков.
///
/// Чтобы получить эту инстанцию, используйте [IokaLocalizations.of].
class IokaLocalizationInheritedWidget extends InheritedWidget {
  const IokaLocalizationInheritedWidget({
    Key? key,
    required this.localization,
    required Widget child,
  }) : super(key: key, child: child);

  final IokaLocalization localization;

  @override
  bool updateShouldNotify(IokaLocalizationInheritedWidget oldWidget) {
    return localization != oldWidget.localization;
  }
}

/// Надстройка над [IokaLocalizationInheritedWidget].
/// 
/// В случае, если опциональный параметр [locale] равен `null`, то будет
/// использоваться текущая локаль приложения.
class IokaLocalizationProvider extends StatelessWidget {
  const IokaLocalizationProvider({
    Key? key,
    required this.locale,
    required this.child,
  }) : super(key: key);

  final Locale? locale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    IokaLocalization? localization;

    if (locale != null) {
      localization = IokaLocalizations.resolve(locale!);
    } else {
      // Получаем локаль в контексте - обычно передаётся через MaterialApp
      final locale = Localizations.localeOf(context);
      localization = IokaLocalizations.resolve(locale);
    }

    return IokaLocalizationInheritedWidget(
      localization: localization,
      child: child,
    );
  }
}

/// Позволяет получить инстанцию [IokaLocalization] из контекста:
/// 
/// ```
/// final localization = context.l10n;
/// ```
extension IokaLocalizationGetter on BuildContext {
  IokaLocalization get l10n => IokaLocalizations.of(this);
}
