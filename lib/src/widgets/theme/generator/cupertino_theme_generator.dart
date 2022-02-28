import 'package:flutter/cupertino.dart';

import '../theme.dart';

class IokaCupertinoThemeGenerator
    extends IokaThemeGenerator<CupertinoThemeData> {
  @override
  CupertinoThemeData? getAncestorTheme(BuildContext context) {
    return context.findAncestorWidgetOfExactType<CupertinoTheme>()?.data;
  }

  @override
  CupertinoThemeData fromIokaTheme(IokaTheme theme) {
    final colors = theme.colors;
    final typography = theme.typography;

    return CupertinoThemeData(
      brightness: theme.brightness,
      primaryColor: colors.primary,
      primaryContrastingColor: colors.onPrimary,
      barBackgroundColor: colors.fill1,
      scaffoldBackgroundColor: colors.fill1,
      textTheme: CupertinoTextThemeData(
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

  @override
  IokaTheme toIokaTheme(CupertinoThemeData theme) {
    final textTheme = theme.textTheme;

    final defaultColors = theme.brightness == Brightness.light
        ? IokaThemeColors.defaultLight
        : IokaThemeColors.defaultDark;

    final defaultTypography = IokaThemeTypography.generate(
      color: theme.textTheme.textStyle.color!,
      fontFamily: textTheme.textStyle.fontFamily!,
      package: null,
    );

    return IokaTheme(
      brightness: theme.brightness!,
      colors: defaultColors.copyWith(
        primary: theme.primaryColor,
        onPrimary: theme.primaryContrastingColor,
        fill0: const Color(0xFFFFFFFF),
        fill1: theme.barBackgroundColor,
        fill2: defaultTypography.body.color,
        fill5: theme.scaffoldBackgroundColor,
      ),
      typography: defaultTypography,
      extras: IokaThemeExtras.defaultExtras,
    );
  }
}
