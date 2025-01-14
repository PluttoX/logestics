
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import 'alerts_widget.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});

  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {

  late ColorNotifier notifier;

  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  List text = [
    "A simple unity alert—check it out!",
    "A simple primary alert—check it out!",
    "A simple secondary alert—check it out!",
    "A simple success alert—check it out!",
    "A simple danger alert—check it out!",
    "A simple warning alert—check it out!",
    "A simple info alert—check it out!",
    "A simple light alert—check it out!",
    "A simple dark alert—check it out!",
  ];

  List<Color> darkColor = [
    Color(0xFF0f79f3),
    Color(0xFF0a58ca),
    Color(0xFF6c757d),
    Color(0xFF2ed47e),
    Color(0xFFe74c3c),
    Color(0xFFffb264),
    Color(0xFF00cae3),
    Color(0xFF6c757d),
    Color(0xFF495057),
  ];

  List linktext = [
    "A simple unity alert with",
    "A simple primary alert with",
    "A simple secondary alert with",
    "A simple success alert with",
    "A simple danger alert with",
    "A simple warning alert with",
    "A simple info alert with",
    "A simple light alert with",
    "A simple dark alert with",
  ];

  List dismissingAlerts = [
    "A simple unity alert—check it out!",
    "A simple primary alert—check it out!",
    "A simple secondary alert—check it out!",
    "A simple success alert—check it out!",
    "A simple danger alert—check it out!",
    "A simple warning alert—check it out!",
    "A simple info alert—check it out!",
    "A simple light alert—check it out!",
    "A simple dark alert—check it out!",
  ];

  List<Color> dismissibleAlertsDarkColor = [
    Color(0xFF0f79f3),
    Color(0xFF0a58ca),
    Color(0xFF6c757d),
    Color(0xFF2ed47e),
    Color(0xFFe74c3c),
    Color(0xFFffb264),
    Color(0xFF00cae3),
    Color(0xFF6c757d),
    Color(0xFF495057),
  ];

  List dismissingBGAlerts = [
    "A simple unity alert—check it out!",
    "A simple primary alert—check it out!",
    "A simple secondary alert—check it out!",
    "A simple success alert—check it out!",
    "A simple danger alert—check it out!",
    "A simple warning alert—check it out!",
    "A simple info alert—check it out!",
    "A simple light alert—check it out!",
    "A simple dark alert—check it out!",
  ];

  List<Color> dismissingBGAlertDarkColor = [
    Color(0xFF0f79f3),
    Color(0xFF0a58ca),
    Color(0xFF6c757d),
    Color(0xFF2ed47e),
    Color(0xFFe74c3c),
    Color(0xFFffb264),
    Color(0xFF00cae3),
    Color(0xFF6c757d),
    Color(0xFF495057),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context,listen: true);

    List<Color> lightColor = [
      notifier.liblueColor,
      notifier.lipurpleColor,
      Color(0xFFf8f9fa),
      notifier.ligreenColor,
      notifier.liredColor,
      notifier.liyellowColor,
      notifier.litealAccentColor,
      Color(0xFFfcfcfd),
      Color(0xFFced4da),
    ];

    List<Color> dismissibleAlertsLightColor = [
      notifier.liblueColor,
      notifier.lipurpleColor,
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
                            "Alerts",
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
                                "Alerts",
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
                            "Alerts",
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
                                "Alerts",
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
              width < 900
                  ? Column(
                      children: [
                        AlertsWidget(
                          title: "Basic Alerts",
                          text: text,
                          bgColor: lightColor,
                          textColor: darkColor,
                        ),
                        SizedBox(height: 20),
                        AlertsWidget(
                          title: "BG Color Alerts",
                          text: text,
                          bgColor: darkColor,
                        ),
                        SizedBox(height: 20),
                        AlertsWidget(
                          title: "Alerts with Icon",
                          text: text,
                          bgColor: lightColor,
                          textColor: darkColor,
                          showleading: true,
                        ),
                        SizedBox(height: 20),
                        AlertsWidget(
                          title: "BG Color Alerts with Icon",
                          text: text,
                          bgColor: darkColor,
                          showleading: true,
                        ),
                        SizedBox(height: 20),
                        AlertsWidget(
                          title: "Outline Alerts",
                          text: text,
                          textColor: darkColor,
                        ),
                        SizedBox(height: 20),
                        AlertsWidget(
                          title: "Link Color Alerts",
                          text: linktext,
                          bgColor: lightColor,
                          textColor: darkColor,
                          showRichtext: true,
                        ),
                        SizedBox(height: 20),
                        AlertsWidget(
                          title: "Dismissing Alerts",
                          text: dismissingAlerts,
                          bgColor: dismissibleAlertsLightColor,
                          textColor: dismissibleAlertsDarkColor,
                          showtrailing: true,
                        ),
                        SizedBox(height: 20),
                        AlertsWidget(
                          title: "Dismissing BG Alerts",
                          text: dismissingBGAlerts,
                          bgColor: dismissingBGAlertDarkColor,
                          showtrailing: true,
                        ),
                        SizedBox(height: 20),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AlertsWidget(
                                title: "Basic Alerts",
                                text: text,
                                bgColor: lightColor,
                                textColor: darkColor,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: AlertsWidget(
                                title: "BG Color Alerts",
                                text: text,
                                bgColor: darkColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AlertsWidget(
                                title: "Alerts with Icon",
                                text: text,
                                bgColor: lightColor,
                                textColor: darkColor,
                                showleading: true,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: AlertsWidget(
                                title: "BG Color Alerts with Icon",
                                text: text,
                                bgColor: darkColor,
                                showleading: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AlertsWidget(
                                title: "Outline Alerts",
                                text: text,
                                textColor: darkColor,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: AlertsWidget(
                                title: "Link Color Alerts",
                                text: linktext,
                                bgColor: lightColor,
                                textColor: darkColor,
                                showRichtext: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: AlertsWidget(
                                title: "Dismissing Alerts",
                                text: dismissingAlerts,
                                bgColor: dismissibleAlertsLightColor,
                                textColor: dismissibleAlertsDarkColor,
                                showtrailing: true,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: AlertsWidget(
                                title: "Dismissing BG Alerts",
                                text: dismissingBGAlerts,
                                bgColor: dismissingBGAlertDarkColor,
                                showtrailing: true,
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
