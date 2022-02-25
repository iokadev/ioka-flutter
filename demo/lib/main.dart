import 'package:demo/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

void main() {
  Ioka.setup(
    apiKey: '',
    configuration: IokaConfiguration(mode: IokaApiMode.staging),
  );

  runApp(const MyApp());
}

final _lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: const Color(0xFFF0F0F5),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF94AA64),
    secondary: Color(0xFF94AA64),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFFFFF),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFFFFFFFF),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Inter',
  scaffoldBackgroundColor: const Color(0xFF3B3B53),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF94AA64),
    secondary: Color(0xFF94AA64),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1A1A2B),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFFFFFFFF).withOpacity(0.08),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ioka Demo',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: ThemeMode.system,
      home: const MainPage(),
    );
  }
}
