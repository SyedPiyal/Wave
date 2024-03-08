import 'package:ecom_wave/view/checkout_info/widget/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

class CheckoutInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Delivery Address
            const Text(
              'Delivery Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Address Container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.all(16),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/image/iv_home.png",
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('123 Main Street'),
                      Text('City, Country'),
                    ],
                  ),
                  const Icon(Icons.edit),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Products
            const Text(
              'Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Product Container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Product Image
                  Image.asset(
                    "assets/image/snekers.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  // Product Details
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Adidas',style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Quantity: \$ 100 x 1'),
                    ],
                  ),
                  // Total Price
                  const Text('\$ 100'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Order Summary
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Order Summary Container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal'),
                      Text('\$ 102',style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Charge'),
                      Text('\$ 5',style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total'),
                      Text('\$ 107',style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),




            // Voucher Summary
            const Text(
              'Store Voucher',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Voucher Summary Container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.all(16),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //voucher image
                  Image.asset('assets/image/iv_voucher.png',width: 25,height: 25,),

                  //item row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Items'),
                      Text('1',style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),

                  //sub total row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SubTotal'),
                      Text('\$ 107',style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),

                  //saved row
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Saved'),
                      Text('\$ 80',style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            
            //==============================
            // Promotion or voucher code
            //==============================

            // Promotion Summary
            const Text(
              'Promotion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Promotion Summary Container
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              padding: const EdgeInsets.all(16),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [



                  //voucher row
                   InkWell(onTap: () {
                     // Show the promo code bottom sheet when tapped
                     showModalBottomSheet(
                       context: context,
                       builder: (context) => const PromoCodeBottomSheet(text: 'Voucher Code'),
                     );
                   },
                     child: Row(

                      children: [
                        //voucher image
                        Image.asset('assets/image/iv_voucher.png',width: 25,height: 25,),
                        const SizedBox(width: 10,),
                        const Text('Voucher'),
                        const Spacer(),
                        const Text('Not Applicable ',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                                       ),
                   ),

                  const SizedBox(
                    height: 15,
                  ),

                  //promo code row
                   InkWell(onTap: () {
                     // Show the promo code bottom sheet when tapped
                     showModalBottomSheet(
                         context: context,
                         builder: (context) => const PromoCodeBottomSheet(text: 'Promo Code'),
                     );
                   },
                     child: Row(
                      children: [
                        //voucher image
                        Image.asset('assets/image/iv_promocode.png',width: 25,height: 25,),
                        const SizedBox(width: 10,),
                        const Text('Promo Code'),
                        const Spacer(),
                        const Text('Enter Code ',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                                       ),
                   ),

                ],
              ),
            ),
            const SizedBox(height: 20),

            // Place Order/Complete Purchase Button
            ElevatedButton(
              onPressed: () {
                // Implement the functionality to place the order
              },
              //change button color
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Change the color to blue
              ),
              child: const Text('Place Order',style: TextStyle(color: Colors.white),),
            ),

          ],
        ),
      ),
    );
  }
}
