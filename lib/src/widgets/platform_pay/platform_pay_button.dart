import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';
import 'package:ioka/src/api/generated/ioka_api.swagger.dart';
import 'package:ioka/src/widgets/platform_pay/apple_pay_button.dart';
import 'package:ioka/src/widgets/platform_pay/google_pay_button.dart';
import 'package:pay/pay.dart';

class IokaPlatformPayButton extends StatefulWidget {
  const IokaPlatformPayButton({
    Key? key,
    required this.order,
    required this.onPressed,
    this.placeholderBuilder,
    this.trailingBuilder,
    this.emptyBuilder,
    this.paymentItems,
    this.googlePayButtonStyle,
    this.googlePayButtonType,
    this.applePayButtonStyle,
    this.applePayButtonType,
    this.radius,
  }) : super(key: key);

  final OrderOut order;
  final void Function(PayProvider) onPressed;
  final GooglePayButtonStyle? googlePayButtonStyle;
  final GooglePayButtonType? googlePayButtonType;
  final ApplePayButtonStyle? applePayButtonStyle;
  final ApplePayButtonType? applePayButtonType;
  final List<PaymentItem>? paymentItems;
  final WidgetBuilder? placeholderBuilder;
  final WidgetBuilder? trailingBuilder;
  final WidgetBuilder? emptyBuilder;
  final BorderRadius? radius;

  @override
  State<IokaPlatformPayButton> createState() => _IokaPlatformPayButtonState();
}

class _IokaPlatformPayButtonState extends State<IokaPlatformPayButton> {
  List<PayProvider>? _availablePayProviders;

  @override
  void initState() {
    super.initState();

    _loadAvailablePayProviders();
  }

  Future<void> _loadAvailablePayProviders() async {
    _availablePayProviders = await Ioka.instance.getAvailablePayProviders();

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if (_availablePayProviders == null) {
      child = widget.placeholderBuilder != null
          ? widget.placeholderBuilder!(context)
          : null;
    } else if (_availablePayProviders!.isEmpty) {
      child =
          widget.emptyBuilder != null ? widget.emptyBuilder!(context) : null;
    } else if (_availablePayProviders!.contains(PayProvider.apple_pay)) {
      child = IokaApplePayButton(
        onPressed: () => widget.onPressed(PayProvider.apple_pay),
        type: widget.applePayButtonType,
        style: widget.applePayButtonStyle,
        radius: widget.radius,
      );
    } else if (_availablePayProviders!.contains(PayProvider.google_pay)) {
      child = IokaGooglePayButton(
        onPressed: () => widget.onPressed(PayProvider.google_pay),
        type: widget.googlePayButtonType,
        style: widget.googlePayButtonStyle,
        radius: widget.radius,
      );
    }

    if (child == null) return const SizedBox.shrink();

    child = SizedBox(
      width: double.infinity,
      height: 50.0,
      child: child,
    );

    if (widget.trailingBuilder != null) {
      return Column(
        children: [
          child,
          widget.trailingBuilder!(context),
        ],
      );
    }

    return child;
  }
}
