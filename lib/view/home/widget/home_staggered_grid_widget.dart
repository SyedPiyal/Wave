import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reorderable_staggered_scroll_view/reorderable_staggered_scroll_view.dart';

import '../../details/details_view.dart';

class StraggeredGridWidget extends StatefulWidget {

  final List<Map<String, dynamic>> productList;

  const StraggeredGridWidget({super.key, required this.productList});

  @override
  State<StraggeredGridWidget> createState() => _StraggeredGridWidgetState();
}

class _StraggeredGridWidgetState extends State<StraggeredGridWidget> {

  List<bool> isFavoriteList = List.generate(5, (index) => false);
  @override
  Widget build(BuildContext context) {
    return ReorderableStaggeredScrollView.grid(
      enable: false,
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      isLongPressDraggable: false,
      children: List.generate(
        5,
            (index) => ReorderableStaggeredScrollViewGridItem(
          key: ValueKey(index.toString()),
          mainAxisCellCount: 1,
          crossAxisCellCount: Random().nextInt(2) + 1,
          widget: Card(
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
          )
        ),
      ),
    );
  }
}
