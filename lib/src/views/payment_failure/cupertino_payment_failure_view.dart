import 'package:flutter/cupertino.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CupertinoPaymentFailureView extends StatelessWidget {
  const CupertinoPaymentFailureView({
    Key? key,
    this.reason,
  }) : super(key: key);

  final String? reason;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const IokaCupertinoNavigationBar(
        middle: SizedBox.shrink(),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: const Alignment(0.0, -0.3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const IokaIcon(
                        IokaIcons.failure,
                        size: 96.0,
                      ),
                      const SizedBox(height: 36.0),
                      Text(
                        context.l10n.paymentFailureViewLabel,
                        style: context.typography.heading,
                      ),
                      if (reason != null) ...[
                        const SizedBox(height: 8.0),
                        Text(
                          reason!,
                          textAlign: TextAlign.center,
                          style: context.typography.subtitle.copyWith(
                            color: context.colors.grey,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 56.0,
                child: CupertinoButton(
                  color: context.colors.primary,
                  borderRadius: context.themeExtras.borderRadius,
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(context.l10n.paymentFailureViewRetryAction),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
