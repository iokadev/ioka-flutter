import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';

Future<void> showTooltip(
  BuildContext context, {
  required WidgetBuilder builder,
}) async {
  Navigator.of(context).push(
    _TooltipRoute(
      outerContext: context,
      backgroundColor: context.colors.fill2,
      foregroundColor: context.colors.fill1,
      radius: context.themeExtras.borderRadius,
      builder: builder,
    ),
  );
}

class _TooltipRoute extends PopupRoute {
  _TooltipRoute({
    required this.outerContext,
    required this.builder,
    required this.backgroundColor,
    required this.foregroundColor,
    this.radius,
  });

  final BuildContext outerContext;
  final Color backgroundColor;
  final WidgetBuilder builder;
  final Color foregroundColor;
  final BorderRadius? radius;

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final tween = animation.drive(CurveTween(curve: Curves.easeInOut));
    return AnimatedBuilder(
      animation: tween,
      builder: (context, child) => Transform.translate(
        offset: Offset(0.0, 8.0 * (1.0 - tween.value)),
        child: Opacity(
          opacity: tween.value,
          child: child,
        ),
      ),
      child: _TooltipWidget(
        outerContext: outerContext,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        radius: radius,
        builder: builder,
      ),
    );
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);
}

class _TooltipWidget extends StatelessWidget {
  const _TooltipWidget({
    Key? key,
    required this.outerContext,
    required this.builder,
    required this.backgroundColor,
    required this.foregroundColor,
    this.radius,
  }) : super(key: key);

  final BuildContext outerContext;
  final Color backgroundColor;
  final Color foregroundColor;
  final WidgetBuilder builder;
  final BorderRadius? radius;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final renderBox = outerContext.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    final center = offset + Offset(size.width / 2, size.height / 2);

    final isDisplayedOnTop = center.dy > screenSize.height / 2;
    final isAnchoredToLeft = center.dx < screenSize.width / 2;

    return Stack(
      children: [
        Positioned(
          left: center.dx - 6.0,
          top: isDisplayedOnTop
              ? offset.dy - 8.0
              : offset.dy + size.height + 8.0,
          child: Transform.rotate(
            angle: isDisplayedOnTop ? pi * 1.25 : pi * 0.25,
            child: Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(2.0),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: isAnchoredToLeft ? center.dx - 24.0 : null,
          right:
              isAnchoredToLeft ? null : screenSize.width - (center.dx + 24.0),
          top: isDisplayedOnTop
              ? offset.dy - 8.0
              : offset.dy + size.height + 14.0,
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 48.0,
              minHeight: 24.0,
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: radius,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: DefaultTextStyle(
                style: TextStyle(color: foregroundColor),
                child: builder(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
