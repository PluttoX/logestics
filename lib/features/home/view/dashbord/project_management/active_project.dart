
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';
import '../../pages/e-commerce/Orders/Order_Details/tracking_id.dart';

late ColorNotifier notifier;

Widget activeProject(context) {
  List activeProjectimage = [
    "assets/images/project1.svg",
    "assets/images/project2.svg",
  ];

  notifier = Provider.of(context, listen: true);

  List activeProjectTitle = ["Project Alpho", "Assigned To"];

  int index = 0;

  List popubutonIcon = [
    "assets/images/eye.png",
    "assets/images/pen-line.png",
    "assets/images/trash.png",
  ];

  List popubuttontext = ["View", "Edit", "Delete"];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Active Project",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                  ),
                ),
                Popupbutton(
                  title: "Poject 01",
                  items: const [
                    "Poject 01",
                    "Poject 02",
                    "Poject 03",
                    "Poject 04",
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: width < 750 ? 130 : height / 10,
                  width: width < 750 ? width / 1.4 : null,
                  child: ListView.builder(
                    itemCount: activeProjectimage.length,
                    shrinkWrap: true,
                    scrollDirection:
                        width < 650 ? Axis.vertical : Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: width < 750 ? width / 2.5 : width / 5,
                        child: Center(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: notifier.lightbgcolor,
                                shape: BoxShape.circle,
                              ),
                              child:
                                  SvgPicture.asset(activeProjectimage[index]),
                            ),
                            title: Text(
                              "Active Project",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: notifier.text,
                              ),
                            ),
                            subtitle: index == 0
                                ? RichText(
                                    text: TextSpan(
                                      text: 'Cilent : ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: notifier.text,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: 'Shawn Kennedy',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Text(
                                    "Vaxo Corporation",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                PopupMenuButton(
                  tooltip: '',
                  color: notifier.getBgColor,
                  offset: const Offset(0, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 1,
                  splashRadius: 1,
                  shadowColor: Colors.grey,
                  constraints: BoxConstraints(
                    maxWidth: 150,
                    minWidth: 150,
                  ),
                  child: SizedBox(
                    child: Icon(
                      Icons.more_horiz,
                      color: notifier.text,
                    ),
                  ),
                  itemBuilder: (context) => [
                    for (var i = 0; i < popubutonIcon.length; i++)
                      PopupMenuItem(
                        value: i,
                        child: Row(
                          children: [
                            Image.asset(
                              popubutonIcon[i],
                              height: 20,
                              color: Color(0xFF1079f3),
                            ),
                            Text(
                              "  ${popubuttontext[i]}",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                color: notifier.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                 ],
                ),
              ],
            ),
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFF6153df),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      trackingIdContainer("01"),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      trackingIdContainer("02"),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      trackingIdContainer("03"),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.white,
                        ),
                      ),
                      trackingIdContainer("04"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      trackingIdName(context, "Panning", TextAlign.start),
                      trackingIdName(context, "Design", TextAlign.center),
                      trackingIdName(context, "Development", TextAlign.center),
                      trackingIdName(context, "Testing", TextAlign.end),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "0%",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "50%",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "100%",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ProgressBar(
                      value: 0.7,
                      width: width,
                      color: Color(0xFF00cae3),
                      height: 5,
                      backgroundColor: Colors.white38,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width < 750 ? width / 2.5 : width / 7,
                  child: Text(
                    "Project Total Hours: 384 hrs",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 15,
                      color: notifier.text,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  width: width < 750 ? width / 2.5 : width / 7,
                  child: Text(
                    "Project Hours Left: 144 hrs",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 15,
                      color: notifier.text,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
