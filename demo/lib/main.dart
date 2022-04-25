import 'package:demo/api/api.dart';
import 'package:demo/models/settings_model.dart';
import 'package:demo/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ioka/ioka.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';

Future<void> main() async {
  await dotenv.load();

  Ioka.setup(
    apiKey: dotenv.env['PUBLIC_API_KEY'] ?? '',
    applePayConfiguration: ApplePayConfiguration(
      merchantName: 'Ioka',
      merchantIdentifier: 'merchant.kz.ioka',
      countryCode: 'kz',
    ),
    googlePayConfiguration: GooglePayConfiguration(
      merchantName: 'Ioka',
      merchantIdentifier: 'merchant.kz.ioka',
      countryCode: 'kz',
    ),
  );

  DemoApi.setup(
    baseUrl: dotenv.env['DEMO_API_BASE_URL'] ?? '',
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
