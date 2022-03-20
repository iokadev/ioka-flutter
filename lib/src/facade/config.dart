import 'package:ioka/src/api/utils/access_token_helpers.dart';

enum IokaApiMode {
  staging,
  production,
}

/// Конфигурация SDK.
///
/// Доступные параметры:
///
/// - [automaticallyGenerateTheme] - если `true`, то в случае отсутствия темы
///   будет создавать тему автоматически из [context].
class IokaConfiguration {
  IokaConfiguration({
    this.automaticallyGenerateTheme = false,
  });

  /// Если `true`, то в случае отсутствия темы будет генерировать тему
  /// автоматически из [context].
  ///
  /// Подробнее можно прочитать в [IokaMaterialThemeGenerator] и
  /// [IokaCupertinoThemeGenerator].
  final bool automaticallyGenerateTheme;
}

/// Внутренняя конфигурация SDK.
///
/// Является копией [IokaConfiguration], и имеет дополнительную переменную
/// [IokaApiMode].
class IokaInternalConfiguration extends IokaConfiguration {
  IokaInternalConfiguration({
    required this.mode,
    bool automaticallyGenerateTheme = false,
  }) : super(automaticallyGenerateTheme: automaticallyGenerateTheme);

  /// Создаёт копию конфигурации из [IokaConfiguration] и публичного ключа.
  IokaInternalConfiguration.fromConfiguration(
    String apiKey,
    IokaConfiguration configuration,
  ) : this(
          mode: apiModeFromPublicKey(apiKey),
          automaticallyGenerateTheme: configuration.automaticallyGenerateTheme,
        );

  /// Текущий режим API - `production` или `staging`.
  final IokaApiMode mode;

  /// URL для запросов к API.
  String get baseUrl {
    switch (mode) {
      case IokaApiMode.staging:
        return 'https://stage-api.ioka.kz';
      case IokaApiMode.production:
        return 'https://api.ioka.kz';
    }
  }

  /// URL редиректа в случае 3D Secure.
  String get paymentConfirmationRedirectUrl {
    return 'https://ioka.kz';
  }
}
