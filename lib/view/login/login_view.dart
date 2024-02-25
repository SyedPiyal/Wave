import 'package:ecom_wave/common/widget/custom_button.dart';
import 'package:ecom_wave/view/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';

import '../../common/widget/round_icon_button.dart';
import '../../common/widget/round_textfield.dart';
import '../../utils/color/color.dart';
import '../bottom_navigation/bottom_navigation_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var media = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned(
              right: 25,
              top: -40,
              child: CircleAvatar(
                backgroundColor: Color(0xff01b8c6),
                radius: 90,
              ),
            ),
            const Positioned(
              right: -40,
              top: -15,
              child: CircleAvatar(
                backgroundColor: Color(0xff0299a4),
                radius: 90,
              ),
            ),
            /*const Positioned(right: 25,
              top: 45,
              child: CircleAvatar(
                backgroundColor: Color(0xff0299a4),
                radius: 35,
                backgroundImage: AssetImage("assets/image/ic_icons.jpg"),
              ),
            ),*/
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: TColor.primaryText,
                                fontSize: 30,
                                fontWeight: FontWeight.w800),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 155),
                            child: Text(
                              "Live Your Dreams",
                              style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        /*Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Make Them Reality",
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),*/

                        const SizedBox(
                          height: 60,
                        ),

                        //==============================
                        // text filed for email
                        //==============================

                        RoundTextfield(
                          hintText: "Your Email",
                          controller: txtEmail,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 25,
                        ),

                        //==============================
                        // text filed for password
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
                        // Login Button
                        //==============================

                        CustomButton(
                          title: "Login",
                          onPressed: () {
                            //btnLogin();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNavigation(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 4,
                        ),

                        //==============================
                        // Reset password Button
                        //==============================

                        TextButton(
                          onPressed: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResetPasswordView(),
                              ),
                            );*/
                          },
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Or",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //==============================
                        // Login With Facebook Button
                        //==============================

                        RoundIconButton(
                          icon: "assets/image/facebook_logo.png",
                          title: "Login with Facebook",
                          color: const Color(0xff367FC0),
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 25,
                        ),

                        //==============================
                        // Login with Google button
                        //==============================

                        RoundIconButton(
                          icon: "assets/image/google_logo.png",
                          title: "Login with Google",
                          color: const Color(0xffDD4B39),
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Don't have an Account? ",
                              style: TextStyle(
                                  color: TColor.secondaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),

                            //==============================
                            // navigate to SignUp page
                            //==============================

                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpView(),
                                  ),
                                );
                              },

                              //for changing splash boarder

                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  "Sign Up",
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
