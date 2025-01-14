import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../widget/mycontainers.dart';


Widget welcomeBack(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      color: Color(0xFF6a5de8),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: width < 550 ? Alignment.center : Alignment.bottomRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: width < 800
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            mainAxisAlignment: width < 800
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "July 22, 2024",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Outfit",
                ),
              ),
              Text(
                "Welcom Back! unity",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Outfit",
                ),
              ),
              width < 550 ? SizedBox(height: 10) : Container(),
              Text(
                "Learning Management System Dashboard.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: "Outfit",
                ),
              ),
              width < 550 ? Container() : SizedBox(height: 10),
              Text(
                "Daily Performance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Outfit",
                ),
              ),
              width < 550 ? SizedBox(height: 25) : Container(),
              // SizedBox(
              //   height: 100,
              //   child: Column(
              //     children: [
              //       CircularPercentIndicator(
              //
              //         radius: 50,
              //         circularStrokeCap: CircularStrokeCap.round,
              //         lineWidth: 10,
              //         animation: true,
              //         percent: 0.7,
              //         center: Text("75%",
              //             style: TextStyle(
              //                 fontSize: 18,
              //                 color: Colors.orangeAccent,
              //                 fontFamily: 'InterRegular',
              //                 fontWeight: FontWeight.w600)),
              //         progressColor: const Color(0xff7DC066),
              //         backgroundColor: const Color(0xffEEEEEE),
              //       ),
              //
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 100,
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    customColors: CustomSliderColors(
                      dotColor: Color(0xFF15c0e5),
                      progressBarColor: Color(0xFF15c0e5),
                      trackColor: Color(0xFF9087f4),
                    ),
                    customWidths: CustomSliderWidths(progressBarWidth: 10),
                  ),
                  min: 10,
                  max: 100,
                  initialValue: 75,
                  innerWidget: (double value) {
                    return Center(
                      child: Text(
                        "${value.toStringAsFixed(0)} %",
                        style: TextStyle(
                          color: Colors.white, // Change text color here
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        width < 800
            ? Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: height / 5,
                  child: Image.asset("assets/images/welcome.png"),
                ),
              )
            : SizedBox(child: Image.asset("assets/images/welcome.png")),
      ],
    ),
  );
}
