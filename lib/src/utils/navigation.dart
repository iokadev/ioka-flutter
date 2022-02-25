import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/src/views/view_wrapper.dart';
import 'package:ioka/src/widgets/theme/theme.dart';
import 'package:ioka/src/widgets/theme/theme_conversion.dart';

typedef PlatformAwareWidgetBuilder = Widget Function(
  BuildContext context,
  Platform platform,
);

extension IokaNavigationHelpers on NavigatorState {
  PageRoute<T> _buildPlatformAwarePageRoute<T>(
    WidgetBuilder builder, {
    required Platform platform,
  }) {
    if (platform == Platform.material) {
      return MaterialPageRoute<T>(builder: builder);
    } else {
      return CupertinoPageRoute<T>(builder: builder);
    }
  }

  Future<T?> pushPlatformAware<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    Platform? platform,
  }) {
    final _platform = platform ?? IokaThemeConversion.getPlatform(context);

    return push<T>(
      _buildPlatformAwarePageRoute(
        (context) => builder(context, _platform),
        platform: _platform,
      ),
    );
  }

  Future<T?> pushWithViewWrapper<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder, {
    required IokaTheme? theme,
    required Platform? platform,
    required Locale? locale,
  }) {
    return pushPlatformAware(
      context,
      (context, platform) => IokaViewWrapper(
        platform: platform,
        theme: theme,
        locale: locale,
        child: builder(context, platform),
      ),
      platform: platform,
    );
  }

  Future<T?> pushWithExistingViewWrapper<T>(
    BuildContext context,
    PlatformAwareWidgetBuilder builder,
  ) {
    final existingWrapper =
        context.findAncestorWidgetOfExactType<IokaViewWrapper>()!;

    return pushPlatformAware(
      context,
      (context, platform) => IokaViewWrapper(
        platform: existingWrapper.platform,
        theme: existingWrapper.theme,
        locale: existingWrapper.locale,
        child: builder(context, platform),
      ),
    );
  }
}
