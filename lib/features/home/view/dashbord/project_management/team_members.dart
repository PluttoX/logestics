
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../theme/theme.dart';
import '../../../widget/stringfile.dart';

late ColorNotifier notifier;

Widget teamMembers(context) {
  List membersimage = [
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    // "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
  ];

  List membersnames = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
  ];

  List memberswork = [
    "Product Manager",
    "Web Designer",
    "UI/UX Designer",
    "Lead Developer",
    "Angular Developer",
  ];

  List hours = ["123 hrs", "64 hrs", "50 hrs", "64 hrs", "85 hrs"];

  List status = ["63%", "52%", "75%", "89%", "58%"];

  List<Color> statuscolor = [
    Color(0xFF00cae3),
    Color(0xFF0f79f3),
    Color(0xFFffb264),
    Color(0xFF796df6),
    Color(0xFF2ed47e),
  ];

  List<double> value = [0.7, 0.5, 0.6, 0.8, 0.6];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Team Members",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: notifier.text,
                    ),
                  ),
                  Text(
                    "View All",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: width < 400 ? null : constraints.maxWidth,
                    child: Table(
                      border: TableBorder(
                        horizontalInside:
                            BorderSide(color: notifier.getfillborder),
                      ),
                      columnWidths: {
                        0: FixedColumnWidth(width < 950 ? 200 : 250),
                        1: FixedColumnWidth(width < 950 ? 90 : 80),
                        2: FixedColumnWidth(width < 950 ? 90 : 70),
                      },
                      children: [
                        TableRow(
                          decoration: BoxDecoration(color: notifier.tablehader),
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Member",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Hours",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Text(
                                  "Status",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        for (var a = 0; a < membersnames.length; a++)
                          TableRow(
                            children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: ListTile(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  minVerticalPadding: 0,
                                  leading: ClipOval(
                                    child: Image.asset(
                                      membersimage[a],
                                      height: height / 20,
                                    ),
                                  ),
                                  title: Text(
                                    membersnames[a],
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      color: notifier.text,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    memberswork[a],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Text(
                                  hours[a],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        status[a],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: ProgressBar(
                                          value: value[a],
                                          width: width,
                                          color: statuscolor[a],
                                          height: 5,
                                          backgroundColor:
                                              notifier.lightbgcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
