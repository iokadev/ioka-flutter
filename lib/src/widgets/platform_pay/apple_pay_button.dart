import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';
import 'package:pay/pay.dart';

class IokaApplePayButton extends StatelessWidget {
  const IokaApplePayButton({
    Key? key,
    required this.onPressed,
    this.radius,
    this.type,
    this.style,
  }) : super(key: key);

  final VoidCallback onPressed;
  final BorderRadius? radius;
  final ApplePayButtonType? type;
  final ApplePayButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final _brightnessStyle = Theme.of(context).brightness == Brightness.light
        ? ApplePayButtonStyle.black
        : ApplePayButtonStyle.white;

    return ClipRRect(
      borderRadius: radius,
      child: RawApplePayButton(
        onPressed: onPressed,
        style: style ?? _brightnessStyle,
        type: type ?? ApplePayButtonType.plain,
      ),
    );
  }
}
