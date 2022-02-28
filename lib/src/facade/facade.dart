import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart' as generated;
import 'package:ioka/src/api/utils/access_token_helpers.dart';
import 'package:provider/provider.dart';

/// Главный класс Ioka SDK. Работает как "фасад" - т.е. мерчант-приложение
/// использует этот класс для любых взаимодействии с API Ioka.
///
/// Устроен как singleton - чтобы получить доступ к объекту, используйте
/// [Ioka.instance]. Перед этим не забудьте инициализировать SDK.
///
/// Для инициализации нужно вызвать [Ioka.setup()] и передать в него
/// настройки и ключ доступа к API.
///
/// Пример инициализации:
///
/// ```dart
/// void main() {
///   Ioka.setup('<API_KEY>');
///   runApp(...);
/// }
/// ```
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

  /// Инициализирует SDK.
  ///
  /// Аргументы:
  ///
  /// - [apiKey]: Ключ доступа к API. Режим сервера (production / staging)
  ///   определяется автоматически.
  ///
  /// - [configuration]: Опционально: конфигурация SDK. Смотрите
  ///
  ///   [IokaConfiguration] чтобы узнать подробнее о возможных настройках.
  ///
  /// - [theme]: Опционально: светлая тема SDK.
  ///
  /// - [darkTheme]: Опционально: тёмная тема SDK.
  ///
  /// - [platform]: Опционально: платформа (Material / Cupertino). В случае
  ///   если [platform == null], определяется автоматически.
  ///
  /// Чтобы узнать подробнее о кастомизации темы, смотрите [IokaTheme].
  ///
  /// Если [configuration.automaticallyGenerateTheme] равен `true` и
  /// [theme], [darkTheme] не заданы, то тема будет генерироваться автоматически
  /// при вызове методов [Ioka] из [BuildContext].
  static void setup({
    required String apiKey,
    IokaConfiguration? configuration,
    IokaTheme? theme,
    IokaTheme? darkTheme,
    Platform? platform,
  }) {
    assert(_instance == null);

    // Получаем режим API из публичного ключа.
    final apiMode = apiModeFromPublicKey(apiKey);

    // Создаём объект [IokaInternalConfiguration] - копия [IokaConfiguration],
    // но с [apiMode].
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

  /// Получает экземпляр класса [Ioka].
  ///
  /// Важно: перед вызовом необходимо удостовериться что SDK был инициализирован
  /// через [Ioka.setup()].
  static Ioka get instance {
    assert(_instance != null);
    return _instance!;
  }

  /// Конфигурация SDK. Содержит настройки, переданные в [Ioka.setup()] вместе
  /// с типом API.
  final IokaInternalConfiguration configuration;

  /// Экземпляр API. Используется для вызовов методов API.
  ///
  /// Эндпоинт сервера определяется автоматически при вызове [Ioka.setup()].
  final IokaApi api;

  /// Светлая тема SDK. По умолчанию не задана - используется метод
  /// [_resolveTheme] чтобы получить необходимую тему.
  final IokaTheme? _theme;

  /// Тёмная тема SDK. По умолчанию не задана - используется метод
  /// [_resolveTheme] чтобы получить необходимую тему.
  final IokaTheme? _darkTheme;

  /// "Платформа" (Material/Cupertino) SDK. Если значение равно `null`, то
  /// платформа определяется автоматически при вызове методов [Ioka] из
  /// [BuildContext].
  final Platform? _platform;

  /// Метод для получения темы, которая будет использоваться в SDK.
  ///
  /// Необходим [context] для получения яркости.
  ///
  /// Логика:
  ///
  /// - Если [themeOverride] не `null` - возвращает его.
  ///
  /// - Получает яркость - если [brightnessOverride] не `null` - использует
  ///   его, в противном случае использует яркость в текущем [context].
  ///
  /// - Для светлой темы: если [_theme] не `null`, то использует его. В
  ///   противном случае, если [configuration.automaticallyGenerateTheme] равен
  ///   `true`, то генерирует тему. Если `false`, то возвращает
  ///   `IokaTheme.defaultLight`.
  ///
  /// - То же самое для тёмной темы.
  ///
  /// Метод возвращает либо экземпляр [IokaTheme], либо [null] в случае если
  /// нужно сгенерировать тему автоматически.
  IokaTheme? _resolveTheme(
    BuildContext context,
    IokaTheme? themeOverride,
    Brightness? brightnessOverride,
  ) {
    if (themeOverride != null) {
      return themeOverride;
    }

    // Получаем яркость темы - если [brightnessOverride] равен `null`, то
    // получаем яркость из текущего [context].
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

  /// Начинает флоу оплаты.
  ///
  /// Инструкции можно прочитать в [doc/how-tos/checkout.md].
  ///
  /// Аргументы:
  ///
  /// - [context] - контекст вызова метода. Необходимо, чтобы в этом контексте
  ///   можно было получить [Theme] или [CupertinoTheme].
  ///
  /// - [orderAccessToken] - токен доступа к заказу. Необходим для получения
  ///   информации о заказе и оплаты.
  ///
  /// - [customerAccessToken] - опционально, токен доступа к пользователю. Если
  ///   задан, то при оплате можно будет привязать карту к пользователю.
  ///
  /// - [theme] - опционально, тема для отображения окна оплаты. Если не задана,
  ///   используется логика получения темы из [_resolveTheme].
  ///
  /// - [brightness] - опционально, яркость окна оплаты. Если не задана, то
  ///   яркость получается автоматически из [context].
  ///
  /// - [platform] - опционально, "платформа" виджетов (Material или Cupertino).
  ///   Если не задана, то получается автоматически из [context].
  ///
  /// - [locale] - опционально, локаль для окна оплаты. Если не задана, то
  ///   получается автоматически из [context].
  ///
  /// Возвращает:
  ///
  /// - Экземпляр [ExtendedPayment] - в случае успешной оплаты.
  ///
  /// - `null` - в случае отмены оплаты.
  ///
  /// В случае ошибки генерирует исключение типа [IokaError].
  Future<generated.ExtendedPayment?> startCheckoutFlow({
    required BuildContext context,
    required String orderAccessToken,
    String? customerAccessToken,
    IokaTheme? theme,
    Brightness? brightness,
    Platform? platform,
    Locale? locale,
  }) async {
    // Получаем заказ из [IokaApi].
    final order = await api.getOrderById(
      orderAccessToken: orderAccessToken,
    );

    // Получаем тему из метода [_resolveTheme] - подробная логика описана
    // в самом методе.
    final resolvedTheme = _resolveTheme(context, theme, brightness);
    final resolvedPlatform = platform ?? _platform;

    // Пушим страницу оплаты, оборачивая его в [ViewWrapper].
    // result - [ExtendedPayment?] или [IokaError].
    final result = await Navigator.of(context).pushWithViewWrapper(
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

    return result;
  }

  /// Начинает флоу оплаты сохраненной картой.
  ///
  /// Инструкции можно прочитать в [doc/how-tos/checkout.md].
  ///
  /// Аргументы:
  ///
  /// - [context] - контекст вызова метода. Необходимо, чтобы в этом контексте
  ///   можно было получить [Theme] или [CupertinoTheme].
  ///
  /// - [orderAccessToken] - токен доступа к заказу. Необходим для получения
  ///   информации о заказе и оплаты.
  ///
  /// - [savedCard] - экземпляр класса [SavedCard], содержит информацию
  ///   о сохраненной карте. Чтобы получить сохраненную карту, используйте
  ///   [getSavedCards].
  ///
  /// - [theme] - опционально, тема для отображения окна оплаты. Если не задана,
  ///   используется логика получения темы из [_resolveTheme].
  ///
  /// - [brightness] - опционально, яркость окна оплаты. Если не задана, то
  ///   яркость получается автоматически из [context].
  ///
  /// - [platform] - опционально, "платформа" виджетов (Material или Cupertino).
  ///   Если не задана, то получается автоматически из [context].
  ///
  /// - [locale] - опционально, локаль для окна оплаты. Если не задана, то
  ///   получается автоматически из [context].
  ///
  /// Возвращает:
  ///
  /// - Экземпляр [ExtendedPayment] - в случае успешной оплаты.
  ///
  /// - `null` - в случае отмены оплаты.
  ///
  /// В случае ошибки генерирует исключение типа [IokaError].
  Future<generated.ExtendedPayment?> startCheckoutWithSavedCardFlow({
    required BuildContext context,
    required String orderAccessToken,
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

    generated.ExtendedPayment? result;
    if (savedCard.cvcRequired) {
      result = await showCvcConfirmationDialog(
        context,
        model: model,
        theme: resolvedTheme,
        platform: resolvedPlatform,
        locale: locale,
      );
    } else {
      result = await model.submit(
        context,
        shouldPopRoute: false,
      );
    }

    return result;
  }

  /// Получает список сохраненных карт пользователя.
  /// 
  /// Инструкции можно прочитать в [doc/how-tos/save-and-delete-cards.md].
  /// 
  /// Аргументы:
  /// 
  /// - [customerAccessToken] - токен доступа к пользователю.
  /// 
  /// Возвращает:
  /// 
  /// - [List<SavedCard>] в случае успешного получения списка сохраненных карт.
  ///   Список может быть пустым.
  /// 
  /// В случае ошибки генерирует исключение типа [IokaError].
  Future<List<SavedCard>> getSavedCards({
    required String customerAccessToken,
  }) async {
    final cards = await api.getCards(customerAccessToken: customerAccessToken);
    return cards.map(SavedCard.fromExtendedCard).toList();
  }

  /// Начинает флоу сохранения карты.
  ///
  /// Инструкции можно прочитать в [doc/how-tos/save-and-delete-card.md].
  ///
  /// Аргументы:
  ///
  /// - [context] - контекст вызова метода. Необходимо, чтобы в этом контексте
  ///   можно было получить [Theme] или [CupertinoTheme].
  ///
  /// - [customerAccessToken] - токен доступа к пользователю.
  ///
  /// - [theme] - опционально, тема для отображения окна оплаты. Если не задана,
  ///   используется логика получения темы из [_resolveTheme].
  ///
  /// - [brightness] - опционально, яркость окна оплаты. Если не задана, то
  ///   яркость получается автоматически из [context].
  ///
  /// - [platform] - опционально, "платформа" виджетов (Material или Cupertino).
  ///   Если не задана, то получается автоматически из [context].
  ///
  /// - [locale] - опционально, локаль для окна оплаты. Если не задана, то
  ///   получается автоматически из [context].
  ///
  /// Возвращает:
  ///
  /// - Экземпляр [SavedCard] - в случае успешного сохранения карты.
  ///
  /// - `null` - в случае отмены флоу.
  ///
  /// В случае ошибки генерирует исключение типа [IokaError].
  Future<SavedCard?> startSaveNewCardFlow({
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

  /// Удаляет сохраненную карту у пользователя.
  /// 
  /// Инструкции можно прочитать в [doc/how-tos/save-and-delete-cards.md].
  /// 
  /// Аргументы:
  /// 
  /// - [customerAccessToken] - токен доступа к пользователю.
  /// 
  /// - [cardId] - идентификатор карты. Обычно это [SavedCard.id].
  /// 
  /// Ничего не возвращает - в случае успеха вызов срабатывает без исключении.
  /// 
  /// В случае ошибки генерирует исключение типа [IokaError].
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
