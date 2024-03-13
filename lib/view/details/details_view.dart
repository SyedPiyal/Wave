import 'package:flutter/material.dart';
import '../checkout_info/checkout_info_view.dart';
import 'package:ecom_wave/view/cart/cart_view.dart';
import 'package:ecom_wave/view/details/widget/product_options.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;
  final bool isFavorite;

  ProductDetailsPage({required this.product, required this.isFavorite});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // Variable to track whether the product is marked as favorite
  bool isFavorite = false;

  // Default size and color values
  String selectedSize = 'M';
  String selectedColor = 'Blue';

  @override
  void initState() {
    super.initState();
    // Initialize isFavorite based on the provided value
    isFavorite = widget.isFavorite;
  }

  // Function to update the selected size
  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  // Function to update the selected color
  void _selectColor(String color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //==============================
            // Product image and details section
            //==============================
            Stack(
              children: [
                // Background container with product image and color
                Container(
                  height: media.height / 1.8,
                  decoration: const BoxDecoration(
                    color: Color(0xffE9D5CF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    children: [
                      // Left side with product image
                      Expanded(
                        flex: 6,
                        child: Center(
                          child: Stack(
                            children: [
                              // White circle background for the image
                              const Padding(
                                padding: EdgeInsets.only(right: 5, top: 10),
                                child: CircleAvatar(
                                  radius: 120,
                                  backgroundColor: Colors.white,
                                ),
                              ),

                              // Actual product image
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, top: 70),
                                child: Image.asset(
                                  widget.product['image']!,
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Right side with shopping bag icon, color circles, and favorite icon
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: const Color(0xff5F5B5B),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Shopping bag icon
                                /*Image.asset(
                                  "assets/image/shopping_bag.png",
                                  color: Colors.white,
                                  width: 100,
                                  height: 100,
                                ),*/
                                const SizedBox(height: 50),

                                /*// Color circles
                                const Column(
                                  children: [
                                    // Black circle
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.black,
                                    ),
                                    SizedBox(height: 10),

                                    // White circle with inner product color circle
                                    CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Color(0xffE9D5CF),
                                      ),
                                    ),
                                    SizedBox(height: 10),

                                    // BlueGrey, Green, Pink, etc. circles
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                    SizedBox(height: 10),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.green,
                                    ),
                                    SizedBox(height: 10),
                                    CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.pink,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),*/
                                const SizedBox(height: 30),

                                // Favorite icon with toggle functionality
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  child: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Back button positioned at the top left corner
                Positioned(
                  left: 10,
                  top: MediaQuery.of(context).padding.top,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            //==============================
            // Product name and description section
            //==============================
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product name
                  Text(
                    widget.product['text']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Product description
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                    'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 15),

                  //==============================
                  // Size options section
                  //==============================
                  const Text(
                    "Size",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Size options
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
                    ],
                  ),
                  const SizedBox(height: 15),

                  //==============================
                  // Color options section
                  //==============================
                  const Text(
                    "Color",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Color options
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
                    ],
                  ),
                  const SizedBox(height: 30),

                  //==============================
                  // Buttons for adding to cart and buying now section
                  //==============================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //==============================
                      // Add to Cart button
                      //==============================

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
                          backgroundColor: Colors.blue, // Change the color to blue
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Add to Cart',style: TextStyle(color: Colors.white),),
                      ),

                      //==============================
                      // Buy Now button
                      //==============================

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
                          backgroundColor: Colors.blue, // Change the color to blue
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Buy Now',style: TextStyle(color: Colors.white),),
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
