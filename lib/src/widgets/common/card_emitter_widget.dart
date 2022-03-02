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
    final isVisible = cardEmitter != null &&
        cardEmitter!.isNotEmpty &&
        CardEmitterIcons.values.contains(cardEmitter);

    return SlideInAnimationWidget(
      isVisible: isVisible,
      child: isVisible
          ? CardWidget(
              child: CardEmitterIcon(emitter: cardEmitter!),
            )
          : const SizedBox.shrink(),
    );
  }
}
