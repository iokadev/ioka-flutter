import 'package:alchemist/alchemist.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:meta/meta.dart';

import '../test_utils.dart';

final _themes = {
  'light': IokaTheme.simpleLight(fontFamily: 'Inter'),
  'dark': IokaTheme.simpleDark(fontFamily: 'Inter'),
};

@isTest
void autoGoldenTestViewWithDifferentParameters({
  required String name,
  required Widget child,
}) {
  for (final locale in IokaLocalizations.localizations.keys) {
    for (final themeKey in _themes.keys) {
      final theme = _themes[themeKey];
      final localeName = locale.languageCode;
      final themeName = themeKey;

      final fileName = '${name}__${themeName}_$localeName';

      goldenTest(
        'renders correctly with theme: $themeName, locale: $localeName',
        fileName: fileName,
        constraints: const BoxConstraints(
          maxWidth: 720.0,
          maxHeight: 1280.0,
        ),
        pumpBeforeTest: (t) => t.pump(),
        widget: viewWrapper(
          locale: locale,
          theme: theme,
          child: child,
        ),
      );
    }
  }
}
