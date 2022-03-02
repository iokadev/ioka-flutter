import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';

class CardEmitterIcon extends StatelessWidget {
  const CardEmitterIcon({
    Key? key,
    required this.emitter,
    this.size,
  }) : super(key: key);

  final String emitter;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IokaIcon('card_emitters/$emitter', size: size);
  }
}
