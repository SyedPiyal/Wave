import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecom_wave/view/home/home_view.dart';
import 'package:ecom_wave/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import '../cart/cart_view.dart';
import '../order_list/order_list_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  /// widget list
  final List<Widget> bottomBarPages = [
    const MyHomePage(title: 'Home'),
    const OrderListView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: bottomBarPages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.transparent,
        color: Color(0xff0299a4),
        buttonBackgroundColor: Color(0xff0299a4),
        height: 60,
        items: const [
          Icon(Icons.home_filled, size: 24, color: Colors.white),
          Icon(Icons.list_alt_outlined, size: 24, color: Colors.white),
          Icon(Icons.shopping_cart, size: 24, color: Colors.white),
          Icon(Icons.person, size: 24, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
