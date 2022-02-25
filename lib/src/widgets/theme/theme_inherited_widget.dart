import 'package:flutter/widgets.dart';
import 'package:ioka/src/widgets/theme/theme.dart';

class IokaThemeInheritedWidget extends InheritedWidget {
  const IokaThemeInheritedWidget({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final IokaTheme theme;

  @override
  bool updateShouldNotify(covariant IokaThemeInheritedWidget oldWidget) =>
      oldWidget.theme != theme;
}

extension IokaThemeGetter on BuildContext {
  IokaTheme get theme => IokaTheme.of(this);
  IokaThemeColors get colors => theme.colors;
  IokaThemeTypography get typography => theme.typography;
  IokaThemeExtras get themeExtras => theme.extras;
}
