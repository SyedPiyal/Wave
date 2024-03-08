import 'package:flutter/material.dart';

class PromoCodeBottomSheet extends StatefulWidget {

  final String text;
  const PromoCodeBottomSheet({super.key, required this.text});

  @override
  State<PromoCodeBottomSheet> createState() => _PromoCodeBottomSheetState();
}

class _PromoCodeBottomSheetState extends State<PromoCodeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title and Close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                widget.text,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // TextFormField for entering promo code
          TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5),),),
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5),),),
              hintText: 'Enter Code',
            ),
          ),
          const SizedBox(height: 20),
          // Apply button
          ElevatedButton(
            onPressed: () {
              // Implement the functionality to apply the promo code
              Navigator.pop(context); // Close the bottom sheet
            },
            //change button color
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Change the color to blue
            ),
            child: const Text('Apply',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
