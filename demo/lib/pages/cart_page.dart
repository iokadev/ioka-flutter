import 'package:demo/l10n/l10n.dart';
import 'package:demo/pages/checkout_page.dart';
import 'package:demo/widgets/amount_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _amountNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = DemoLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(l10n.cartPageTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _amountNotifier,
                    builder: (context, int amount, child) => _ItemCard(
                      id: '248241',
                      name: l10n.sampleItemName,
                      amount: amount,
                      image: const AssetImage('assets/images/ceramics.jpeg'),
                      onAmountChanged: (v) => _amountNotifier.value = v,
                      onRemove: () {},
                      price: 1000.0 * amount,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 56.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CheckoutPage(
                        amount: (1000.0 * _amountNotifier.value).round(),
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0.0),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(l10n.cartPageCheckoutAction),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  const _ItemCard({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.amount,
    required this.onAmountChanged,
    required this.price,
    required this.onRemove,
  }) : super(key: key);

  final String id;
  final String name;
  final ImageProvider image;
  final int amount;
  final ValueChanged<int> onAmountChanged;
  final double price;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = MaterialLocalizations.of(context);
    
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        id,
                        style: const TextStyle(
                          color: Color(0xFF9494A6),
                          fontSize: 14.0,
                          height: 20 / 14,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          height: 20 / 14,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      AmountDisplayWidget(
                        amount: amount,
                        onChanged: onAmountChanged,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: image,
                    width: 88.0,
                    height: 88.0,
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${l10n.formatDecimal(price.round())} ₸',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/trash.svg',
                      color: const Color(0xFFDE3030),
                    ),
                    onPressed: onRemove,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
