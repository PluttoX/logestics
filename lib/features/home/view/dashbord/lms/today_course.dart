import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget todayCourse() {
  PageController pageController = PageController();

  CarouselSliderController carouselController = CarouselSliderController();

  int activePage = 0;

  List<int> items = [0, 1, 2];


  List todayCourseimages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRYxYmApuq7uZT3CslC5GVGKX9QJ7OBoA4uLJLm7NmD-m1ta1J3L4fElpn3V_1t7U3sbI&usqp=CAU",
    "https://assets.entrepreneur.com/content/3x2/2000/1648742653-Ent-PythonProgramming.jpeg",
    "https://media.licdn.com/dms/image/v2/D4D12AQHYC_ZczxV2zw/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1695524296879?e=2147483647&v=beta&t=rLMZ59ByIABpdPtfPZPZC65iXWG4zbht2eqKfWOdxRs",
  ];

  List todayCourseName = [
    "UI/UX Design Essentials",
    "Introduction To Python",
    "Graphic Design Basics",
  ];

  List todayCoursePrice = ["14.99", "32.22", "23.21"];

  List courseContent = [
    "15 sections.70 lectures.15h50m",
    "12 sections.43 lectures.23h20m",
    "16 sections.65 lectures.11h20m",
  ];

  return StatefulBuilder(
    builder: (context, setState) {
      return LayoutBuilder(
        builder: (context, constraints) {
          notifier = Provider.of(context, listen: true);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today's Course",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CarouselSlider(
                        carouselController: carouselController,
                        items: items.map(
                          (i) {
                            return SizedBox(
                              width: constraints.maxWidth,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          todayCourseimages[i].toString(),
                                          height: 130,
                                          width: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            todayCourseName[i].toString(),
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              fontSize: 16,
                                              color: notifier.text,
                                            ),
                                          ),
                                          Text(
                                            "\$${todayCoursePrice[i]}",
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              fontSize: 25,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600,
                                              color: notifier.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Course content",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: notifier.text,
                                        ),
                                      ),
                                      Text(
                                        courseContent[i].toString(),
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 16,
                                          color: notifier.text,
                                        ),
                                      ),
                                    ],
                                  ),
                                  StyledDivider(
                                    // color: notifier.text,
                                    color: notifier.isDark
                                        ? const Color(0xff414141)
                                        : Color(0xFF48566A),
                                    lineStyle: DividerLineStyle.dashed,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          "+ View Details",
                                          style: TextStyle(
                                            color: Color(0xFF0f7bf4),
                                            fontFamily: "Outfit",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          height: constraints.maxHeight,
                          enlargeCenterPage: false,
                          padEnds: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.linear,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 2),
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(
                              () {
                                activePage = index;
                              },
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: items.map((entry) {
                            return GestureDetector(
                              child: Container(
                                width: 8,
                                height: 8,
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (activePage == entry
                                      ? Color(0xFF0165FC)
                                      : Colors.white),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
