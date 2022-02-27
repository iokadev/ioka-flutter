import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

class IokaMaterialThemeGenerator extends IokaThemeGenerator<ThemeData> {
  @override
  ThemeData? getAncestorTheme(BuildContext context) {
    return context.findAncestorWidgetOfExactType<Theme>()?.data;
  }

  @override
  ThemeData fromIokaTheme(IokaTheme theme) {
    final colors = theme.colors;
    final typography = theme.typography;

    final materialTheme = ThemeData.from(
      colorScheme: ColorScheme(
        brightness: theme.brightness,
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.secondary,
        onSecondary: colors.onSecondary,
        background: colors.fill1,
        onBackground: colors.fill6,
        surface: colors.fill4,
        onSurface: colors.fill2,
        error: colors.error,
        onError: Colors.white,
        errorContainer: colors.error,
        onErrorContainer: Colors.white,
      ),
      textTheme: TextTheme(
        headline1: typography.heading,
        headline2: typography.heading,
        headline3: typography.heading,
        headline4: typography.heading2,
        headline5: typography.heading2,
        headline6: typography.title,
        subtitle1: typography.body,
        subtitle2: typography.bodySemibold,
        bodyText1: typography.subtitleSemibold,
        bodyText2: typography.subtitle,
        button: typography.bodySemibold,
        caption: typography.caption,
        overline: typography.caption,
      ),
    );

    final _shape = RoundedRectangleBorder(
      borderRadius: theme.extras.borderRadius,
    );

    return materialTheme.copyWith(
        cardTheme: CardTheme(
          color: colors.fill6,
          elevation: 0,
          shape: _shape,
        ),
        appBarTheme: AppBarTheme(
          color: colors.fill1,
          elevation: 0,
          foregroundColor: colors.fill2,
          titleTextStyle: typography.title,
          systemOverlayStyle: theme.brightness == Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
        ),
        scaffoldBackgroundColor: colors.fill1,
        buttonTheme: ButtonThemeData(
          shape: _shape,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: colors.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: _shape,
            elevation: 0.0,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: _shape,
            elevation: 0.0,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? colors.primary
                : colors.grey,
          ),
        ));
  }

  @override
  IokaTheme toIokaTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final defaultColors = theme.brightness == Brightness.light
        ? IokaThemeColors.defaultLight
        : IokaThemeColors.defaultDark;

    final defaultTypography = IokaThemeTypography.generate(
      color: colorScheme.onSurface,
      fontFamily: textTheme.bodyText2!.fontFamily!,
      package: null,
    );

    return IokaTheme(
      brightness: theme.brightness,
      colors: defaultColors.copyWith(
        primary: colorScheme.primary,
        onPrimary: colorScheme.onPrimary,
        secondary: colorScheme.secondary,
        onSecondary: colorScheme.onSecondary,
        fill0: Colors.white,
        fill1: theme.appBarTheme.backgroundColor,
        fill2: colorScheme.onSurface,
        fill3: theme.dividerColor,
        fill4: colorScheme.surface,
        fill5: theme.scaffoldBackgroundColor,
        fill6: colorScheme.surface,
        grey: theme.disabledColor,
        error: colorScheme.error,
      ),
      typography: defaultTypography.copyWith(
        heading: defaultTypography.heading.merge(textTheme.headline3),
        heading2: defaultTypography.heading2.merge(textTheme.headline6),
        title: defaultTypography.title.merge(textTheme.headline6),
        body: defaultTypography.body.merge(textTheme.subtitle1),
        bodySemibold: defaultTypography.bodySemibold.merge(textTheme.subtitle2),
        subtitle: defaultTypography.subtitle.merge(textTheme.bodyText2),
        subtitleSemibold:
            defaultTypography.subtitleSemibold.merge(textTheme.bodyText1),
        caption: defaultTypography.caption.merge(textTheme.caption),
      ),
      extras: IokaThemeExtras(
        borderRadius: theme.buttonTheme.shape is RoundedRectangleBorder
            ? (theme.buttonTheme.shape as RoundedRectangleBorder)
                .borderRadius
                .resolve(null)
            : IokaThemeExtras.defaultExtras.borderRadius,
      ),
    );
  }
}
