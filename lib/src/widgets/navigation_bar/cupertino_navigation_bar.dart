import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CupertinoBackButton extends StatelessWidget {
  const CupertinoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: IokaIcon(
        IokaIcons.close,
        color: context.theme.colors.textPrimary,
      ),
      onPressed: () => Navigator.maybePop(context),
    );
  }
}

class IokaCupertinoNavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const IokaCupertinoNavigationBar({
    Key? key,
    required this.middle,
  }) : super(key: key);

  final Widget middle;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final padding = mediaQuery.padding.copyWith(bottom: 0.0);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.theme.brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
          : SystemUiOverlayStyle.light,
      child: Container(
        color: context.colors.background,
        height: preferredSize.height + padding.vertical,
        padding: padding,
        child: Stack(
          children: [
            SizedBox(
              width: preferredSize.height,
              height: preferredSize.height,
              child: const CupertinoBackButton(),
            ),
            Align(
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: context.typography.title,
                child: middle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
