import 'dart:io';

import 'package:flutter/widgets.dart';

/// Форматирует ошибку [e].
///
/// Необходимо иметь [IokaLocalization] в переданном [context].
String formatError(BuildContext context, Object e) {
  if (e is SocketException) {
    return 'Ошибка подключения. Проверьте, пожалуйста, соединение с Интернетом.';
  }

  return (e as dynamic).message ?? e.toString();
}
