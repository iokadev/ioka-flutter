import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  var _themeMode = ThemeMode.system;
  var _locale = const Locale('ru');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  String get localeName => localeToName(locale);

  Brightness get brightness =>
      _themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
}

String localeToName(Locale locale) {
  switch (locale.languageCode) {
    case 'ru':
      return 'Русский';
    case 'en':
      return 'English';
    case 'kk':
      return 'Қазақша';
    default:
      return locale.languageCode;
  }
}
