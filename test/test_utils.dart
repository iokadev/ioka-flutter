import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ioka/ioka.dart';

Widget necessaryAncestors({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}

Widget viewWrapper({
  required Widget child,
  Platform platform = Platform.cupertino,
  IokaTheme? theme,
  Locale? locale,
}) {
  return IokaViewWrapper(
    platform: platform,
    theme: theme ??
        IokaTheme.simpleLight(
          fontFamily: 'Inter',
        ),
    locale: locale ?? const Locale('ru'),
    child: child,
  );
}

extension IokaMockGrabber on IokaApi {
  MockIokaApi get asMock => this as MockIokaApi;
}
