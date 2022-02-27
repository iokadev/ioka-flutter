import 'package:demo/api/api.dart';
import 'package:demo/pages/profile_page.dart';
import 'package:demo/pages/select_payment_option_page.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
    required this.amount,
  }) : super(key: key);

  final int amount;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  dynamic _paymentOption;

  Widget _buildPaymentOption(BuildContext context) {
    final theme = Theme.of(context);

    late Widget leading;
    late Widget child;

    if (_paymentOption == null) {
      leading = IokaIcon(
        IokaIcons.creditCardAlt,
        color: theme.disabledColor,
      );
      child = Text(
        'Выберите способ оплаты',
        style: theme.textTheme.subtitle1!.copyWith(
          color: theme.disabledColor,
        ),
      );
    } else if (_paymentOption == 'cash') {
      leading = IokaIcon(
        IokaIcons.cash,
        color: theme.disabledColor,
      );
      child = Text('Наличными курьеру');
    } else if (_paymentOption == 'newCard') {
      leading = IokaIcon(
        IokaIcons.creditCard,
        color: theme.textTheme.bodyText2?.color,
      );
      child = Text('Банковской картой');
    } else if (_paymentOption is SavedCard) {
      final _card = _paymentOption as SavedCard;
      leading = CardTypeWidget(
        cardType: _card.cardType,
      );
      child = Text(_card.formattedMaskedPan);
    }

    return CardRowWidget(
      onTap: () async {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SelectPaymentOptionPage(
              paymentOption: _paymentOption,
            ),
          ),
        );

        if (result != null) {
          setState(() => _paymentOption = result);
        }
      },
      borderRadius: BorderRadius.circular(12.0),
      leading: leading,
      trailing: IokaIcon(
        IokaIcons.angleRight,
        color: theme.disabledColor,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text('Оформление заказа'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Набор керамики',
                    style: theme.textTheme.bodyText2?.copyWith(
                      color: theme.disabledColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/images/ceramics.jpeg',
                      width: 120.0,
                      height: 120.0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '${MaterialLocalizations.of(context).formatDecimal(widget.amount)} ₸',
                    style: theme.textTheme.headline3,
                  ),
                  const SizedBox(height: 24),
                  Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        CardRowWidget(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(8.0),
                          ),
                          leading: IokaIcon(
                            IokaIcons.location,
                            color: theme.disabledColor,
                          ),
                          trailing: IokaIcon(
                            IokaIcons.angleRight,
                            color: theme.disabledColor,
                          ),
                          child: const Text('улица Абая, 328'),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 52.0),
                          child: Divider(height: 1),
                        ),
                        CardRowWidget(
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(8.0),
                          ),
                          leading: IokaIcon(
                            IokaIcons.time,
                            color: theme.disabledColor,
                          ),
                          trailing: IokaIcon(
                            IokaIcons.angleRight,
                            color: theme.disabledColor,
                          ),
                          child: const Text('14 февраля, 15:00'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    margin: EdgeInsets.zero,
                    child: _buildPaymentOption(context),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 56.0,
                child: CupertinoProgressButton(
                  onPressed: _paymentOption != null
                      ? () async {
                          final _amount = widget.amount * 100;

                          final tokens = await DemoApi.instance.checkout(
                            amount: _amount,
                          );

                          if (_paymentOption == 'newCard') {
                            await Ioka.instance.startCheckoutFlow(
                              context: context,
                              orderAccessToken: tokens.orderAccessToken,
                              customerAccessToken: tokens.customerAccessToken,
                            );
                          } else if (_paymentOption is SavedCard) {
                            await Ioka.instance.startCheckoutWithSavedCardFlow(
                              context: context,
                              orderAccessToken: tokens.orderAccessToken,
                              customerAccessToken: tokens.customerAccessToken,
                              savedCard: _paymentOption,
                            );
                          }
                        }
                      : null,
                  color: theme.colorScheme.primary,
                  disabledColor: theme.disabledColor,
                  borderRadius: BorderRadius.circular(12.0),
                  child: Text(
                    'Оформить',
                    style: theme.textTheme.button?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
