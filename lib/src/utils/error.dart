import 'dart:io';

import 'package:flutter/widgets.dart';

/// Форматирует ошибку [e].
///
/// Необходимо иметь [IokaLocalization] в переданном [context].
String formatError(BuildContext context, Object e) {
  if (e is SocketException) {
    // ignore: lines_longer_than_80_chars
    return 'Ошибка подключения. Проверьте, пожалуйста, соединение с Интернетом.';
  }

  return (e as dynamic).message ?? e.toString();
}
