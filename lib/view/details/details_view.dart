// product_details_page.dart

import 'package:ecom_wave/view/cart/cart_view.dart';
import 'package:ecom_wave/view/details/widget/product_options.dart';
import 'package:flutter/material.dart';
import '../checkout_info/checkout_info_view.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final bool isFavorite;

  ProductDetailsPage({required this.product, required this.isFavorite});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isFavorite = false;
  String selectedSize = 'M'; // Default size
  String selectedColor = 'Blue'; // Default color

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  void _selectColor(String color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffE9D5CF),
      appBar: AppBar(
        title: Text(widget.product['text'] ?? 'Product Details'),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: media.width,
              height: 200,
              child: Image.asset(
                widget.product['image']!,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Bottom widgets
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product['text']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${widget.product['price'] ?? 0}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Product Description:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rating:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Availability:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'In Stock',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Size:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizeOption(
                        size: 'S',
                        isSelected: selectedSize == 'S',
                        onSelect: () => _selectSize('S'),
                      ),
                      SizeOption(
                        size: 'M',
                        isSelected: selectedSize == 'M',
                        onSelect: () => _selectSize('M'),
                      ),
                      SizeOption(
                        size: 'L',
                        isSelected: selectedSize == 'L',
                        onSelect: () => _selectSize('L'),
                      ),
                      // Add more size options as needed
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Color:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      ColorOption(
                        color: 'Blue',
                        isSelected: selectedColor == 'Blue',
                        onSelect: () => _selectColor('Blue'),
                      ),
                      ColorOption(
                        color: 'Red',
                        isSelected: selectedColor == 'Red',
                        onSelect: () => _selectColor('Red'),
                      ),
                      ColorOption(
                        color: 'Yellow',
                        isSelected: selectedColor == 'Yellow',
                        onSelect: () => _selectColor('Yellow'),
                      ),
                      ColorOption(
                        color: 'Pink',
                        isSelected: selectedColor == 'Pink',
                        onSelect: () => _selectColor('Pink'),
                      ),
                      // Add more color options as needed
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartView(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Add to Cart'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutInformationPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Buy Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
