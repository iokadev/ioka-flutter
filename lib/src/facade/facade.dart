import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart' as generated;
import 'package:ioka/src/api/utils/access_token_helpers.dart';
import 'package:provider/provider.dart';

class Ioka {
  Ioka._({
    required this.api,
    required this.configuration,
    IokaTheme? theme,
    IokaTheme? darkTheme,
    Platform? platform,
  })  : _theme = theme,
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

    final apiMode = apiModeFromPublicKey(apiKey);

    final _configuration = IokaInternalConfiguration(
      mode: apiMode,
      automaticallyGenerateTheme:
          configuration?.automaticallyGenerateTheme ?? false,
    );

    _instance = Ioka._(
      api: IokaApi(
        apiKey: apiKey,
        baseUrl: _configuration.baseUrl,
      ),
      configuration: _configuration,
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

  final IokaInternalConfiguration configuration;
  final IokaApi api;
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
        brightnessOverride ?? IokaThemeUtils.getBrightness(context);

    final automaticallyGenerateTheme = configuration.automaticallyGenerateTheme;

    if (brightness == Brightness.light) {
      return automaticallyGenerateTheme
          ? _theme
          : _theme ?? IokaTheme.defaultLight;
    }

    return automaticallyGenerateTheme
        ? _darkTheme
        : _darkTheme ?? IokaTheme.defaultDark;
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
    final order = await api.getOrderById(
      orderAccessToken: orderAccessToken,
    );

    final resolvedTheme = _resolveTheme(context, theme, brightness);
    final resolvedPlatform = platform ?? _platform;

    Navigator.of(context).pushWithViewWrapper(
      context,
      (context, platform) => ChangeNotifierProvider(
        create: (_) => CheckoutWithNewCardModel(
          orderAccessToken: orderAccessToken,
          customerAccessToken: customerAccessToken,
          order: order,
        ),
        builder: (context, _) => const CupertinoCheckoutWithNewCardView(),
      ),
      platform: resolvedPlatform,
      theme: resolvedTheme,
      locale: locale,
    );
  }

  Future<void> startCheckoutWithSavedCardFlow({
    required BuildContext context,
    required String orderAccessToken,
    required String customerAccessToken,
    required SavedCard savedCard,
    IokaTheme? theme,
    Brightness? brightness,
    Platform? platform,
    Locale? locale,
  }) async {
    final order = await api.getOrderById(
      orderAccessToken: orderAccessToken,
    );

    final model = CheckoutWithSavedCardModel(
      order: order,
      orderAccessToken: orderAccessToken,
      savedCard: savedCard,
    );

    final resolvedTheme = _resolveTheme(context, theme, brightness);
    final resolvedPlatform = platform ?? _platform;

    if (savedCard.cvcRequired) {
      final cvc = await showCvcConfirmationDialog(
        context,
        model: model,
        theme: resolvedTheme,
        platform: resolvedPlatform,
        locale: locale,
      );
    }
  }

  Future<List<SavedCard>> getSavedCards({
    required String customerAccessToken,
  }) async {
    final cards = await api.getCards(customerAccessToken: customerAccessToken);
    return cards.map(SavedCard.fromExtendedCard).toList();
  }

  Future<SavedCard?> saveNewCard({
    required BuildContext context,
    required String customerAccessToken,
    IokaTheme? theme,
    Brightness? brightness,
    Platform? platform,
    Locale? locale,
  }) async {
    final resolvedTheme = _resolveTheme(context, theme, brightness);
    final resolvedPlatform = platform ?? _platform;

    final result = await Navigator.of(context).pushWithViewWrapper(
      context,
      (context, platform) => ChangeNotifierProvider(
        create: (_) => SaveCardModel(
          customerAccessToken: customerAccessToken,
        ),
        builder: (context, _) => const CupertinoSaveCardView(),
      ),
      platform: resolvedPlatform,
      theme: resolvedTheme,
      locale: locale,
    );

    if (result is! generated.ExtendedCard) {
      return null;
    }

    return SavedCard.fromExtendedCard(result);
  }

  Future<void> deleteSavedCard({
    required String customerAccessToken,
    required String cardId,
  }) async {
    await api.deleteCardById(
      cardId: cardId,
      customerAccessToken: customerAccessToken,
    );
  }
}
