import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import 'my_slides.dart';

class CarouselsScreen extends StatefulWidget {
  const CarouselsScreen({super.key});

  @override
  State<CarouselsScreen> createState() => _CarouselsScreenState();
}

class _CarouselsScreenState extends State<CarouselsScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  CarouselSliderController carouselController = CarouselSliderController();
  
  late ColorNotifier notifier;

  bool isHover1 = false;
  bool isHover2 = false;

  int currentIndex = 0;

  List images = [
    "assets/images/card6.jpg",
    "assets/images/card5.jpg",
    "assets/images/card6.jpg",
    "assets/images/card5.jpg",
    "assets/images/card6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

   notifier = Provider.of(context,listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width < 650 ? 55 : 40,
                width: width,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Carousels",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () =>
                                    mainDrawerController.updateSelectedIndex(0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/home.png",
                                      height: 15,
                                      color: Color(0xFF0f7bf4),
                                    ),
                                    Text(
                                      " Dashboard",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "UI Elements",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "Carousels",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.text,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Carousels",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () =>
                                    mainDrawerController.updateSelectedIndex(0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/home.png",
                                      height: 15,
                                      color: Color(0xFF0f7bf4),
                                    ),
                                    Text(
                                      " Dashboard",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "UI Elements",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "Carousels",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifier.text,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
              SizedBox(height: 20),
              width < 800
                  ? Column(
                      children: const [
                        MySlides(
                          title: "Slides Only",
                          images: [
                            "assets/images/card5.jpg",
                            "assets/images/card6.jpg",
                          ],
                        ),
                        SizedBox(height: 20),
                        MySlides(
                          title: "With Dots Controls",
                          images: [
                            "assets/images/card6.jpg",
                            "assets/images/card5.jpg",
                          ],
                          showIndicator: true,
                        ),
                        SizedBox(height: 20),
                        MySlides(
                          title: "With Navs Controls",
                          images: [
                            "assets/images/card6.jpg",
                            "assets/images/card5.jpg",
                          ],
                          showbutton: true,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: MySlides(
                                title: "Slides Only",
                                images: [
                                  "assets/images/card5.jpg",
                                  "assets/images/card6.jpg",
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MySlides(
                                title: "With Dots Controls",
                                images: [
                                  "assets/images/card6.jpg",
                                  "assets/images/card5.jpg",
                                ],
                                showIndicator: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: MySlides(
                                title: "With Navs Controls",
                                images: const [
                                  "assets/images/card6.jpg",
                                  "assets/images/card5.jpg",
                                ],
                                showbutton: true,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(child: Container()),
                          ],
                        ),
                      ],
                    ),
              SizedBox(height: 20),
              MySlides(
                title: "Responsive Breakpoints",
                images: images,
                showIndicator: true,
                showbutton: true,
                viewportFraction: width < 650
                    ? 1
                    : width < 1030
                        ? 1 / 2
                        : width < 1200
                            ? 1 / 3
                            : width < 1300
                                ? 1 / 2
                                : 1 / 3,
                padding: width < 850 ? 0 : 8,
              ),
            ],
          ),
        );
      },
    );
  }
}
