import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

class IokaCupertinoProgressButton extends StatelessWidget {
  const IokaCupertinoProgressButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Future Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoProgressButton(
      borderRadius: context.themeExtras.borderRadius,
      onPressed: onPressed,
      color: context.colors.primary,
      disabledColor:
          onPressed != null ? context.colors.primary : context.colors.grey,
      foregroundColor: context.colors.onPrimary,
      disabledForegroundColor: context.colors.onPrimary,
      successColor: context.colors.success,
      successForegroundColor: context.colors.fill0,
      child: child,
    );
  }
}

class CupertinoProgressButton extends StatefulWidget {
  const CupertinoProgressButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color,
    this.disabledColor,
    this.foregroundColor,
    this.disabledForegroundColor,
    this.borderRadius,
    this.successColor,
    this.successForegroundColor,
  }) : super(key: key);

  final Widget child;
  final Future Function()? onPressed;
  final Color? color;
  final Color? disabledColor;
  final Color? foregroundColor;
  final Color? disabledForegroundColor;
  final Color? successColor;
  final Color? successForegroundColor;
  final BorderRadius? borderRadius;

  @override
  _CupertinoProgressButtonState createState() =>
      _CupertinoProgressButtonState();
}

class _CupertinoProgressButtonState extends State<CupertinoProgressButton> {
  bool _isInProgress = false;
  bool _isSuccessful = false;

  bool get _canPress =>
      !_isInProgress && !_isSuccessful && widget.onPressed != null;

  _ProgressState get _state {
    if (_isSuccessful) {
      return _ProgressState.success;
    } else if (_isInProgress) {
      return _ProgressState.inProgress;
    } else {
      return _ProgressState.idle;
    }
  }

  Future<void> _onPressed() async {
    setState(() {
      _isInProgress = true;
    });

    try {
      final result = await widget.onPressed!();

      if (result is bool && result) {
        _isSuccessful = true;
      }
    } catch (e) {
      // Errors are handled in [onPressed].
    }

    if (mounted) {
      setState(() {
        _isInProgress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var color = widget.color;

    if (_isSuccessful) {
      color = widget.successColor;
    } else if (_isInProgress) {
      color = widget.color;
    } else if (widget.onPressed == null) {
      color = widget.disabledColor;
    }

    color ??= CupertinoTheme.of(context).primaryColor;

    var foregroundColor =
        _isSuccessful ? widget.successForegroundColor : widget.foregroundColor;

    if (!_canPress) {
      foregroundColor = widget.disabledForegroundColor;
    }

    foregroundColor ??= widget.foregroundColor;

    const animationDuration = Duration(milliseconds: 150);
    const animationCurve = Curves.easeInOut;

    return LerpImplicitAnimationWidget<Color>(
      value: color,
      builder: (context, color) => CupertinoButton(
        onPressed: _canPress ? _onPressed : null,
        color: color,
        disabledColor: color,
        borderRadius: widget.borderRadius,
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: foregroundColor,
          ),
          child: Stack(
            children: [
              Center(
                child: AnimatedOpacity(
                  opacity: _state == _ProgressState.idle ? 1.0 : 0.0,
                  duration: animationDuration,
                  curve: animationCurve,
                  child: widget.child,
                ),
              ),
              Center(
                child: AnimatedOpacity(
                  opacity: _state == _ProgressState.inProgress ? 1.0 : 0.0,
                  duration: animationDuration,
                  curve: animationCurve,
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
              Center(
                child: AnimatedOpacity(
                  opacity: _state == _ProgressState.success ? 1.0 : 0.0,
                  duration: animationDuration,
                  curve: animationCurve,
                  child: Builder(
                    builder: (context) => const IokaIcon(
                      IokaIcons.check,
                      size: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _ProgressState {
  idle,
  inProgress,
  success,
}
