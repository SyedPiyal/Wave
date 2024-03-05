import 'package:ecom_wave/common/widget/custom_search_widget.dart';
import 'package:ecom_wave/view/home/widget/home_category_container.dart';
import 'package:ecom_wave/view/home/widget/home_staggered_grid_widget.dart';
import 'package:ecom_wave/view/home/widget/home_trending_product_list.dart';
import 'package:ecom_wave/view/home/widget/home_view_drawer.dart';
import 'package:ecom_wave/view/home/widget/home_view_slider_widget.dart';
import 'package:ecom_wave/view/search/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    {"text": "Sneakers", "image": "assets/image/snekers.png", "price": 49.99},
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
                color: const Color(0xff0299a4),
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notifications,
              color: Color(0xff0299a4),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  //==============================
                  // Search filed
                  //==============================

                  Expanded(
                    child: CustomSearchFiled(
                      hintTxt: 'Search....',
                      opTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),

                  //==============================
                  // Filter Icon
                  //==============================

                  /*Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff0299a4),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/image/iv_filter.png',
                      color: Colors.white70,
                    ),
                  ),*/

                  /*Card(elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child:const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Icon(Icons.shuffle),
                    ) ,
                  ),*/

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                          builder: (context) => SearchPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Icon(Icons.shuffle),
                  )
                ],
              ),

              //==============================
              // Slider
              //==============================

              const SizedBox(
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

              const SizedBox(
                height: 20,
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

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Popular',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
              ),

              //==============================
              // Product List
              //==============================
              ProductListWidget(
                productList: productData,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'All Products',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                ),
              ),
              //==============================
              // StaggeredGridView for All Products
              //==============================
              SizedBox(
                height: 250,
                child:  AllProductsGridView(productList: productData),
              ),


            ],
          ),
        ),
      ),
      //==============================
      // Custom Drawer
      //==============================
      drawer: CustomDrawer(),
    );
  }
}
