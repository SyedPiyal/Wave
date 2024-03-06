import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckoutViewBottomSheetWidget extends StatefulWidget {
  const CheckoutViewBottomSheetWidget({super.key});

  @override
  State<CheckoutViewBottomSheetWidget> createState() => _CheckoutViewBottomSheetWidgetState();
}


class _CheckoutViewBottomSheetWidgetState extends State<CheckoutViewBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 200,
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text('Close'),
                Align(alignment: Alignment.center,child: Text('Promo Code',style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
