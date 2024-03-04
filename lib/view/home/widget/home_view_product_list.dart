// product_list_widget.dart

import 'package:flutter/material.dart';

import 'home_product_details_page.dart';
 // Import your product details page

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
          return GestureDetector(
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
            child: Card(
              elevation: 1.5,
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: GestureDetector(
                        onTap: () {
                          // Toggle the favorite state on tap
                          setState(() {
                            isFavoriteList[index] = !isFavoriteList[index];
                          });
                        },
                        child: Icon(
                          isFavoriteList[index]
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Image.asset(
                      widget.productList[index]['image']!,
                      height: 100,
                    ), // Assuming you have 'image' key in your data
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 0),
                      child: Text(
                        widget.productList[index]['text']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 35, top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Text(
                            '\$',
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
