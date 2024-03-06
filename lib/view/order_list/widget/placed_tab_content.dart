import 'package:flutter/material.dart';




class PlacedTabContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return  Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: InkWell(
            onTap: () {
              // Navigate to OrderStatusPage when an item is clicked
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderStatusPage(),
                ),
              );*/
            },
            borderRadius: BorderRadius.circular(14),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //product code text
                  Text(
                    'Product Code: ABC123',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  //product price text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Price: \$49.99',
                        style: TextStyle(color: Colors.green),
                      ),

                      //product status text
                      Text(
                        'Placed',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  //product status time
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
