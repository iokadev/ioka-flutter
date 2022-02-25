import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 16.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 10.0,
          color: Colors.black,
        ),
        child: child,
      ),
    );
  }
}
