import 'package:flutter/widgets.dart';

class LerpImplicitAnimationWidget<T> extends StatefulWidget {
  const LerpImplicitAnimationWidget({
    Key? key,
    required this.value,
    required this.builder,
    this.curve,
    this.duration,
  }) : super(key: key);

  final T value;
  final Widget Function(BuildContext context, T value) builder;
  final Duration? duration;
  final Curve? curve;

  @override
  _LerpImplicitAnimationWidgetState<T> createState() =>
      _LerpImplicitAnimationWidgetState<T>();
}

class _LerpImplicitAnimationWidgetState<T>
    extends State<LerpImplicitAnimationWidget<T>> {
  Tween? _tween;

  void _buildTween(T oldValue) {
    if (T == Color) {
      _tween = ColorTween(
        begin: oldValue as Color,
        end: widget.value as Color,
      );
    } else {
      _tween = Tween<T>(
        begin: oldValue,
        end: widget.value,
      );
    }
  }

  @override
  void didUpdateWidget(covariant LerpImplicitAnimationWidget<T> oldWidget) {
    _buildTween(oldWidget.value);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (_tween == null) {
      return widget.builder(context, widget.value);
    }

    return TweenAnimationBuilder(
      tween: _tween!,
      duration: widget.duration ?? const Duration(milliseconds: 150),
      curve: widget.curve ?? Curves.easeInOut,
      builder: (context, value, _) => widget.builder(context, value as T),
    );
  }
}
