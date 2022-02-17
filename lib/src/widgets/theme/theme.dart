import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:ioka/src/widgets/theme/theme_inherited_widget.dart';

class IokaTheme {
  IokaTheme({
    this.fontFamily,
    this.accentColor,
  });

  factory IokaTheme.fromMaterialTheme({required BuildContext context}) {
    final theme = material.Theme.of(context);

    return IokaTheme(
      fontFamily: theme.textTheme.bodyText2?.fontFamily,
      accentColor: theme.colorScheme.primary,
    );
  }

  factory IokaTheme.fromCupertinoTheme({required BuildContext context}) {
    final theme = cupertino.CupertinoTheme.of(context);

    return IokaTheme(
      fontFamily: theme.textTheme.textStyle.fontFamily,
      accentColor: theme.primaryColor,
    );
  }

  final String? fontFamily;
  final Color? accentColor;

  static IokaTheme of(BuildContext context) {
    final ancestor =
        context.dependOnInheritedWidgetOfExactType<IokaThemeInheritedWidget>();

    return ancestor!.theme;
  }

  static IokaTheme? maybeOf(BuildContext context) {
    final ancestor =
        context.dependOnInheritedWidgetOfExactType<IokaThemeInheritedWidget>();

    return ancestor?.theme;
  }
}
