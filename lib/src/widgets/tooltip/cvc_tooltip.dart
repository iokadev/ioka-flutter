import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

Future<void> showCvcTooltip(BuildContext context) {
  return showTooltip(
    context,
    builder: (_) => CvcTooltipWidget(hint: context.l10n.cvcTooltipHint),
  );
}

class CvcTooltipWidget extends StatelessWidget {
  const CvcTooltipWidget({
    Key? key,
    required this.hint,
  }) : super(key: key);

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const IokaIcon(IokaIcons.cvc),
          const SizedBox(width: 12.0),
          Text(hint),
        ],
      ),
    );
  }
}
