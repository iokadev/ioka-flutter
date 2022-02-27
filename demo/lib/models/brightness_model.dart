import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BrightnessModel extends ChangeNotifier {
  var _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  Brightness get brightness =>
      _themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
}
