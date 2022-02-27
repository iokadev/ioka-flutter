import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class TransactionsSecureLabelWidget extends StatelessWidget {
  const TransactionsSecureLabelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.0,
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: IokaIcon(
                IokaIcons.security,
                color: context.colors.success,
              ),
            ),
            TextSpan(text: ' ${context.l10n.transactionsSecureLabel}'),
          ],
        ),
        style: context.typography.body.copyWith(
          color: context.colors.success,
        ),
      ),
    );
  }
}
