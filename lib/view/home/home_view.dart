import 'package:ecom_wave/common/widget/custom_search_widget.dart';
import 'package:ecom_wave/view/home/widget/home_screen_slider_widget.dart';
import 'package:flutter/material.dart';

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
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset(
            'assets/image/ic_menu.png',
            color: const Color(0xffff7f81),
          ),
        ),
        leadingWidth: 45,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/image/iv_profile.jpg"),
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
            //category

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 50,
              child: ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  final _isSelected = _selectedIndexs.contains(index);
                  final data = _data[index];
                  return Ink(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (_isSelected) {
                            _selectedIndexs.remove(index);
                          } else {
                            _selectedIndexs.add(index);
                          }
                          //_containerColor = Colors.redAccent;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color:
                                    _isSelected ? Colors.red : Colors.black12),
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //Icon(data["icon"]),
                                Image.asset(data["image"],
                                    width: 30, height: 30),
                                //Image.asset(data?[index].image?? "",height: 50),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 7, left: 5),
                                  child: Text(
                                    data["text"],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ]),
                        ),
                      ),

                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
