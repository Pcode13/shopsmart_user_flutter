import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopsmart_user/screens/cart/cart_screen.dart';
import 'package:shopsmart_user/screens/home_screen.dart';
import 'package:shopsmart_user/screens/profile_screen.dart';
import 'package:shopsmart_user/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  static const routeName = '/RootScreen';
  const RootScreen({super.key});

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen,
        elevation: 10,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.shopping_cart),
            icon: Badge(label: Text("6"), child: Icon(IconlyBold.bag2)),
            label: "Cart",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
