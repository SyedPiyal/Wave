
import 'package:ecom_wave/view/favorites/widget/favorites_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {

  final List<Map<String, dynamic>> productData = [
    {"text": "Sneakers", "image": "assets/image/snekers.png", "price": 49.99},
    {"text": "Watch", "image": "assets/image/watch.jpg", "price": 129.99},
    {"text": "Jacket", "image": "assets/image/jacket.png", "price": 79.99},
    {"text": "Bag", "image": "assets/image/bag.jpg", "price": 39.99},
    {"text": "Wallet", "image": "assets/image/wallet.jpg", "price": 24.99},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FavoritesListWidget(favoritesList: productData)
        ],
      ),
    );
  }
}
