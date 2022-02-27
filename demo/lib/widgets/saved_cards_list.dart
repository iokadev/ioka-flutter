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
    const _radius = Radius.circular(8.0);

    const _borderRadius = BorderRadius.all(_radius);
    const _topBorderRadius = BorderRadius.vertical(top: _radius);
    const _centerBorderRadius = BorderRadius.zero;
    const _bottomBorderRadius = BorderRadius.vertical(bottom: _radius);

    final children = <Widget>[];

    for (final card in cards) {
      children.addAll([
        CardRowWidget(
          padding: rowPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          borderRadius:
              children.isEmpty ? _topBorderRadius : _centerBorderRadius,
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
        ),
        const Padding(
          padding: EdgeInsets.only(left: 52.0),
          child: Divider(
            height: 1.0,
          ),
        ),
      ]);
    }

    if (trailingBuilder != null) {
      children.add(
        trailingBuilder!(
          context,
          children.isEmpty ? _borderRadius : _bottomBorderRadius,
        ),
      );
    }

    return Column(children: children);
  }
}
