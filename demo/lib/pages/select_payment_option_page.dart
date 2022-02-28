import 'package:demo/api/api.dart';
import 'package:demo/l10n/l10n.dart';
import 'package:demo/pages/profile_page.dart';
import 'package:demo/widgets/saved_cards_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

class SelectPaymentOptionPage extends StatefulWidget {
  const SelectPaymentOptionPage({
    Key? key,
    required this.paymentOption,
  }) : super(key: key);

  final dynamic paymentOption;

  @override
  State<SelectPaymentOptionPage> createState() =>
      _SelectPaymentOptionPageState();
}

class _SelectPaymentOptionPageState extends State<SelectPaymentOptionPage> {
  String? _customerAccessToken;
  List<SavedCard>? _cards;

  dynamic paymentOption;

  @override
  void initState() {
    super.initState();
    _loadSavedCards();

    paymentOption = widget.paymentOption;
  }

  Future<void> _loadSavedCards() async {
    try {
      _customerAccessToken = await DemoApi.instance.getProfile();
      _cards = await Ioka.instance.getSavedCards(
        customerAccessToken: _customerAccessToken!,
      );
    } catch (e) {
      // TODO: Show error

    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = DemoLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(l10n.paymentOptionPageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0) +
            MediaQuery.of(context).viewPadding.copyWith(top: 0.0),
        child: Column(
          children: [
            Expanded(
              child: _cards == null
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : Column(
                      children: [
                        if (_cards!.isNotEmpty) ...[
                          Card(
                            margin: EdgeInsets.zero,
                            child: SavedCardsList(
                              cards: _cards!,
                              onTap: (v) {
                                setState(() {
                                  paymentOption = v;
                                });
                              },
                              rowPadding: const EdgeInsets.only(left: 16.0),
                              cardTrailingBuilder: (context, card) => Radio(
                                value: card,
                                groupValue: paymentOption,
                                onChanged: (v) {
                                  setState(() {
                                    paymentOption = v;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                        ],
                        Card(
                          margin: EdgeInsets.zero,
                          child: CardRowWidget(
                            onTap: () => setState(() {
                              paymentOption = 'newCard';
                            }),
                            leading: IokaIcon(
                              IokaIcons.creditCard,
                              color: theme.textTheme.bodyText2?.color,
                            ),
                            padding: const EdgeInsets.only(left: 16.0),
                            trailing: Radio(
                              value: 'newCard',
                              groupValue: paymentOption,
                              onChanged: (v) {
                                setState(() {
                                  paymentOption = v;
                                });
                              },
                            ),
                            child: Text(l10n.cardPaymentMethod),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Card(
                          margin: EdgeInsets.zero,
                          child: CardRowWidget(
                            onTap: () => setState(() {
                              paymentOption = 'cash';
                            }),
                            leading: IokaIcon(
                              IokaIcons.cash,
                              color: theme.disabledColor,
                            ),
                            padding: const EdgeInsets.only(left: 16.0),
                            trailing: Radio(
                              value: 'cash',
                              groupValue: paymentOption,
                              onChanged: (v) {
                                setState(() {
                                  paymentOption = v;
                                });
                              },
                            ),
                            child: Text(l10n.cashPaymentMethod),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(paymentOption);
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0.0),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(l10n.paymentOptionPageSaveAction),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
