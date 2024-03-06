import 'package:ecom_wave/view/cart/widget/custom_item.dart';
import 'package:flutter/material.dart';

import '../order_status/widget/package_delivery_tracking.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<Map<String, dynamic>> cartData = [
    {"text": "Sneakers", "image": "assets/image/snekers.png", "price": 49.99},
    {"text": "Sneakers", "image": "assets/image/snekers.png", "price": 12.99},
    {"text": "Sneakers", "image": "assets/image/snekers.png", "price": 79.99},
    {"text": "Sneakers", "image": "assets/image/snekers.png", "price": 39.99},
    {"text": "Sneakers", "image": "assets/image/snekers.png", "price": 24.99},
  ];

  List<int> itemQuantities = List<int>.generate(5, (index) => 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFF8F2),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            CartViewListWidget(cartList: cartData),
            const SizedBox(height: 27,),

            const Row(
              children: [
                Text('Total Amount ',style: TextStyle(fontSize: 18),),
                Text(' \$ 204',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 400,
              height: 50,
              child: ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => PackageDeliveryTrackingPage(),
                      ),
                );
              }, child: const Text('Check Out',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
