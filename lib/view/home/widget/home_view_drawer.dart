import 'package:ecom_wave/view/cart/cart_view.dart';
import 'package:ecom_wave/view/favorites/favorites_view.dart';
import 'package:ecom_wave/view/order_list/order_list_view.dart';
import 'package:flutter/material.dart';
import '../../bottom_navigation/bottom_navigation_view.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff0299a4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/image/iv_profile.jpg"),
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text(
                  'Arik',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'arik@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),

          //home icon
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context) => const BottomNavigation(),
                ),
              );
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),

          ),

          //order list icon
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context) => const OrderListView(),
                ),
              );
            },
            leading: const Icon(Icons.list_alt_rounded),
            title: const Text('Order List'),

          ),

          //favorites icon
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context) => const FavoritesView(),
                ),
              );
            },
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favorites List'),

          ),

          //cart icon

          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context) => const CartView(),
                ),
              );
            },
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart List'),

          ),

          /*//info icon

          ListTile(
            onTap: () {
              // Handle item  tap
            },
            leading: const Icon(Icons.info),
            title: const Text('About Us'),

          ),*/

        ],
      ),
    );
  }
}
