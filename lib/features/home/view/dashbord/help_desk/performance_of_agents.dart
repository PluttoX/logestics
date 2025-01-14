
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../Controllers/dashbord_controllers/help_desk_controllers/performance_of_agents_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';

late ColorNotifier notifier;

Widget performanceofAgents(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  bool button = false;

  PerformanceOfAgentsController performanceController =
      Get.put(PerformanceOfAgentsController());

  return LayoutBuilder(
    builder: (context, constraints) {
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Performance of Agents",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: notifier.text,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: width < 1500 ? null : constraints.maxWidth,
                        child: Table(
                          border: TableBorder(
                            horizontalInside:
                                BorderSide(color: notifier.getfillborder),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(90),
                            1: FixedColumnWidth(230),
                            2: FixedColumnWidth(110),
                            3: FixedColumnWidth(120),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(180),
                            6: FixedColumnWidth(190),
                            7: FixedColumnWidth(100),
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
                                    child: Text(
                                      "Agent ID",
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
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Agent",
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
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Total Tickets",
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
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Open Tickets",
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
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Resolved Tickets",
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
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "Ave.Resolution Time",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
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
                                    child: Center(
                                      child: Text(
                                        "Satisfaction Rate",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
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
                                    child: Center(
                                      child: Text(
                                        "Action",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var a = performanceController.loadmore;
                                a <
                                    performanceController.loadmore +
                                        performanceController.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "#${performanceController.agentId[a]}",
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: ClipOval(
                                          child: Image.asset(
                                            performanceController
                                                .agentImages[a],
                                            height: height / 25,
                                          ),
                                        ),
                                        title: Text(
                                          performanceController.agentName[a],
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            color: notifier.text,
                                            fontWeight: FontWeight.w500,
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
                                      child: Text(
                                        performanceController.totalTickets[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey,
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
                                        performanceController.openTickets[a],
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        performanceController
                                            .resolvedTickets[a],
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
                                      child: Center(
                                        child: Text(
                                          performanceController
                                              .aveResolutionTime[a],
                                          textAlign: TextAlign.start,
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
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              performanceController
                                                  .satisfactionRate[a],
                                              style: TextStyle(
                                                letterSpacing: 1,
                                                fontFamily: "Outfit",
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            ProgressBar(
                                              value: performanceController
                                                  .satisfactionvalue[a],
                                              width: 70,
                                              color: performanceController
                                                  .satisfactionRateColor[a],
                                              height: 5,
                                              backgroundColor:
                                                  notifier.lightbgcolor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/eye.png",
                                            height: 20,
                                            color: Color(0xFF2a8ef6),
                                          ),
                                          SizedBox(width: 10),
                                          Image.asset(
                                            "assets/images/pen.png",
                                            height: 20,
                                            color: notifier.text,
                                          ),
                                          SizedBox(width: 10),
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
                NextPageButton(
                  number1: "6",
                  number2: "12",
                  number3: "18",
                  numberofpages: "1 – 6 of 12",
                  backbutton: () {
                    if (button == true) {
                      setState(() {
                        button = !button;
                        performanceController.agentId.shuffle();
                        performanceController.agentImages.shuffle();
                        performanceController.agentName.shuffle();
                        performanceController.totalTickets.shuffle();
                        performanceController.openTickets.shuffle();
                        performanceController.resolvedTickets.shuffle();
                        performanceController.aveResolutionTime.shuffle();
                        performanceController.satisfactionRate.shuffle();
                        performanceController.satisfactionRateColor.shuffle();
                        performanceController.satisfactionvalue.shuffle();
                      });
                      performanceController
                          .setloadmore(performanceController.selectpage);
                    }
                  },
                  nextbutton: () {
                    if (button == false) {
                      setState(() {
                        button = !button;
                        performanceController.agentId.shuffle();
                        performanceController.agentImages.shuffle();
                        performanceController.agentName.shuffle();
                        performanceController.totalTickets.shuffle();
                        performanceController.openTickets.shuffle();
                        performanceController.resolvedTickets.shuffle();
                        performanceController.aveResolutionTime.shuffle();
                        performanceController.satisfactionRate.shuffle();
                        performanceController.satisfactionRateColor.shuffle();
                        performanceController.satisfactionvalue.shuffle();
                      });
                      performanceController
                          .setloadmore(performanceController.selectpage);
                    }
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
