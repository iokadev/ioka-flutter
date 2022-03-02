import 'package:flutter/widgets.dart';
import 'package:ioka/ioka.dart';

class CardTypeIcon extends StatelessWidget {
  const CardTypeIcon({
    Key? key,
    required this.type,
    this.size,
  }) : super(key: key);

  final String type;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return IokaIcon('card_types/$type', size: size);
  }
}
