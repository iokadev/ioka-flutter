import 'package:demo/api/api.dart';
import 'package:demo/models/settings_model.dart';
import 'package:demo/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

import 'api/secrets.dart';
import 'l10n/l10n.dart';

void main() {
  Ioka.setup(
    apiKey: Secrets.publicApiKey,
  );

  DemoApi.setup(
    baseUrl: Secrets.baseUrl,
  );

  runApp(MyApp());
}

const _defaultLightColors = IokaThemeColors.defaultLight;
const _defaultDarkColors = IokaThemeColors.defaultDark;

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _materialGenerator = IokaMaterialThemeGenerator();

  ThemeData get _lightTheme => _materialGenerator
      .fromIokaTheme(IokaTheme.simpleLight(
        primaryColor: _defaultLightColors.secondary,
      ))
      .copyWith(
        scaffoldBackgroundColor: _defaultLightColors.fill5,
      );

  ThemeData get _darkTheme => _materialGenerator
      .fromIokaTheme(IokaTheme.simpleDark(
        primaryColor: _defaultLightColors.secondary,
      ))
      .copyWith(
        scaffoldBackgroundColor: _defaultDarkColors.fill5,
      );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return ChangeNotifierProvider(
      create: (_) => SettingsModel(),
      builder: (context, _) => MaterialApp(
        title: 'Ioka Demo',
        theme: _lightTheme,
        darkTheme: _darkTheme,
        localizationsDelegates: const [
          DemoLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: context.watch<SettingsModel>().locale,
        supportedLocales: IokaLocalizations.localizations.keys.toList(),
        themeMode: context.watch<SettingsModel>().themeMode,
        home: const MainPage(),
      ),
    );
  }
}
