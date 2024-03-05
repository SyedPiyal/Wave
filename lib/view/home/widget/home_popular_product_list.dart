
import 'package:flutter/material.dart';

import '../../details/details_view.dart';



class ProductListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> productList;

  ProductListWidget({required this.productList});

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  List<bool> isFavoriteList = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.productList.length,
        itemBuilder: (context, index) {
          return Card(
            //margin: EdgeInsets.symmetric(horizontal: 10),
            elevation: 1.5,
            child: Container(
              width: 160,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    // Navigate to the details page on tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsPage(
                          product: widget.productList[index],
                          isFavorite: isFavoriteList[index],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Toggle the favorite state on tap
                          setState(() {
                            isFavoriteList[index] = !isFavoriteList[index];
                          });
                        },
                        child: Align(alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              isFavoriteList[index]
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        widget.productList[index]['image']!,
                        height: 100,
                      ), // Assuming you have 'image' key in your data
                      Text(
                        widget.productList[index]['text']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
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
                            '${widget.productList[index]['price'] ?? 0}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}