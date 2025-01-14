
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/mycontainers.dart';

late ColorNotifier notifier;

Widget projectsOverView(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  List image=[
    "assets/images/avatar-8 1.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/download 1.png",
    "assets/images/avatar-7 1.png",
  ];

  List positio=[
    30,50,70,90,110
  ];

  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Projects OverView",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: width < 850
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: width,
                            child: mycontainers(
                              context,
                              title: "Total Projects",
                              mainbackground: notifier.lightbgcolor,
                              subtitle: "536",
                              text: "Projects this month",
                              backgroundColor: notifier.ligreenColor,
                              image: "assets/images/trend-up.png",
                              textColor: Colors.green,
                              containertext: " 0.23%",
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF0f79f3),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/images/total-projects.svg",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(height: 20),
                        Expanded(
                          child: SizedBox(
                            width: width,
                            child: mycontainers(
                              context,
                              title: "Active Projects",
                              mainbackground: notifier.lightbgcolor,
                              subtitle: "127",
                              text: "Projects this month",
                              backgroundColor: notifier.liredColor,
                              image: "assets/images/trend-down.png",
                              textColor: Colors.red,
                              containertext: " 0.75%",
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFffb264),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    // "assets/images/Active-projects.svg",
                                    "assets/images/total-projects.svg",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(height: 20),
                        Expanded(
                          child: SizedBox(
                            width: width,
                            child: mycontainers(
                              context,
                              title: "Completed Projects",
                              mainbackground: notifier.lightbgcolor,
                              subtitle: "178",
                              text: "Project this month",
                              backgroundColor: notifier.ligreenColor,
                              image: "assets/images/trend-up.png",
                              textColor: Colors.green,
                              containertext: " 3.98%",
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF00cae3),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/images/total-projects.svg",
                                    // "assets/images/Completed-projects.svg",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(height: 20),
                        Expanded(
                          child: SizedBox(
                            width: width,
                            child: mycontainers(
                              context,
                              title: "Total Members",
                              mainbackground: notifier.lightbgcolor,
                              subtitle: "75",
                              text: "Projects engagement 50%",
                              backgroundColor: Colors.red.shade50,
                              child: SizedBox(
                                width: 150,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        "assets/images/avatar-8 1.png",
                                        height: 40,
                                      ),
                                    ),
                                    Positioned(
                                      left: 30,
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/images/avatar-1-51c6502a 1.png",
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 50,
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/images/download 1.png",
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 70,
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/images/artist.png",
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 90,
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/images/avatar-7 1.png",
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 110,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF796df6),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "+50",
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  child: mycontainers(
                                    context,
                                    title: "Total Projects",
                                    mainbackground: notifier.lightbgcolor,
                                    // mainbackground: notifier.lightbgcolor,
                                    subtitle: "536",
                                    text: "Projects this month",
                                    backgroundColor: notifier.ligreenColor,
                                    image: "assets/images/trend-up.png",
                                    textColor: Colors.green,
                                    containertext: " 0.63%",
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF0f79f3),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          "assets/images/total-projects.svg",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: Container(
                                  child: mycontainers(
                                    context,
                                    title: "Completed Projects",
                                    mainbackground: notifier.lightbgcolor,
                                    subtitle: "178",
                                    text: "Project this month",
                                    backgroundColor: notifier.ligreenColor,
                                    image: "assets/images/trend-up.png",
                                    textColor: Colors.green,
                                    containertext: " 8.34%",
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF00cae3),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          "assets/images/Completed-projects.svg",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  child: mycontainers(
                                    context,
                                    title: "Active Projects",
                                    mainbackground: notifier.lightbgcolor,
                                    subtitle: "127",
                                    text: "Projects this month",
                                    backgroundColor: notifier.liredColor,
                                    image: "assets/images/trend-down.png",
                                    textColor: Colors.red,
                                    containertext: " 0.75%",
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFffb264),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          "assets/images/Active-projects.svg",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: Container(
                                  child: mycontainers(
                                    context,
                                    title: "Total Members",
                                    mainbackground: notifier.lightbgcolor,
                                    // mainbackground: notifier.lightbgcolor,
                                    subtitle: "75",
                                    text: "Projects engagement 50%",
                                    backgroundColor: Colors.red.shade50,
                                    child: SizedBox(
                                      width: 150,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              "assets/images/avatar-8 1.png",
                                              height: 40,
                                            ),
                                          ),
                                          Positioned(
                                            left: 30,
                                            child: ClipOval(
                                              child: Image.asset(
                                                "assets/images/avatar-1-51c6502a 1.png",
                                                height: 40,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 50,
                                            child: ClipOval(
                                              child: Image.asset(
                                                "assets/images/download 1.png",
                                                height: 40,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 70,
                                            child: ClipOval(
                                              child: Image.asset(
                                                "assets/images/artist.png",
                                                height: 40,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 90,
                                            child: ClipOval(
                                              child: Image.asset(
                                                "assets/images/avatar-7 1.png",
                                                height: 40,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 110,
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFF796df6),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "+50",
                                                  style: TextStyle(
                                                    fontFamily: "Outfit",
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
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
                      ],
                    ),
            ),
          ],
        ),
      );
    },
  );
}
