import 'package:ecom_wave/common/widget/custom_button.dart';
import 'package:flutter/material.dart';
import '../../common/widget/round_button.dart';
import '../../common/widget/round_textfield.dart';
import '../../utils/color/color.dart';
import 'new_password.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController txtEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            //==============================
            // ImageView
            //==============================

            Image.asset(
              'assets/image/iv_reset.jpg',
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Reset Password",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Please enter your email to receive a\n reset code to create a new password via email",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 60,
            ),
            RoundTextfield(
              hintText: "Your Email",
              controller: txtEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                title: "Send",
                onPressed: () {
                  //btnSubmit();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPasswordView(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
