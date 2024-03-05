
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../details/details_view.dart';



class FavoritesListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> favoritesList;

  FavoritesListWidget({required this.favoritesList});

  @override
  _FavoritesListWidgetState createState() => _FavoritesListWidgetState();
}

class _FavoritesListWidgetState extends State<FavoritesListWidget> {
  List<bool> isFavoriteList = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.favoritesList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            elevation: 1.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                          product: widget.favoritesList[index],
                          isFavorite: isFavoriteList[index],
                        ),
                      ),
                    );
                  },
                  child: Row(

                    children: [

                      //product image

                      Image.asset(
                        widget.favoritesList[index]['image']!,
                        height: 70,
                      ),
                      //const SizedBox(width: 30),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //product name
                          Text(
                            widget.favoritesList[index]['text']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          //product price

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
                                '${widget.favoritesList[index]['price'] ?? 0}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black54
                                ),
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              const Icon(Icons.timer_sharp,color: Colors.black54,),
                              const Text('1,Jan,2024'),
                              const SizedBox(width: 50,),
                              InkWell(onTap: () {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Delete'),
                                    content: const Text('Are You Sure You Want to Delete?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'No'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, 'YesS'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              },child: const Icon(Icons.delete,color: Colors.black54,))
                            ],
                          )
                        ],
                      ),


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