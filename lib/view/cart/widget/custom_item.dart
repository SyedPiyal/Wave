import 'package:flutter/material.dart';

class CartViewListWidget extends StatefulWidget {
  final List data;
  final List selectedIndexs;
  final Function(int) onCategoryTap;

  const CartViewListWidget({
    Key? key,
    required this.data,
    required this.selectedIndexs,
    required this.onCategoryTap,
  }) : super(key: key);

  @override
  State<CartViewListWidget> createState() => _CartViewListWidgetState();
}

class _CartViewListWidgetState extends State<CartViewListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          final isSelected = widget.selectedIndexs.contains(index);
          final categoryData = widget.data[index];
          return Ink(
            child: InkWell(
              onTap: () {
                widget.onCategoryTap(index);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //product image

                  Image.asset(categoryData["image"], width: 30, height: 30),
                  Column(
                    children: [
                      //product name

                      Text(categoryData["name"],),

                      //product price

                      Text(categoryData["price"],),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
