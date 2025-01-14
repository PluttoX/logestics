
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import 'angular_material_badges.dart';
import 'badges_widget.dart';

class BadgesScreen extends StatefulWidget {
  const BadgesScreen({super.key});

  @override
  State<BadgesScreen> createState() => _BadgesScreenState();
}

class _BadgesScreenState extends State<BadgesScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  List darkColor = [
    Color(0xFF0f79f3),
    Color(0xFF0d6efd),
    Color(0xFF6c757d),
    Color(0xFF198754),
    Color(0xFFdc3545),
    Color(0xFFffc107),
    Color(0xFF0dcaf0),
    Color(0xFFf8f9fa),
    Color(0xFF212529),
  ];

  List textColor = [
    Color(0xFF0f79f3),
    Color(0xFF0d6efd),
    Color(0xFF6c757d),
    Color(0xFF198754),
    Color(0xFFdc3545),
    Color(0xFFffc107),
    Color(0xFF0dcaf0),
    Color(0xFF212529),
    Color(0xFF212529),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    List lightColor = [
      notifier.lightbgcolor,
      notifier.liblueColor,
      Color(0xFFf8f9fa),
      notifier.ligreenColor,
      notifier.liredColor,
      notifier.liyellowColor,
      notifier.litealAccentColor,
      Color(0xFFfcfcfd),
      Color(0xFFced4da),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width < 650 ? 55 : 40,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Badges",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
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
                                        fontFamily: "Outfit",
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
                                  fontFamily: "Outfit",
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
                                "Badges",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
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
                            "Badges",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
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
                                        fontFamily: "Outfit",
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
                                  fontFamily: "Outfit",
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
                                "Badges",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
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
              AngularMaterialBadges(),
              SizedBox(height: 20),
              width < 950
                  ? Column(
                      children: [
                        SizedBox(
                          width: width,
                          child: BadgesWidget(
                            title: "Default Badges",
                            bgColors: darkColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BadgesWidget(
                            title: "Outline Badges",
                            textColors: darkColor,
                            borderColor: darkColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BadgesWidget(
                            title: "Soft Badges",
                            textColors: textColor,
                            bgColors: lightColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BadgesWidget(
                            title: "Pill Badges",
                            bgColors: darkColor,
                            shapCricle: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BadgesWidget(
                            title: "Soft Pill Badges",
                            textColors: textColor,
                            bgColors: lightColor,
                            shapCricle: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BadgesWidget(
                            title: "Outline Pill Badges",
                            textColors: darkColor,
                            borderColor: darkColor,
                            shapCricle: true,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: BadgesWidget(
                                title: "Default Badges",
                                bgColors: darkColor,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: BadgesWidget(
                                title: "Outline Badges",
                                textColors: darkColor,
                                borderColor: darkColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: BadgesWidget(
                                title: "Soft Badges",
                                textColors: textColor,
                                bgColors: lightColor,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: BadgesWidget(
                                title: "Pill Badges",
                                bgColors: darkColor,
                                shapCricle: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: BadgesWidget(
                                title: "Soft Pill Badges",
                                textColors: textColor,
                                bgColors: lightColor,
                                shapCricle: true,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: BadgesWidget(
                                title: "Outline Pill Badges",
                                textColors: darkColor,
                                borderColor: darkColor,
                                shapCricle: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
