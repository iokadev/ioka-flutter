import 'package:flutter/material.dart';

class AmountDisplayWidget extends StatelessWidget {
  const AmountDisplayWidget({
    Key? key,
    required this.amount,
    required this.onChanged,
  }) : super(key: key);

  final int amount;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _AmountDisplayWidgetButton(
          child: const Text('-'),
          onPressed: amount > 1 ? () => onChanged(amount - 1) : null,
        ),
        const SizedBox(width: 12.0),
        Text('$amount'),
        const SizedBox(width: 12.0),
        _AmountDisplayWidgetButton(
          child: const Text('+'),
          onPressed: () => onChanged(amount + 1),
        ),
      ],
    );
  }
}

class _AmountDisplayWidgetButton extends StatelessWidget {
  const _AmountDisplayWidgetButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(4.0);

    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: theme.brightness == Brightness.light
              ? const Color(0xFFF0F0F5)
              : const Color.fromRGBO(255, 255, 255, 0.08),
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: radius,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                color: onPressed != null
                    ? theme.textTheme.bodyText1?.color
                    : theme.disabledColor,
                fontSize: 16.0,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
