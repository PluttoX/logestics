
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/crm_controllers/recent_leads_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget recentLeads(context) {
  RecentLeadsController recentLeadsController =
      Get.put(RecentLeadsController());

  bool isActive = false;
  bool button = false;

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  List<Color> statusbgcolor = [
    notifier.ligreenColor,
    notifier.liblueColor,
    notifier.liyellowColor,
    notifier.liredColor,
    notifier.ligreenColor,
    notifier.ligreenColor,
    notifier.ligreenColor,
    notifier.liblueColor,
    notifier.liblueColor,
    notifier.liredColor,
  ];

  return LayoutBuilder(
    builder: (context, constraints) {
      return StatefulBuilder(
        builder: (context, setState) {
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
                        "Recent Leads",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 20,
                          fontWeight: FontWeight.bold, color: notifier.text,
                          // color: const Color(0xFF475569),
                        ),
                      ),
                      Popupbutton(
                        title: "This Month",
                        items: const [
                          "This Day",
                          "This Week",
                          "This Month",
                          "This Year",
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height / 50),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: width < 1600 ? null : constraints.maxWidth,
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: notifier.getfillborder,
                            ),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(60),
                            1: FixedColumnWidth(200),
                            2: FixedColumnWidth(220),
                            3: FixedColumnWidth(180),
                            4: FixedColumnWidth(120),
                            5: FixedColumnWidth(100),
                          },
                          children: [
                            TableRow(
                              decoration:
                                  BoxDecoration(color: notifier.tablehader),
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Transform.scale(
                                      scale: 1.2,
                                      child: Checkbox(
                                        overlayColor:
                                            MaterialStateProperty.all<Color>(
                                          Colors.transparent,
                                        ),
                                        activeColor: const Color(0xff0f79f3),
                                        side: BorderSide(
                                          width: 2,
                                          color: notifier.chakboxborder,
                                        ),
                                        value: isActive,
                                        onChanged: (val) {
                                          setState(() {
                                            isActive = val!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Customer",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Source",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Status",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Action",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var a = recentLeadsController.loadmore;
                                a <
                                    recentLeadsController.loadmore +
                                        recentLeadsController.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: StatefulBuilder(
                                        builder:
                                            (BuildContext context, setState) {
                                          return Transform.scale(
                                            scale: 1.2,
                                            child: Checkbox(
                                              overlayColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                Colors.transparent,
                                              ),
                                              activeColor:
                                                  const Color(0xff0f79f3),
                                              side: BorderSide(
                                                width: 2,
                                                color: notifier.chakboxborder,
                                              ),
                                              value: isActive,
                                              onChanged: (val) {
                                                setState(() {
                                                  isActive = val!;
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: ClipOval(
                                          child: Image.asset(
                                            recentLeadsController
                                                .customerimage[a],
                                            height: 60,
                                          ),
                                        ),
                                        title: Text(
                                          recentLeadsController.customername[a],
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                            // color: const Color(0xFF475569),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${recentLeadsController.emial[a]}@unity.com",
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        recentLeadsController.source[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: statusbgcolor[a],
                                      ),
                                      child: Center(
                                        child: Text(
                                          recentLeadsController.status[a],
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            color: recentLeadsController
                                                .statustextcolor[a],
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/eye.png",
                                            height: 40,
                                            color: Color(0xFF2a8ef6),
                                          ),
                                          Image.asset(
                                            "assets/images/pen.png",
                                            height: 20,
                                            color: notifier.text,
                                          ),
                                          Image.asset(
                                            "assets/images/trash.png",
                                            height: 20,
                                            color: notifier.text,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: NextPageButton(
                    number1: "5",
                    number2: "10",
                    number3: "20",
                    numberofpages: "1 – 5 of 10",
                    backbutton: () {
                      if (button == true) {
                        setState(() {
                          button = !button;
                          recentLeadsController.customerimage.shuffle();
                          recentLeadsController.customername.shuffle();
                          recentLeadsController.emial.shuffle();
                          recentLeadsController.source.shuffle();
                          recentLeadsController.status.shuffle();
                          recentLeadsController.statustextcolor.shuffle();
                          statusbgcolor.shuffle();
                        });
                        recentLeadsController
                            .setloadmore(recentLeadsController.selectpage);
                      }
                    },
                    nextbutton: () {
                      if (button == false) {
                        setState(() {
                          button = !button;
                          recentLeadsController.customerimage.shuffle();
                          recentLeadsController.customername.shuffle();
                          recentLeadsController.emial.shuffle();
                          recentLeadsController.source.shuffle();
                          recentLeadsController.status.shuffle();
                          recentLeadsController.statustextcolor.shuffle();
                          statusbgcolor.shuffle();
                        });
                        recentLeadsController
                            .setloadmore(recentLeadsController.selectpage);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
