import 'package:flutter/widgets.dart';

class SlideInAnimationWidget extends StatelessWidget {
  const SlideInAnimationWidget({
    Key? key,
    required this.child,
    required this.isVisible,
    this.offset = const Offset(0, 0.25),
  }) : super(key: key);

  final Widget child;
  final bool isVisible;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
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
