import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class IokaGooglePayButton extends StatelessWidget {
  const IokaGooglePayButton({
    Key? key,
    required this.onPressed,
    this.radius,
    this.type,
    this.style,
  }) : super(key: key);

  final VoidCallback onPressed;
  final BorderRadius? radius;
  final GooglePayButtonType? type;
  final GooglePayButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final _brightnessStyle = Theme.of(context).brightness == Brightness.light
        ? GooglePayButtonStyle.black
        : GooglePayButtonStyle.white;

    return ClipRRect(
      borderRadius: radius,
      child: RawGooglePayButton(
        onPressed: onPressed,
        style: style ?? _brightnessStyle,
        type: type ?? GooglePayButtonType.plain,
      ),
    );
  }
}
