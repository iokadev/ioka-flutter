import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CardTypeWidget extends StatelessWidget {
  const CardTypeWidget({
    Key? key,
    required this.cardType,
  }) : super(key: key);

  final CreditCardType? cardType;

  String get cardTypeString => cardType.toString().split('.').last;

  @override
  Widget build(BuildContext context) {
    final isVisible = cardType != null && cardType != CreditCardType.unknown;

    return SlideInAnimationWidget(
      isVisible: isVisible,
      child: isVisible
          ? CardWidget(
              child: SvgPicture.asset(
                'lib/assets/icons/card_types/$cardTypeString.svg',
                package: 'ioka',
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
