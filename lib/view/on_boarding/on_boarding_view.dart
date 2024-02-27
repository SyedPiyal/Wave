import 'package:ecom_wave/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/color/color.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  //==============================
  // Data for OnBoarding pages
  //==============================
  List pageArr = [
    {
      "title": "Discover Trendy",
      "subtitle": "NEW CLOTHES",
      "description": "Hey! Explore our online shopping experience.",
      "lottieAsset": "assets/animation/anim_search.json",
      //"lottieUrl": "https://lottie.host/951a1b75-34d2-4857-8e75-e99bb995ff49/1cNxEdhKw3.json",
    },
    {
      "title": "Live Your",
      "subtitle": "PERFECT",
      "description": "Smart, gorgeous & fashionable collection makes you cool.",
      "lottieAsset": "assets/animation/anim_perfect.json",
      //"lottieUrl": "https://lottie.host/47f4b6b8-a30f-44d5-8c0a-b68cf9c4f7eb/Zbh1Mvm8S2.json",
    },
    {
      "title": "Easy & Safe",
      "subtitle": "PAYMENTS",
      "description":
          "Easy Checkout & Safe Payment method, Trusted by our Customers from all over the world.",
      "lottieAsset": "assets/animation/anim_payment.json",
      //"lottieUrl": "https://lottie.host/c43a4b2e-19c7-45bd-b16a-0aa172c55977/axJO07aRFt.json",
    },
  ];

  @override
  void initState() {
    super.initState();

    //==============================
    // Listen to page changes
    //==============================
    controller.addListener(() {
      setState(() {
        // Update selected page
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: pageArr.length,
        itemBuilder: ((context, index) {
          var pObj = pageArr[index];
          return Stack(
            children:[ Container(
              width: media.width,
              height: media.width,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 40),
              child: LottieBuilder.asset(
                pObj["lottieAsset"]!,
                width: media.width * 1,
                height: media.width * 1,
                fit: BoxFit.contain,
              ),

              /*Lottie.network(
                pObj["lottieUrl"],
                width: media.width * 1,
                height: media.width * 1,
                fit: BoxFit.contain,
              ),*/
            ),
              //==============================
              // Bottom container for text and buttons
              //==============================

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 335,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  decoration: const BoxDecoration(
                    color: Color(0xFF196076),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //==============================
                      // Title
                      //==============================

                      Text(
                        pageArr[selectPage]["title"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      //==============================
                      // Subtitle
                      //==============================

                      Text(
                        pageArr[selectPage]["subtitle"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8),

                      //==============================
                      // Description
                      //==============================

                      Text(
                        pageArr[selectPage]["description"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 25,
                child:

                //==============================
                // Arrow Button with white background
                //==============================

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //==============================
                        // Navigate to the next page
                        //==============================

                        if (selectPage < pageArr.length - 1) {
                          selectPage++;
                          controller.animateToPage(
                            selectPage,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut,
                          );
                        } else {
                          //==============================
                          // Handle when the last page is reached
                          //==============================

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          Icons.arrow_forward,
                          color: TColor.primaryText,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 25,
                left: 150,
                right: 0,
                child:

                //==============================
                // Dots for indicating pages
                //==============================

                SmoothPageIndicator(
                  // PageController

                  controller: controller,
                  count: pageArr.length,
                  effect: WormEffect(
                    dotWidth: 10,
                    dotHeight: 10,
                    dotColor: TColor.placeholder,
                    activeDotColor: TColor.white,
                  ),
                ),
              ),
              const Positioned(
                bottom: 310,
                right: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  backgroundImage: AssetImage("assets/image/ic_icons.jpg"),
                ),
              )]
          );
        }),
      ),
    );
  }
}
