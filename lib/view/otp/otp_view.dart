import 'package:ecom_wave/common/widget/custom_button.dart';
import 'package:ecom_wave/view/otp/otp_successfull_view.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import '../../utils/color/color.dart';

class OTPView extends StatefulWidget {
  final String email;

  const OTPView({super.key, required this.email});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  String code = "";

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
                height: 40,
              ),
              Image.asset(
                'assets/image/iv_otp.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "We have sent an OTP to your email",
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
                "Please check your email ${widget.email}\ncontinue to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 60,
                child: OtpPinField(
                    //==============================
                    // for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
                    //==============================

                    key: _otpPinFieldController,
                    autoFillEnable: true,
                    textInputAction: TextInputAction.done,

                    //==============================
                    //in case to change the action of keyboard
                    //to clear the Otp pin Controller
                    //==============================
                    onSubmit: (newCode) {
                      //code = newCode;
                      //btnSubmit();
                      // return the entered pin
                    },
                    onChange: (newCode) {
                      //code = newCode;

                      // return the entered pin
                    },
                    onCodeChanged: (newCode) {
                      //code = newCode;
                    },

                    //change filed width
                    fieldWidth: 60,

                    //==============================
                    // to decorate your Otp_Pin_Field
                    //==============================

                    otpPinFieldStyle: OtpPinFieldStyle(

                        //border color for inactive/unfocused Otp_Pin_Field

                        defaultFieldBorderColor: Colors.transparent,

                        //border color for active/focused Otp_Pin_Field

                        activeFieldBorderColor: Colors.transparent,

                        //Background Color for inactive/unfocused Otp_Pin_Field

                        defaultFieldBackgroundColor: TColor.textfield,
                        activeFieldBackgroundColor: TColor.textfield

                        //Background Color for active/focused Otp_Pin_Field

                        ),

                    //==============================
                    // no of pin field
                    //==============================

                    maxLength: 4,
                    showCursor: true,

                    //bool to show cursor in pin field or not
                    cursorColor: TColor.placeholder,

                    //==============================
                    // to choose cursor color
                    //==============================

                    upperChild: const Column(
                      children: [
                        SizedBox(height: 30),
                        Icon(Icons.flutter_dash_outlined, size: 150),
                        SizedBox(height: 20),
                      ],
                    ),
                    showCustomKeyboard: false,

                    //bool which manage to show custom keyboard
                    // customKeyboard: Container(),  /// Widget which help you to show your own custom keyboard in place if default custom keyboard
                    // showDefaultKeyboard: true,  ///bool which manage to show default OS keyboard
                    cursorWidth: 3,

                    //==============================
                    // to select cursor width
                    //==============================

                    mainAxisAlignment: MainAxisAlignment.center,

                    //==============================
                    // Otp pin filed decoration
                    //==============================

                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.roundedPinBoxDecoration),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  title: "Next",
                  onPressed: () {
                    Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (context) => const OtpSuccessFullView(),
                          ),
                    );
                    //for validation
                    //btnSubmit();
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Didn't Received? ",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {},
                      //for changing splash boarder

                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          "Click Here",
                          style: TextStyle(
                              color: TColor.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
