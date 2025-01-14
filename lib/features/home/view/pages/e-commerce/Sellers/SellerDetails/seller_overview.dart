// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';
import '../../../../../widget/mycontainers.dart';

class SellerOverview extends StatelessWidget {
  const SellerOverview({super.key});

  @override
  Widget build(BuildContext context) {
  late ColorNotifier notifier;
   
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
   
    notifier = Provider.of(context,listen: true);
    
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
            "Seller Overview",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: width < 630
                ? Column(
                    children: [
                      Expanded(
                        child: mycontainers(
                          context,
                          title: "Total Orders",
                          mainbackground: notifier.mainBgColor,
                          subtitle: "7051",
                          text: "Order this month",
                          backgroundColor: notifier.ligreenColor,
                          image: "assets/images/trend-up.png",
                          textColor: Colors.green,
                          containertext: " 0.75%",
                          child: Container(
                            height: 70,
                            width: 70,
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
                      SizedBox(height: 20),
                      Expanded(
                        child: mycontainers(
                          context,
                          title: "Total Earnings",
                          mainbackground: notifier.mainBgColor,
                          subtitle: "\$23.91k",
                          text: "Earnings this month",
                          backgroundColor: notifier.liredColor,
                          image: "assets/images/trend-down.png",
                          textColor: Colors.red,
                          containertext: " 1.25%",
                          child: Container(
                            height: 70,
                            width: 70,
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
                      SizedBox(height: 20),
                      Expanded(
                        child: mycontainers(
                          context,
                          title: "Total Refunds",
                          mainbackground: notifier.mainBgColor,
                          subtitle: "178",
                          text: "Refunds this month",
                          backgroundColor: notifier.ligreenColor,
                          image: "assets/images/trend-up.png",
                          textColor: Colors.green,
                          containertext: " 4.75%",
                          child: Container(
                            height: 70,
                            width: 70,
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
                      SizedBox(height: 20),
                      Expanded(
                        child: mycontainers(
                          context,
                          title: "Conversion Rate",
                          mainbackground: notifier.mainBgColor,
                          subtitle: "12.21%",
                          text: "Conversion rate this month",
                          backgroundColor: notifier.ligreenColor,
                          image: "assets/images/trend-up.png",
                          textColor: Colors.green,
                          containertext: " 1.11%",
                          child: Container(
                            height: 70,
                            width: 70,
                            padding: EdgeInsets.all(18),
                            decoration: const BoxDecoration(
                              color: Color(0xFFe74c3c),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                "assets/images/join.svg",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : width < 1450
                    ? Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: mycontainers(
                                    context,
                                    title: "Total Orders",
                                    mainbackground: notifier.mainBgColor,
                                    subtitle: "7051",
                                    text: "Order this month",
                                    backgroundColor: notifier.ligreenColor,
                                    image: "assets/images/trend-up.png",
                                    textColor: Colors.green,
                                    containertext: " 0.75%",
                                    child: Container(
                                      height: 70,
                                      width: 70,
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
                                SizedBox(height: 20),
                                Expanded(
                                  child: mycontainers(
                                    context,
                                    title: "Total Refunds",
                                    mainbackground: notifier.mainBgColor,
                                    subtitle: "178",
                                    text: "Refunds this month",
                                    backgroundColor: notifier.ligreenColor,
                                    image: "assets/images/trend-up.png",
                                    textColor: Colors.green,
                                    containertext: " 4.75%",
                                    child: Container(
                                      height: 70,
                                      width: 70,
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
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: mycontainers(
                                    context,
                                    title: "Total Earnings",
                                    mainbackground: notifier.mainBgColor,
                                    subtitle: "\$23.91k",
                                    text: "Earnings this month",
                                    backgroundColor: notifier.liredColor,
                                    image: "assets/images/trend-down.png",
                                    textColor: Colors.red,
                                    containertext: " 1.25%",
                                    child: Container(
                                      height: 70,
                                      width: 70,
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
                                SizedBox(height: 20),
                                Expanded(
                                  child: mycontainers(
                                    context,
                                    title: "Conversion Rate",
                                    mainbackground: notifier.mainBgColor,
                                    subtitle: "12.21%",
                                    text: "Conversion rate this month",
                                    backgroundColor: notifier.ligreenColor,
                                    image: "assets/images/trend-up.png",
                                    textColor: Colors.green,
                                    containertext: " 1.11%",
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      padding: EdgeInsets.all(18),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFe74c3c),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          "assets/images/join.svg",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: mycontainers(
                              context,
                              title: "Total Orders",
                              mainbackground: notifier.mainBgColor,
                              subtitle: "7051",
                              text: "Order this month",
                              backgroundColor: notifier.ligreenColor,
                              image: "assets/images/trend-up.png",
                              textColor: Colors.green,
                              containertext: " 0.75%",
                              child: Container(
                                height: 70,
                                width: 70,
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
                          SizedBox(width: 20),
                          Expanded(
                            child: mycontainers(
                              context,
                              title: "Total Earnings",
                              mainbackground: notifier.mainBgColor,
                              subtitle: "\$23.91k",
                              text: "Earnings this month",
                              backgroundColor: notifier.liredColor,
                              image: "assets/images/trend-down.png",
                              textColor: Colors.red,
                              containertext: " 1.25%",
                              child: Container(
                                height: 70,
                                width: 70,
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
                          SizedBox(width: 20),
                          Expanded(
                            child: mycontainers(
                              context,
                              title: "Total Refunds",
                              mainbackground: notifier.mainBgColor,
                              subtitle: "178",
                              text: "Refunds this month",
                              backgroundColor: notifier.ligreenColor,
                              image: "assets/images/trend-up.png",
                              textColor: Colors.green,
                              containertext: " 4.75%",
                              child: Container(
                                height: 70,
                                width: 70,
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
                          SizedBox(width: 20),
                          Expanded(
                            child: mycontainers(
                              context,
                              title: "Conversion Rate",
                              mainbackground: notifier.mainBgColor,
                              subtitle: "12.21%",
                              text: "Conversion rate this month",
                              backgroundColor: notifier.ligreenColor,
                              image: "assets/images/trend-up.png",
                              textColor: Colors.green,
                              containertext: " 1.11%",
                              child: Container(
                                height: 70,
                                width: 70,
                                padding: EdgeInsets.all(18),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFe74c3c),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/images/join.svg",
                                    color: Colors.white,
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
    );
  }
}
