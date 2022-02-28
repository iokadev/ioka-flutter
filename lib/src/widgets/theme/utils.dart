import 'dart:ui';

import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';

class IokaThemeUtils {
  static final _materialThemeGenerator = IokaMaterialThemeGenerator();
  static final _cupertinoThemeGenerator = IokaCupertinoThemeGenerator();

  static Brightness getBrightness(BuildContext context) {
    final hasMaterial = _materialThemeGenerator.hasAncestorTheme(context);
    final hasCupertino = _cupertinoThemeGenerator.hasAncestorTheme(context);

    if (hasMaterial) {
      return material.Theme.of(context).brightness;
    } else if (hasCupertino) {
      return cupertino.CupertinoTheme.brightnessOf(context);
    }

    return Brightness.light;
  }

  static Platform getPlatform(BuildContext context) {
    if (_cupertinoThemeGenerator.hasAncestorTheme(context)) {
      return Platform.cupertino;
    }

    return Platform.material;
  }
}
