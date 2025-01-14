
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/projects_management_controllers/all_project_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget allProjects(context) {
  AllProjectController allProjectController = Get.put(AllProjectController());
  notifier = Provider.of(context, listen: true);

  List<Color> statusBgColor = [
    notifier.liyellowColor,
    notifier.ligreenColor,
    notifier.liblueColor,
    notifier.liredColor,
    notifier.liyellowColor,
    notifier.ligreenColor,
    notifier.liblueColor,
    notifier.liredColor,
    notifier.liyellowColor,
    notifier.liblueColor,
  ];

  bool button = false;

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

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
                        "All Projects",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: notifier.text,
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
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        // width: constraints.maxWidth,
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: notifier.getfillborder,
                            ),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(80),
                            1: FixedColumnWidth(230),
                            2: FixedColumnWidth(190),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(130),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(100),
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
                                      "ID",
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
                                      "Project Name",
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
                                      "Client",
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
                                      "Start Date",
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
                                      "End Date",
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
                                      "Budget",
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
                            for (var a = allProjectController.loadmore;
                                a <
                                    allProjectController.loadmore +
                                        allProjectController.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "#${allProjectController.id[a]}",
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
                                        allProjectController.projectName[a],
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        allProjectController.client[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          // color: const Color(0xFF475569),
                                          fontWeight: FontWeight.w300,
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
                                        allProjectController.startDate[a],
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
                                        allProjectController.endDate[a],
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
                                        "\$${allProjectController.budget[a]}",
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
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        decoration: BoxDecoration(
                                          color: statusBgColor[a],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            allProjectController.status[a],
                                            style: TextStyle(
                                              color: allProjectController
                                                  .statusTextColor[a],
                                              fontFamily: "Outfit",
                                            ),
                                          ),
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
                          allProjectController.id.shuffle();
                          allProjectController.projectName.shuffle();
                          allProjectController.client.shuffle();
                          allProjectController.startDate.shuffle();
                          allProjectController.endDate.shuffle();
                          allProjectController.budget.shuffle();
                          allProjectController.status.shuffle();
                        });
                        allProjectController
                            .setloadmore(allProjectController.selectpage);
                      }
                    },
                    nextbutton: () {
                      if (button == false) {
                        setState(() {
                          button = !button;
                          allProjectController.id.shuffle();
                          allProjectController.projectName.shuffle();
                          allProjectController.client.shuffle();
                          allProjectController.startDate.shuffle();
                          allProjectController.endDate.shuffle();
                          allProjectController.budget.shuffle();
                          allProjectController.status.shuffle();
                        });
                        allProjectController
                            .setloadmore(allProjectController.selectpage);
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
