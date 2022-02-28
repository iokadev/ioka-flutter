import 'package:flutter/cupertino.dart';
import 'package:ioka/ioka.dart';

Future<bool> showCupertinoPaymentFailureDialog(
  BuildContext context, {
  String? reason,
}) async {
  final result = await showIokaDialog(
    context,
    builder: (_) => _CupertinoPaymentFailureDialogBody(reason: reason),
  );

  if (result != null && result) {
    return true;
  }

  return false;
}

class _CupertinoPaymentFailureDialogBody extends StatelessWidget {
  const _CupertinoPaymentFailureDialogBody({
    Key? key,
    this.reason,
  }) : super(key: key);

  final String? reason;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const IokaIcon(
          IokaIcons.failure,
          size: 56.0,
        ),
        const SizedBox(height: 24.0),
        Text(
          context.l10n.paymentFailureDialogTitle,
          style: context.typography.title,
        ),
        if (reason != null) ...[
          const SizedBox(height: 8.0),
          Text(
            reason!,
            style: context.typography.caption.copyWith(
              color: context.colors.grey,
            ),
          ),
        ],
        const SizedBox(height: 24.0),
        CupertinoButton.filled(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(context.l10n.paymentFailureDialogRetryAction),
        ),
      ],
    );
  }
}
