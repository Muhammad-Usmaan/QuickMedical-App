import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_medical/screens/signup.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkThroughView extends StatefulWidget {
  const WalkThroughView({super.key});

  @override
  State<WalkThroughView> createState() => _WalkThroughViewState();
}

class _WalkThroughViewState extends State<WalkThroughView> {
// Carousel controller
  final _carouselController = CarouselSliderController();

// Carousel index variable
  int _currentIndex = 0;
  List _crouselImages = [
    {
      "imageUrl":
          "https://cdni.iconscout.com/illustration/premium/thumb/online-medical-help-illustration-download-in-svg-png-gif-file-formats--consultant-e-medicine-business-activity-pack-clothing-accessories-illustrations-8537368.png?f=webp",
      "heading": "Instant Medical Help at Your Fingertips",
      "description":
          "Get medical advice online quickly and conveniently with e-medicine support."
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5IvDNwis2EcOdmqur3FmgAabF1lw_HQxzSg&s",
      "heading": "Access to Trusted Medications",
      "description":
          "Easily find and purchase trusted medications from reputable online pharmacies."
    },
    {
      "imageUrl":
          "https://static.vecteezy.com/system/resources/thumbnails/039/342/024/small_2x/flat-online-pharmacy-store-person-holding-tablet-and-buying-medication-in-internet-hands-ordering-pills-drops-and-balm-vector.jpg",
      "heading": "Shop Your Pharmacy Needs Anytime",
      "description":
          "Order your essential medicines and wellness products anytime, directly from our online store."
    },
    {
      "imageUrl":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdgcpSUEv9y-lWHwoOuQaWvIQr0Sz2cbqHXw&s",
      "heading": "Track Orders with Ease",
      "description":
          "Stay informed with real-time updates on your orders right from your phone."
    },
  ];
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 100,
              child: Container(
                height: 350,
                width: _screenWidth,
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: _crouselImages.length,
                  itemBuilder: (context, index, realIndex) {
                    final imageUrl = _crouselImages[index]["imageUrl"];
                    final heading = _crouselImages[index]["heading"];
                    final description = _crouselImages[index]["description"];

                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image(
                            image: NetworkImage(imageUrl),
                          ),
                        ),
                        Positioned(
                            width: _screenWidth * 0.7,
                            bottom: 60,
                            child: Text(
                              heading,
                              style: GoogleFonts.josefinSans(
                                  color: Color.fromRGBO(9, 15, 71, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                        Positioned(
                            width: _screenWidth * 0.6,
                            bottom: 0,
                            child: Text(
                              description,
                              style: GoogleFonts.josefinSans(
                                  color: Color.fromRGBO(9, 15, 71, 0.514),
                                  fontSize: 15),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 350.0,
                    autoPlay: true,
                    enlargeFactor: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              width: _screenWidth,
              bottom: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupView()),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.josefinSans(
                        color: Color.fromRGBO(9, 15, 71, 0.514),
                      ),
                    ),
                  ),
                  // Dot Indicator
                  AnimatedSmoothIndicator(
                    activeIndex: _currentIndex,
                    count: _crouselImages.length,
                    effect: WormEffect(
                        dotColor: Color.fromRGBO(9, 15, 71, 0.514),
                        activeDotColor: Color.fromRGBO(9, 15, 71, 1),
                        dotHeight: 10,
                        dotWidth: 10),
                    onDotClicked: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      _carouselController.nextPage(
                          duration: Duration(milliseconds: 500));
                      if (_currentIndex == 3) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupView()),
                        );
                      }
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.josefinSans(
                        color: Color.fromRGBO(9, 15, 71, 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _splashNavigationDots() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: Color.fromRGBO(9, 15, 71, 1), shape: BoxShape.circle),
    );
  }
}
