import 'package:flutter/widgets.dart';
import 'package:ioka/src/widgets/theme/theme.dart';

abstract class IokaThemeGenerator<T> {
  T fromIokaTheme(IokaTheme theme);
  IokaTheme toIokaTheme(T theme);

  T? getAncestorTheme(BuildContext context);

  bool hasAncestorTheme(BuildContext context) {
    return getAncestorTheme(context) != null;
  }
}
