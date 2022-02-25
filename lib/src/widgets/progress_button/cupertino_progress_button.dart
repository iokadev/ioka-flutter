import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoProgressButton extends StatefulWidget {
  const CupertinoProgressButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color,
    this.disabledColor,
    this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final Future Function()? onPressed;
  final Color? color;
  final Color? disabledColor;
  final BorderRadius? borderRadius;

  @override
  _CupertinoProgressButtonState createState() =>
      _CupertinoProgressButtonState();
}

class _CupertinoProgressButtonState extends State<CupertinoProgressButton> {
  bool _isInProgress = false;

  bool get _canPress => !_isInProgress && widget.onPressed != null;
  Future<void> _onPressed() async {
    setState(() {
      _isInProgress = true;
    });

    await widget.onPressed!();

    setState(() {
      _isInProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: _canPress ? _onPressed : null,
      color: widget.color,
      disabledColor:
          widget.disabledColor ?? CupertinoColors.quaternarySystemFill,
      borderRadius: widget.borderRadius,
      child: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: _isInProgress ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              child: widget.child,
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _isInProgress ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              child: Builder(
                builder: (context) => SizedBox(
                  width: 18.0,
                  height: 18.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    color: DefaultTextStyle.of(context).style.color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
