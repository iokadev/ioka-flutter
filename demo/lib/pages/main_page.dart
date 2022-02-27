import 'package:demo/pages/cart_page.dart';
import 'package:demo/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _selectedPageNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: _selectedPageNotifier,
      builder: (context, int selectedPage, child) => Scaffold(
        body: IndexedStack(
          index: selectedPage,
          children: const [
            CartPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (v) => _selectedPageNotifier.value = v,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/shopping_cart.svg',
                color: selectedPage == 0
                    ? theme.colorScheme.primary
                    : theme.disabledColor,
              ),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/smile.svg',
                color: selectedPage == 1
                    ? theme.colorScheme.primary
                    : theme.disabledColor,
              ),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }
}
