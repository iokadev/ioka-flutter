import 'package:flutter/cupertino.dart';
import 'package:ioka/src/utils/currency_format.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class CupertinoPaymentSuccessView extends StatelessWidget {
  const CupertinoPaymentSuccessView({
    Key? key,
    required this.orderNumber,
    required this.orderAmount,
  }) : super(key: key);

  final String orderNumber;
  final int orderAmount;

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
                        IokaIcons.success,
                        size: 96.0,
                      ),
                      const SizedBox(height: 36.0),
                      Text(
                        'Заказ оплачен',
                        style: context.typography.heading.copyWith(
                          color: context.colors.success,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Text(
                        'Заказ №$orderNumber',
                        style: context.typography.subtitle.copyWith(
                          color: context.colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        formatTengeAmount(orderAmount),
                        style: context.typography.heading2,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 56.0,
                child: CupertinoButton(
                  child: Text('Понятно'),
                  color: context.colors.primary,
                  borderRadius: context.themeExtras.borderRadius,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
