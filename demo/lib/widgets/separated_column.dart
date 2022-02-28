import 'package:flutter/material.dart';

class SeparatedColumn extends StatelessWidget {
  const SeparatedColumn({
    Key? key,
    required this.builder,
    required this.itemCount,
    this.separatorPadding = const EdgeInsets.only(left: 52.0),
  }) : super(key: key);

  final Widget Function(BuildContext context, int index, BorderRadius radius)
      builder;
  final int itemCount;
  final EdgeInsets separatorPadding;

  @override
  Widget build(BuildContext context) {
    const _radius = Radius.circular(12.0);

    const _borderRadius = BorderRadius.all(_radius);
    const _topBorderRadius = BorderRadius.vertical(top: _radius);
    const _centerBorderRadius = BorderRadius.zero;
    const _bottomBorderRadius = BorderRadius.vertical(bottom: _radius);

    final children = <Widget>[];

    for (var i = 0; i < itemCount; i++) {
      BorderRadius _radius;

      if (itemCount == 1) {
        _radius = _borderRadius;
      } else if (i == 0 && itemCount > 1) {
        _radius = _topBorderRadius;
      } else if (i == itemCount - 1) {
        _radius = _bottomBorderRadius;
      } else {
        _radius = _centerBorderRadius;
      }

      children.addAll([
        builder(context, i, _radius),
        Padding(
          padding: separatorPadding,
          child: const Divider(height: 1.0),
        ),
      ]);
    }

    children.removeLast();
    return Column(children: children);
  }
}
