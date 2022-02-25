import 'dart:ui';

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';

class IokaThemeConversion {
  static IokaTheme fromMaterial(material.ThemeData theme) {
    if (theme.brightness == Brightness.light) {
      return IokaTheme.defaultLight;
    }

    return IokaTheme.defaultDark;
  }

  static material.ThemeData toMaterial(IokaTheme theme) {
    return material.ThemeData.dark();
  }

  static IokaTheme fromCupertino(cupertino.CupertinoThemeData theme) {
    if ((theme.brightness ?? Brightness.light) == Brightness.light) {
      return IokaTheme.defaultLight;
    }

    return IokaTheme.defaultDark;
  }

  static cupertino.CupertinoThemeData toCupertino(IokaTheme theme) {
    final colors = theme.colors;
    final typography = theme.typography;

    return cupertino.CupertinoThemeData(
      brightness: theme.brightness,
      primaryColor: colors.primary,
      primaryContrastingColor: colors.fill0,
      barBackgroundColor: colors.fill1,
      scaffoldBackgroundColor: colors.fill1,
      textTheme: cupertino.CupertinoTextThemeData(
        primaryColor: colors.primary,
        textStyle: typography.body,
        navTitleTextStyle: typography.title,
        navLargeTitleTextStyle: typography.title,
        navActionTextStyle: typography.bodySemibold,
        actionTextStyle: typography.bodySemibold,
        dateTimePickerTextStyle: typography.body,
        pickerTextStyle: typography.body,
        tabLabelTextStyle: typography.body,
      ),
    );
  }

  static Brightness getBrightness(BuildContext context) {
    final hasMaterial = IokaThemeConversion.hasMaterialTheme(context);
    final hasCupertino = IokaThemeConversion.hasCupertinoTheme(context);

    if (hasMaterial) {
      return material.Theme.of(context).brightness;
    } else if (hasCupertino) {
      return cupertino.CupertinoTheme.brightnessOf(context);
    }

    return Brightness.light;
  }

  static Platform getPlatform(BuildContext context) {
    if (hasCupertinoTheme(context)) {
      return Platform.cupertino;
    }

    return Platform.material;
  }

  static bool hasMaterialTheme(BuildContext context) {
    return context.findAncestorWidgetOfExactType<material.Theme>() != null;
  }

  static bool hasCupertinoTheme(BuildContext context) {
    return context.findAncestorWidgetOfExactType<material.Theme>() != null;
  }
}

class IokaAutomaticThemeProvider extends StatelessWidget {
  const IokaAutomaticThemeProvider({
    Key? key,
    required this.theme,
    required this.fallback,
    required this.child,
  }) : super(key: key);

  final IokaTheme? theme;
  final IokaTheme fallback;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    IokaTheme? _theme;

    if (theme != null) {
      _theme = theme;
    } else {
      final hasMaterial = IokaThemeConversion.hasMaterialTheme(context);
      final hasCupertino = IokaThemeConversion.hasCupertinoTheme(context);

      if (hasMaterial) {
        final materialTheme = material.Theme.of(context);
        _theme = IokaThemeConversion.fromMaterial(materialTheme);
      } else if (hasCupertino) {
        final cupertinoTheme = cupertino.CupertinoTheme.of(context);
        _theme = IokaThemeConversion.fromCupertino(cupertinoTheme);
      }
    }

    _theme ??= fallback;

    return material.Theme(
      data: IokaThemeConversion.toMaterial(_theme),
      child: cupertino.CupertinoTheme(
        data: IokaThemeConversion.toCupertino(_theme),
        child: IokaThemeInheritedWidget(
          theme: _theme,
          child: material.Material(
            type: material.MaterialType.transparency,
            child: child,
          ),
        ),
      ),
    );
  }
}
