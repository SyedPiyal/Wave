import 'package:flutter/material.dart';

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
              // Handle item  tap
            },
            leading: const Icon(Icons.home),
            title: const Text('Home'),

          ),

          //order list icon
          ListTile(
            onTap: () {
              // Handle item  tap
            },
            leading: const Icon(Icons.list_alt_rounded),
            title: const Text('Order List'),

          ),

          //favorites icon
          ListTile(
            onTap: () {
              // Handle item  tap
            },
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favorites List'),

          ),

          //cart icon

          ListTile(
            onTap: () {
              // Handle item  tap
            },
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart List'),

          ),

          //info icon

          ListTile(
            onTap: () {
              // Handle item  tap
            },
            leading: const Icon(Icons.info),
            title: const Text('About Us'),

          ),

        ],
      ),
    );
  }
}
