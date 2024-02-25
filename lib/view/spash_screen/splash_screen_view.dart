import 'dart:async';

import 'package:flutter/material.dart';

import '../on_boarding/on_boarding_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to OnBoardingView after 4 seconds
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        //==============================
        // Centered round image
        //==============================

        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60,
          backgroundImage: AssetImage("assets/image/ic_icons.jpg"),
        ),
      ),
    );
  }
}
