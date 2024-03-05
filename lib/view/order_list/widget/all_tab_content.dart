// all_tab_content.dart

import 'package:flutter/material.dart';

import '../../../order_status/order_status_view.dart';

class AllTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to OrderStatusPage when an item is clicked
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderStatusPage(/* Pass necessary data here */),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Code: ABC123',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Price: \$49.99',
                        style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        'Canceled',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '4 Mar, 10:10 AM',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
