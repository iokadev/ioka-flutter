import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/src/facade/config.dart';
import 'package:ioka/src/widgets/theme/theme.dart';

class Ioka {
  Ioka._({
    required String apiKey,
    IokaConfiguration? configuration,
    IokaTheme? theme,
    IokaTheme? darkTheme,
  })  : _apiKey = apiKey,
        _configuration = configuration,
        _theme = theme,
        _darkTheme = darkTheme;

  static Future<void> setup({
    required String apiKey,
    IokaConfiguration? configuration,
    IokaTheme? theme,
    IokaTheme? darkTheme,
  }) async {
    _instance = Ioka._(
      apiKey: apiKey,
      configuration: configuration,
      theme: theme,
      darkTheme: darkTheme,
    );
  }

  static Ioka? _instance;
  Ioka? get instance => _instance;

  final String _apiKey;
  final IokaConfiguration? _configuration;
  final IokaTheme? _theme;
  final IokaTheme? _darkTheme;

  Future<void> startPayWithCardFlow({
    required BuildContext context,
    required String orderAccessToken,
    String? customerAccessToken,
    IokaTheme? theme,
    Brightness? brightness,
  }) async {}
}
