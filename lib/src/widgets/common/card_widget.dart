import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.child,
    this.borderColor,
  }) : super(key: key);

  final Widget child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 16.0,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(
          color: borderColor ?? const Color(0xFFF0F0F5),
          width: 1.0,
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 10.0,
          color: Color(0xFF000000),
        ),
        child: child,
      ),
    );
  }
}
