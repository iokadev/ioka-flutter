import 'package:demo/widgets/amount_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ioka/ioka.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _amountNotifier = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    name: 'Набор керамики',
                    amount: amount,
                    image: AssetImage('assets/images/ceramics.jpeg'),
                    onAmountChanged: (v) => _amountNotifier.value = v,
                    onRemove: () {},
                    price: 100.0 * amount,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: SizedBox(
            width: double.infinity,
            height: 56.0,
            child: ElevatedButton(
              onPressed: () {
                Ioka.instance.startCheckoutFlow(
                  context: context,
                  orderAccessToken: '',
                  amount: (100000 * _amountNotifier.value).round(),
                );
              },
              child: const Text('Перейти к оформлению'),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0.0),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${MaterialLocalizations.of(context).formatDecimal(price.round())} ₸',
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
