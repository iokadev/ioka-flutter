import 'package:flutter/widgets.dart';

/// Позволяет анимировать значения типа [T]. Тип [T] должен иметь функцию
/// линейной интерполяции (например, [Color.lerp]).
class LerpImplicitAnimationWidget<T> extends StatefulWidget {
  /// Создает новый экземпляр [LerpImplicitAnimationWidget].
  ///
  /// - [value] - текущее значение. При изменении [value] автоматически
  ///   запускается [Tween] со старого значения на новый
  /// - [builder] - строитель анимируемого виджета
  /// - [duration] - длительность анимации, по умолчанию `150мс`
  /// - [curve] - кривая анимации, по умолчанию `Curves.easeInOut`
  const LerpImplicitAnimationWidget({
    Key? key,
    required this.value,
    required this.builder,
    this.curve,
    this.duration,
  }) : super(key: key);

  /// Текущее значение анимации. При первом создании этого виджета значение
  /// анимации будет равно значению [value].
  final T value;

  /// Строитель анимируемого виджета.
  final Widget Function(BuildContext context, T value) builder;

  /// Длительность анимации.
  final Duration? duration;

  /// Кривая анимации.
  final Curve? curve;

  @override
  _LerpImplicitAnimationWidgetState<T> createState() =>
      _LerpImplicitAnimationWidgetState<T>();
}

class _LerpImplicitAnimationWidgetState<T>
    extends State<LerpImplicitAnimationWidget<T>> {
  Tween? _tween;

  void _buildTween(T oldValue) {
    // Для типа [Color] используется [ColorTween] из-за улучшенной
    // производительности.
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
    // В случае изменения виджета строим новый [Tween].
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
