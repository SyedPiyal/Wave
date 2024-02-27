import 'package:ecom_wave/common/widget/custom_button.dart';
import 'package:ecom_wave/view/login/login_view.dart';
import 'package:flutter/material.dart';
import '../../common/widget/round_textfield.dart';
import '../../utils/color/color.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              //==============================
              // ImageView
              //==============================

              Image.asset(
                'assets/image/iv_password.jpg',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "New Password",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Please enter your new password",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              RoundTextfield(
                hintText: "New Password",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Confirm Password",
                controller: txtConfirmPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),


              //==============================
              // Go To login page after password change
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
                title: "Next",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
