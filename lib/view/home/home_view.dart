import 'package:ecom_wave/common/widget/custom_search_widget.dart';
import 'package:ecom_wave/view/home/widget/home_category_container.dart';
import 'package:ecom_wave/view/home/widget/home_product_details_page.dart';
import 'package:ecom_wave/view/home/widget/home_view_drawer.dart';
import 'package:ecom_wave/view/home/widget/home_view_product_list.dart';
import 'package:ecom_wave/view/home/widget/home_view_slider_widget.dart';
import 'package:flutter/material.dart';

import '../profile/profile_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _data = [
    {"text": "Snekers", "image": "assets/image/snekers.png"},
    {"text": "Watch", "image": "assets/image/watch.jpg"},
    {"text": "Jacket", "image": "assets/image/jacket.png"},
    {"text": "Bag", "image": "assets/image/bag.jpg"},
    {"text": "Wallet", "image": "assets/image/wallet.jpg"},
  ];

  final List<Map<String, dynamic>> productData = [
    {"text": "Sneakers", "image": "assets/image/sneakers.png", "price": 49.99},
    {"text": "Watch", "image": "assets/image/watch.jpg", "price": 129.99},
    {"text": "Jacket", "image": "assets/image/jacket.png", "price": 79.99},
    {"text": "Bag", "image": "assets/image/bag.jpg", "price": 39.99},
    {"text": "Wallet", "image": "assets/image/wallet.jpg", "price": 24.99},
  ];


  final List _selectedIndexs = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: const Color(0xfff8f8f8),
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leadingWidth: 45,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(
                'assets/image/ic_menu.png',
                color: const Color(0xffff7f81),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                // Navigate to the ProfilePage when the profile icon is tapped
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileView()),
                );*/
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/image/iv_profile.jpg"),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                //==============================
                // Search filed
                //==============================

                const SizedBox(
                  width: 270,
                  child: CustomSearchFiled(hintTxt: 'Search....'),
                ),
                const SizedBox(
                  width: 10,
                ),

                //==============================
                // Filter Icon
                //==============================

                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFff7c7e),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/image/iv_filter.png',color: Colors.white70,
                  ),
                ),
              ],
            ),

            //==============================
            // Slider
            //==============================

            const SizedBox(
              width: 400,
              height: 200,
              child: ImageSlider(
                itemList: [
                  {
                    "name": '50 % \nOFF',
                  },
                  {
                    "name": '50 % \nOFF',
                  },
                  {
                    "name": '50 % \nOFF',
                  },
                ],
              ),
            ),

            //==============================
            // category
            //==============================

            CategoryContainer(
              data: _data,
              selectedIndexs: _selectedIndexs,
              onCategoryTap: (index) {
                setState(() {
                  if (_selectedIndexs.contains(index)) {
                    _selectedIndexs.remove(index);
                  } else {
                    _selectedIndexs.add(index);
                  }
                });
              },
            ),

            //==============================
            // Product List
            //==============================
            ProductListWidget(productList: productData,),
          ],
        ),
      ),
      drawer: CustomDrawer(), // Use the custom drawer here

    );
  }

}
