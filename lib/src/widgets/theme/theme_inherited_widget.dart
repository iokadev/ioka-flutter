import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
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

class IokaAutomaticThemeProvider extends StatelessWidget {
  const IokaAutomaticThemeProvider({
    Key? key,
    required this.theme,
    required this.fallback,
    required this.child,
  }) : super(key: key);

  final IokaTheme? theme;
  final IokaTheme fallback;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    IokaTheme? _theme;
    material.ThemeData? _materialTheme;
    cupertino.CupertinoThemeData? _cupertinoTheme;

    final _materialThemeGenerator = IokaMaterialThemeGenerator();
    final _cupertinoThemeGenerator = IokaCupertinoThemeGenerator();

    if (theme != null) {
      _theme = theme;
    } else {
      _materialTheme = _materialThemeGenerator.getAncestorTheme(context);
      _cupertinoTheme = _cupertinoThemeGenerator.getAncestorTheme(context);

      if (_cupertinoTheme != null) {
        _theme = _cupertinoThemeGenerator.toIokaTheme(_cupertinoTheme);
      }

      if (_materialTheme != null) {
        _theme = _materialThemeGenerator.toIokaTheme(_materialTheme);
      }
    }

    _theme ??= fallback;

    return material.Theme(
      data: _materialThemeGenerator.fromIokaTheme(_theme),
      child: cupertino.CupertinoTheme(
        data: _cupertinoThemeGenerator.fromIokaTheme(_theme),
        child: IokaThemeInheritedWidget(
          theme: _theme,
          child: material.Material(
            type: material.MaterialType.transparency,
            child: child,
          ),
        ),
      ),
    );
  }
}

extension IokaThemeGetter on BuildContext {
  IokaTheme get theme => IokaTheme.of(this);
  IokaThemeColors get colors => theme.colors;
  IokaThemeTypography get typography => theme.typography;
  IokaThemeExtras get themeExtras => theme.extras;
}
