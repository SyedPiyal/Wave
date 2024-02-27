import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:ecom_wave/view/cart/cart_view.dart';
import 'package:ecom_wave/view/favorites/favorites_view.dart';
import 'package:ecom_wave/view/home/home_view.dart';
import 'package:ecom_wave/view/profile/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  //==============================
  // Controller to handle PageView and also handles initial page
  //==============================

  final _pageController = PageController(initialPage: 0);

  //==============================
  // Controller to handle bottom nav bar and also handles initial page
  //==============================

  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const MyHomePage(title: 'Home'),
    const FavoritesView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: Colors.white,
        showLabel: false,
        shadowElevation: 2,
        kBottomRadius: 28.0,
        // notchShader: const SweepGradient(
        //   startAngle: 0,
        //   endAngle: pi / 2,
        //   colors: [Colors.red, Colors.green, Colors.orange],
        //   tileMode: TileMode.mirror,
        // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
        notchColor: Colors.white,

        // restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.favorite_border,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.favorite,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 2',
          ),

          /*///svg example
          BottomBarItem(
            inActiveItem: SvgPicture.asset(
              'assets/search_icon.svg',
              color: Colors.blueGrey,
            ),
            activeItem: SvgPicture.asset(
              'assets/search_icon.svg',
              color: Colors.white,
            ),
            itemLabel: 'Page 3',
          ),*/
          BottomBarItem(
            inActiveItem: Icon(
              Icons.shopping_cart,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.shopping_cart,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 4',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 5',
          ),
        ],
        onTap: (index) {
          // perform action on tab change and to update pages you can update pages without pages
          // log('current selected index $index');
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      )
          : null,
    );
  }
}
