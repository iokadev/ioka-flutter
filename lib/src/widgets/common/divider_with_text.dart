import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
    this.dividerColor,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: dividerColor),
      child: Row(
        children: [
          Expanded(child: Divider(height: 1.0, color: dividerColor)),
          Padding(padding: padding, child: child),
          Expanded(child: Divider(height: 1.0, color: dividerColor)),
        ],
      ),
    );
  }
}
