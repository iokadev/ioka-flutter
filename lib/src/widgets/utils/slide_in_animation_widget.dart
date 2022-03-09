import 'package:flutter/widgets.dart';

/// Анимирует переданный [child] при изменении значения [isVisible].
/// Запускает анимацию с помощью [AnimatedSlide] и [AnimatedOpacity].
class SlideInAnimationWidget extends StatelessWidget {
  /// Создаёт новый экземпляр.
  /// 
  /// По умолчанию, значение [offset] равен `(0, 25%)` от размера [child].
  /// В случае больших виджетов, необходимо отрегулировать это значение.
  const SlideInAnimationWidget({
    Key? key,
    required this.child,
    required this.isVisible,
    this.offset = const Offset(0, 0.25),
  }) : super(key: key);

  /// Дочерний виджет, который нужно анимировать.
  final Widget child;

  /// Видимость дочернего виджета. При изменении значения запускается анимация.
  final bool isVisible;

  /// Смещение дочернего виджета относительно его собственного размера.
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    // TODO: переместить константные значения настроек анимации в IokaTheme
    const _duration = Duration(milliseconds: 150);
    const _curve = Curves.easeInOut;

    return AnimatedSlide(
      duration: _duration,
      curve: _curve,
      offset: isVisible ? Offset.zero : offset,
      child: AnimatedOpacity(
        duration: _duration,
        curve: _curve,
        opacity: isVisible ? 1 : 0,
        child: child,
      ),
    );
  }
}
