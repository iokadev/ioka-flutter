import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CardTypeWidget extends StatelessWidget {
  const CardTypeWidget({
    Key? key,
    required this.cardType,
  }) : super(key: key);

  final CreditCardType? cardType;

  @override
  Widget build(BuildContext context) {
    final isVisible = cardType != null && cardType != CreditCardType.unknown;

    return SlideInAnimationWidget(
      isVisible: isVisible,
      child: isVisible
          ? CardWidget(
              child: Text(cardType.toString().split('.').last),
            )
          : const SizedBox.shrink(),
    );
  }
}
