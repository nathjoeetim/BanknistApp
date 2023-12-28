import 'package:flutter/material.dart';
import 'package:opay_flutter/screen/finanace_screen.dart';
import 'package:opay_flutter/screen/home_page.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() {
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<BottomNavigation> {
  Widget activeScreen = const HomeScreen();
  int _selectedPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    _selectedPageIndex == 1
        ? activeScreen = const FinanceScreen()
        : _selectedPageIndex == 0
            ? activeScreen = const HomeScreen()
            : activeScreen = const Text("Welcome");

    return Scaffold(
      body: activeScreen,
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor: Colors.white10,
        inactiveIconColor: Colors.grey,
        waterDropColor: const Color.fromARGB(255, 59, 181, 108),
        iconSize: 34.6,
        bottomPadding: 3.9,
        barItems: [
          BarItem(
            filledIcon: Icons.home_outlined,
            outlinedIcon: Icons.add_home,
          ),
          BarItem(
            filledIcon: Icons.currency_bitcoin_outlined,
            outlinedIcon: Icons.monetization_on_outlined,
          ),
          BarItem(
            filledIcon: Icons.card_membership,
            outlinedIcon: Icons.credit_card,
          ),
          BarItem(
            filledIcon: Icons.account_circle,
            outlinedIcon: Icons.menu,
          ),
        ],
        selectedIndex: _selectedPageIndex,
        onItemSelected: (int index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
      ),
    );
  }
}
