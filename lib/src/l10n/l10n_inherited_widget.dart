import 'package:flutter/widgets.dart';
import 'package:ioka/src/l10n/l10n.dart';

class IokaLocalizationInheritedWidget extends InheritedWidget {
  const IokaLocalizationInheritedWidget({
    Key? key,
    required this.localization,
    required Widget child,
  }) : super(key: key, child: child);

  final IokaLocalization localization;

  static IokaLocalizationInheritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<IokaLocalizationInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(IokaLocalizationInheritedWidget oldWidget) {
    return localization != oldWidget.localization;
  }
}

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
      final deviceLocale = Localizations.localeOf(context);
      localization = IokaLocalizations.resolve(deviceLocale);
    }

    return IokaLocalizationInheritedWidget(
      localization: localization,
      child: child,
    );
  }
}

extension IokaLocalizationGetter on BuildContext {
  IokaLocalization get l10n =>
      IokaLocalizationInheritedWidget.of(this).localization;
}
