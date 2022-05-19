import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';

/// Форматирует ошибку [e].
///
/// Необходимо иметь [IokaLocalization] в переданном [context].
String formatError(BuildContext context, Object e) {
  if (e is SocketException) {
    // ignore: lines_longer_than_80_chars
    return 'Ошибка подключения. Проверьте, пожалуйста, соединение с Интернетом.';
  }

  if (e is IokaError) {
    return e.message;
  }

  return e.toString();
}
