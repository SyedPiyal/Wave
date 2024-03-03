import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text('My Cart'),

       centerTitle: true,
       actions: const [

         Icon(Icons.delete),
         SizedBox(width: 15,)
       ],
     ),
    );
  }
}

