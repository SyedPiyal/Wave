import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final List<Map<String, String>> itemList;

  const ImageSlider({Key? key, required this.itemList}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSlider();
}

class _ImageSlider extends State<ImageSlider> {

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CarouselSlider.builder(
            itemCount: widget.itemList.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              Map<String, String> currentItem = widget.itemList[itemIndex];

              return Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff7f60bf),
                      Color(0xff81cce3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120.0,
                        height: 75.0,
                        decoration: const BoxDecoration(
                          color: Color(0xff9790d1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Special Discount",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
                            ),
                            Text(
                              currentItem["name"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/image/snekers.png',
                      height: 100,width: 100,)

                    ],
                  ),
                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              height: 110,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Align(
            alignment: Alignment.center,
            child: AnimatedSmoothIndicator(
              activeIndex: myCurrentIndex,
              count: widget.itemList.length,
              effect: const WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                spacing: 5,
                dotColor: Color(0xFFCED1D7),
                activeDotColor: Color(0xFF17609A),
                paintStyle: PaintingStyle.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
