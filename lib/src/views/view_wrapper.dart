import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';

class IokaViewWrapper extends InheritedWidget {
  IokaViewWrapper({
    Key? key,
    required Widget child,
    required this.platform,
    this.theme,
    this.locale,
  }) : super(
          key: key,
          child: IokaLocalizationProvider(
            locale: locale,
            child: IokaAutomaticThemeProvider(
              theme: theme,
              fallback: IokaTheme.defaultLight,
              child: child,
            ),
          ),
        );

  final Platform platform;
  final IokaTheme? theme;
  final Locale? locale;

  @override
  bool updateShouldNotify(covariant IokaViewWrapper oldWidget) {
    return oldWidget.platform != platform ||
        oldWidget.theme != theme ||
        oldWidget.locale != locale;
  }
}
