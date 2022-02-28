import 'package:demo/widgets/separated_column.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

import '../pages/profile_page.dart';

class SavedCardsList extends StatelessWidget {
  const SavedCardsList({
    Key? key,
    required this.cards,
    this.cardTrailingBuilder,
    this.onTap,
    this.trailingBuilder,
    this.rowPadding,
  }) : super(key: key);

  final List<SavedCard> cards;
  final Widget Function(BuildContext context, SavedCard card)?
      cardTrailingBuilder;
  final void Function(SavedCard card)? onTap;
  final Widget Function(BuildContext, BorderRadius)? trailingBuilder;

  final EdgeInsets? rowPadding;

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      itemCount: cards.length + (trailingBuilder != null ? 1 : 0),
      builder: (context, i, radius) {
        if (i == cards.length) {
          return trailingBuilder!(context, radius);
        }

        final card = cards[i];
        return CardRowWidget(
          padding: rowPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          borderRadius: radius,
          onTap: onTap != null ? () => onTap!(card) : null,
          leading: CardTypeWidget(
            cardType: card.cardType,
          ),
          trailing: cardTrailingBuilder != null
              ? cardTrailingBuilder!(context, card)
              : null,
          child: Text(
            card.formattedMaskedPan,
          ),
        );
      },
    );
  }
}
