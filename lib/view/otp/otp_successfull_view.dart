import 'package:ecom_wave/common/widget/custom_button.dart';
import 'package:ecom_wave/view/login/login_view.dart';
import 'package:flutter/material.dart';

import '../../utils/color/color.dart';

class OtpSuccessFullView extends StatelessWidget {
  const OtpSuccessFullView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),


            //==============================
            // ImageView
            //==============================

            Image.asset(
              'assets/image/iv_succesfull.png',
              width: 150,
              height: 150,
            ),
            Text(
              'Successfully',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Your Account has been created',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 60,
            ),

            //==============================
            // Okay button
            //==============================

            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginView(),
                  ),
                );
              },
              title: "OKAY",
            ),
          ],
        ),
      ),
    );
  }
}
