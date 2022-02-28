import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'package:ioka/src/widgets/theme/theme_inherited_widget.dart';

export './generator/cupertino_theme_generator.dart';
export './generator/material_theme_generator.dart';
export './generator/theme_generator.dart';
export './theme_inherited_widget.dart';

enum Platform {
  material,
  cupertino,
}

/// Тема Ioka SDK.
/// 
/// Подробнее можно прочитать в [doc/how-tos/customize.md].
/// 
/// Состоит из 4 компонентов:
/// 
/// - [Brightness] - яркость темы (light/dark).
/// 
/// - [IokaThemeColors] - цвета, использующиеся в экранах SDK.
/// 
/// - [IokaThemeTypography] - типографика, использующаяся в экранах SDK.
/// 
/// - [IokaThemeExtras] - другие параметры. Например, [BorderRadius].
/// 
/// Чтобы изменить тему, создайте экземпляр этого класса используя:
/// 
/// - [IokaTheme()] - полная кастомизация темы.
/// 
/// - [IokaTheme.simple()] или [IokaTheme.simpleDark()], 
///   [IokaTheme.simpleLight()] - простая кастомизация темы.
/// 
/// - [IokaMaterialThemeGenerator()] или [IokaCupertinoThemeGenerator()] -
///   генераторы темы для платформ [Material] или [Cupertino].
class IokaTheme {
  IokaTheme({
    required this.brightness,
    required this.colors,
    required this.typography,
    required this.extras,
  });

  factory IokaTheme.simple({
    required Brightness brightness,
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? textColor,
    String? fontFamily,
    String? fontPackage,
    BorderRadius? borderRadius,
  }) {
    final _defaultColors = brightness == Brightness.light
        ? IokaThemeColors.defaultLight
        : IokaThemeColors.defaultDark;

    final _colors = _defaultColors.copyWith(
      primary: primaryColor,
      fill1: backgroundColor,
      fill2: textColor,
      fill4: foregroundColor,
    );

    return IokaTheme(
      brightness: brightness,
      colors: _colors,
      typography: IokaThemeTypography.generate(
        color: _colors.fill2,
        fontFamily: fontFamily ?? 'Inter',
        package: fontFamily == null ? 'ioka' : fontPackage,
      ),
      extras: IokaThemeExtras.defaultExtras.copyWith(
        borderRadius: borderRadius,
      ),
    );
  }

  factory IokaTheme.simpleLight({
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? textColor,
    String? fontFamily,
    String? fontPackage,
    BorderRadius? borderRadius,
  }) {
    return IokaTheme.simple(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      textColor: textColor,
      fontFamily: fontFamily,
      fontPackage: fontPackage,
      borderRadius: borderRadius,
    );
  }

  factory IokaTheme.simpleDark({
    Color? primaryColor,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? textColor,
    String? fontFamily,
    String? fontPackage,
    BorderRadius? borderRadius,
  }) {
    return IokaTheme.simple(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      textColor: textColor,
      fontFamily: fontFamily,
      fontPackage: fontPackage,
      borderRadius: borderRadius,
    );
  }

  final Brightness brightness;
  final IokaThemeColors colors;
  final IokaThemeTypography typography;
  final IokaThemeExtras extras;

  static IokaTheme of(BuildContext context) {
    final ancestor =
        context.dependOnInheritedWidgetOfExactType<IokaThemeInheritedWidget>();

    return ancestor!.theme;
  }

  static final defaultLight = IokaTheme(
    brightness: Brightness.light,
    colors: IokaThemeColors.defaultLight,
    typography: IokaThemeTypography.generate(
      color: IokaThemeColors.defaultLight.fill2,
    ),
    extras: IokaThemeExtras.defaultExtras,
  );

  static final defaultDark = IokaTheme(
    brightness: Brightness.dark,
    colors: IokaThemeColors.defaultDark,
    typography: IokaThemeTypography.generate(
      color: IokaThemeColors.defaultDark.fill2,
    ),
    extras: IokaThemeExtras.defaultExtras,
  );

  IokaTheme copyWith({
    Brightness? brightness,
    IokaThemeColors? colors,
    IokaThemeTypography? typography,
    IokaThemeExtras? extras,
  }) {
    return IokaTheme(
      brightness: brightness ?? this.brightness,
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
      extras: extras ?? this.extras,
    );
  }
}

class IokaThemeColors {
  const IokaThemeColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.fill0,
    required this.fill1,
    required this.fill2,
    required this.grey,
    required this.fill3,
    required this.fill4,
    required this.fill5,
    required this.fill6,
    required this.fill7,
    required this.error,
    required this.success,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color fill0;
  final Color fill1;
  final Color fill2;
  final Color grey;
  final Color fill3;
  final Color fill4;
  final Color fill5;
  final Color fill6;
  final Color fill7;
  final Color error;
  final Color success;

  Color get background => fill1;
  Color get textPrimary => fill2;

  IokaThemeColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? fill0,
    Color? fill1,
    Color? fill2,
    Color? grey,
    Color? fill3,
    Color? fill4,
    Color? fill5,
    Color? fill6,
    Color? fill7,
    Color? error,
    Color? success,
  }) {
    return IokaThemeColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      fill0: fill0 ?? this.fill0,
      fill1: fill1 ?? this.fill1,
      fill2: fill2 ?? this.fill2,
      grey: grey ?? this.grey,
      fill3: fill3 ?? this.fill3,
      fill4: fill4 ?? this.fill4,
      fill5: fill5 ?? this.fill5,
      fill6: fill6 ?? this.fill6,
      fill7: fill7 ?? this.fill7,
      error: error ?? this.error,
      success: success ?? this.success,
    );
  }

  static const defaultLight = IokaThemeColors(
    primary: Color(0xFF6467AA),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF94AA64),
    onSecondary: Color(0xFFFFFFFF),
    fill0: Color(0xFFFFFFFF),
    fill1: Color(0xFFFFFFFF),
    fill2: Color(0xFF1A1A2B),
    grey: Color(0xFF9494A6),
    fill3: Color(0xFFE6E6EF),
    fill4: Color(0xFFF0F0F5),
    fill5: Color(0xFFF0F0F5),
    fill6: Color(0xFFFFFFFF),
    fill7: Color.fromRGBO(26, 26, 43, 0.48),
    error: Color(0xFFDE3030),
    success: Color(0xFF10B981),
  );

  static const defaultDark = IokaThemeColors(
    primary: Color(0xFF6467AA),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF94AA64),
    onSecondary: Color(0xFFFFFFFF),
    fill0: Color(0xFFFFFFFF),
    fill1: Color(0xFF1A1A2B),
    fill2: Color(0xFFFFFFFF),
    grey: Color(0xFF9494A6),
    fill3: Color(0xFFE6E6EF),
    fill4: Color.fromRGBO(255, 255, 255, 0.08),
    fill5: Color(0xFF3B3B53),
    fill6: Color.fromRGBO(255, 255, 255, 0.08),
    fill7: Color.fromRGBO(26, 26, 43, 0.72),
    error: Color(0xFFDE3030),
    success: Color(0xFF10B981),
  );
}

class IokaThemeTypography {
  const IokaThemeTypography({
    required this.heading,
    required this.heading2,
    required this.title,
    required this.bodySemibold,
    required this.body,
    required this.subtitle,
    required this.subtitleSemibold,
    required this.caption,
  });

  final TextStyle heading;
  final TextStyle heading2;
  final TextStyle title;
  final TextStyle bodySemibold;
  final TextStyle body;
  final TextStyle subtitle;
  final TextStyle subtitleSemibold;
  final TextStyle caption;

  IokaThemeTypography copyWith({
    TextStyle? heading,
    TextStyle? heading2,
    TextStyle? title,
    TextStyle? bodySemibold,
    TextStyle? body,
    TextStyle? subtitle,
    TextStyle? subtitleSemibold,
    TextStyle? caption,
  }) {
    return IokaThemeTypography(
      heading: heading ?? this.heading,
      heading2: heading2 ?? this.heading2,
      title: title ?? this.title,
      bodySemibold: bodySemibold ?? this.bodySemibold,
      body: body ?? this.body,
      subtitle: subtitle ?? this.subtitle,
      subtitleSemibold: subtitleSemibold ?? this.subtitleSemibold,
      caption: caption ?? this.caption,
    );
  }

  static IokaThemeTypography generate({
    required Color color,
    String fontFamily = 'Inter',
    String? package = 'ioka',
  }) {
    final baseStyle = TextStyle(
      color: color,
      fontFamily: fontFamily,
      package: package,
      leadingDistribution: TextLeadingDistribution.even,
    );

    return IokaThemeTypography(
      heading: baseStyle.copyWith(
        fontSize: 26,
        height: 36 / 26,
        fontWeight: FontWeight.w600,
      ),
      heading2: baseStyle.copyWith(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w400,
      ),
      title: baseStyle.copyWith(
        fontSize: 18,
        height: 24 / 18,
        fontWeight: FontWeight.w600,
      ),
      bodySemibold: baseStyle.copyWith(
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w600,
      ),
      body: baseStyle.copyWith(
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w400,
      ),
      subtitle: baseStyle.copyWith(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
      ),
      subtitleSemibold: baseStyle.copyWith(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
      ),
      caption: baseStyle.copyWith(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class IokaThemeExtras {
  IokaThemeExtras({
    required this.borderRadius,
  });

  final BorderRadius borderRadius;

  static final defaultExtras = IokaThemeExtras(
    borderRadius: BorderRadius.circular(12),
  );

  IokaThemeExtras copyWith({
    BorderRadius? borderRadius,
  }) {
    return IokaThemeExtras(
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
