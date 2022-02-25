import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/src/facade/config.dart';
import 'package:ioka/src/models/checkout_model.dart';
import 'package:ioka/src/utils/navigation.dart';
import 'package:ioka/src/views/checkout/cupertino_checkout_view.dart';
import 'package:ioka/src/views/view_wrapper.dart';
import 'package:ioka/src/widgets/theme/theme.dart';
import 'package:ioka/src/widgets/theme/theme_conversion.dart';
import 'package:provider/provider.dart';

class Ioka {
  Ioka._({
    required String apiKey,
    IokaConfiguration? configuration,
    IokaTheme? theme,
    IokaTheme? darkTheme,
    Platform? platform,
  })  : _apiKey = apiKey,
        _configuration = configuration,
        _theme = theme,
        _darkTheme = darkTheme,
        _platform = platform;

  static void setup({
    required String apiKey,
    IokaConfiguration? configuration,
    IokaTheme? theme,
    IokaTheme? darkTheme,
    Platform? platform,
  }) {
    assert(_instance == null);

    _instance = Ioka._(
      apiKey: apiKey,
      configuration: configuration,
      theme: theme,
      darkTheme: darkTheme,
      platform: platform,
    );
  }

  static Ioka? _instance;

  static Ioka get instance {
    assert(_instance != null);
    return _instance!;
  }

  final String _apiKey;
  final IokaConfiguration? _configuration;
  final IokaTheme? _theme;
  final IokaTheme? _darkTheme;
  final Platform? _platform;

  IokaTheme? _resolveTheme(
    BuildContext context,
    IokaTheme? themeOverride,
    Brightness? brightnessOverride,
  ) {
    if (themeOverride != null) {
      return themeOverride;
    }

    final brightness =
        brightnessOverride ?? IokaThemeConversion.getBrightness(context);

    if (brightness == Brightness.light) {
      return _theme;
    }

    return _darkTheme;
  }

  Future<void> startCheckoutFlow({
    required BuildContext context,
    required String orderAccessToken,
    String? customerAccessToken,
    IokaTheme? theme,
    Brightness? brightness,
    Platform? platform,
    Locale? locale,
  }) async {
    final resolvedTheme = _resolveTheme(context, theme, brightness);
    final resolvedPlatform = platform ?? _platform;

    Navigator.of(context).pushWithViewWrapper(
      context,
      (context, platform) => ChangeNotifierProvider(
        create: (_) => CheckoutModel(),
        builder: (context, _) => const CupertinoCheckoutView(),
      ),
      platform: resolvedPlatform,
      theme: resolvedTheme,
      locale: locale,
    );
  }

  Future<void> startCheckoutWithSavedCardFlow() async {}

  Future<void> getCustomerCards() async {}
  Future<void> addCustomerCard() async {}
  Future<void> removeCustomerCard() async {}
}
