import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

Future<T?> showIokaDialog<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  AlignmentGeometry? alignment,
  WidgetBuilder? title,
  IokaTheme? theme,
  Platform? platform,
  Locale? locale,
}) {
  return Navigator.of(context).pushDialogWithAutomaticViewWrapper<T>(
    context,
    (context, platform) => _IokaDialogWidget(
      title: title,
      builder: builder,
      alignment: alignment,
    ),
    theme: theme,
    platform: platform,
    locale: locale,
  );
}

class _IokaDialogWidget extends StatelessWidget {
  const _IokaDialogWidget({
    Key? key,
    required this.builder,
    this.alignment,
    this.title,
  }) : super(key: key);

  final WidgetBuilder? title;
  final WidgetBuilder builder;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    late Widget body;

    if (title != null) {
      body = Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          left: 24.0,
          bottom: 24.0,
          right: 16.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: DefaultTextStyle(
                    style: context.typography.title,
                    child: title!(context),
                  ),
                ),
                SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: IconButton(
                    icon: IokaIcon(
                      IokaIcons.close,
                      color: context.colors.fill2,
                    ),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: builder(context),
            ),
          ],
        ),
      );
    } else {
      body = Padding(
        padding: const EdgeInsets.all(24.0),
        child: builder(context),
      );
    }

    return SafeArea(
      child: Dialog(
        insetPadding: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: context.themeExtras.borderRadius,
        ),
        alignment: alignment,
        elevation: 0,
        child: body,
      ),
    );
  }
}
