import 'package:flutter/widgets.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CardEmitterWidget extends StatelessWidget {
  const CardEmitterWidget({
    Key? key,
    required this.cardEmitter,
  }) : super(key: key);

  final String? cardEmitter;

  @override
  Widget build(BuildContext context) {
    final isVisible = cardEmitter != null && cardEmitter!.isNotEmpty;

    return SlideInAnimationWidget(
      isVisible: isVisible,
      child: isVisible
          ? CardWidget(
              child: Text(cardEmitter!),
            )
          : const SizedBox.shrink(),
    );
  }
}
