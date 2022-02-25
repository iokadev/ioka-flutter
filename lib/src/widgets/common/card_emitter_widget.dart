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
    if (cardEmitter == null || cardEmitter == 'unknown') {
      return const SizedBox.shrink();
    }

    return CardWidget(
      child: Text(cardEmitter!),
    );
  }
}
