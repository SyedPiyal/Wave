import 'package:ecom_wave/common/widget/custom_button.dart';
import 'package:ecom_wave/view/login/login_view.dart';
import 'package:flutter/material.dart';

import '../../common/widget/round_textfield.dart';
import '../../utils/color/color.dart';
import '../otp/otp_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          const Positioned(
            right: 25,
            top: -40,
            child: CircleAvatar(
              backgroundColor: Color(0xff01b8c6),
              radius: 85,
            ),
          ),
          const Positioned(
            right: -40,
            top: -15,
            child: CircleAvatar(
              backgroundColor: Color(0xff0299a4),
              radius: 85,
            ),
          ),
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 30,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Add your details",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "to sign up",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),

                  //==============================
                  // Name Filed
                  //==============================

                  RoundTextfield(
                    hintText: "Name",
                    controller: txtName,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //==============================
                  // Email Field
                  //==============================

                  RoundTextfield(
                    hintText: "Email",
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //==============================
                  // Mobile Number Filed
                  //==============================

                  RoundTextfield(
                    hintText: "Mobile No",
                    controller: txtMobile,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //==============================
                  // Address Filed
                  //==============================

                  RoundTextfield(
                    hintText: "Address",
                    controller: txtAddress,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //==============================
                  // Password filed
                  //==============================

                  RoundTextfield(
                    hintText: "Password",
                    controller: txtPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //==============================
                  // Confirm Pass Field
                  //==============================

                  RoundTextfield(
                    hintText: "Confirm Password",
                    controller: txtConfirmPassword,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  //==============================
                  // Button for SignUp
                  //==============================

                  CustomButton(
                      title: "Sign Up",
                      onPressed: () {
                        //btnSignUp();


                        //==============================
                        // Navigate to OTP Page
                        //==============================

                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTPView(email: 'Hello',),
                        ),
                      );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Already have an Account? ",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),

                      //==============================
                      // button for navigate to log in
                      //==============================

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                                ),
                          );
                        },
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: TColor.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
