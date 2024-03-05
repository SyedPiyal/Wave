
import 'package:flutter/material.dart';

class CartViewListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> cartList;

  const CartViewListWidget({
    Key? key,
    required this.cartList,
  }) : super(key: key);

  @override
  State<CartViewListWidget> createState() => _CartViewListWidgetState();
}

class _CartViewListWidgetState extends State<CartViewListWidget> {
  List<int> itemQuantities = List<int>.generate(5,
      (index) => 1); // Initialize quantities with default value 1 for each item

  void increaseQuantity(int index) {
    setState(() {
      itemQuantities[index]++;
    });
  }

  void decreaseQuantity(int index) {
    if (itemQuantities[index] > 1) {
      setState(() {
        itemQuantities[index]--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.cartList.length,
        itemBuilder: (context, index) {
          double unitPrice = widget.cartList[index]['price'] ?? 0.0;
          double totalPrice = unitPrice * itemQuantities[index];
          return Card(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            //margin: EdgeInsets.symmetric(horizontal: 10),
            elevation: 1.5,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {},
                  child: Row(
                    children: [
                      //product image
                      Image.asset(
                        widget.cartList[index]['image']!,
                        height: 100,
                      ),
                      Column(
                        children: [
                          Text(
                            //product name
                            widget.cartList[index]['text']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),

                          //product rating
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                              Text(
                                '(4.5)',
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),

                          // Increase and Decrease Quantity Row
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    decreaseQuantity(index);
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                  child: Text(
                                    '${itemQuantities[index]}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    increaseQuantity(index);
                                  },
                                ),
                              ]),
                        ],
                      ),
                      const Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //delete icon
                          const Icon(Icons.delete),
                          const SizedBox(
                            height: 20,
                          ),

                          // Updated Price Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '\$  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              Text(
                                '$totalPrice',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
