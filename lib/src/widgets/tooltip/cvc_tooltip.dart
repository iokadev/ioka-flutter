import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

Future<void> showCvcTooltip(BuildContext context) {
  return showTooltip(
    context,
    builder: (_) => const CvcTooltipWidget(),
  );
}

class CvcTooltipWidget extends StatelessWidget {
  const CvcTooltipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const IokaIcon(IokaIcons.cvc),
          const SizedBox(width: 12.0),
          Text(context.l10n.cvcTooltipHint),
        ],
      ),
    );
  }
}
