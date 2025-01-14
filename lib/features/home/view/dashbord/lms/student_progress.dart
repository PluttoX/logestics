
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../Controllers/dashbord_controllers/lms_controllers/student_progress_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget studentProgress(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  bool button = false;

  StudentProgressController studentController =
      Get.put(StudentProgressController());

  return StatefulBuilder(
    builder: (context, setState) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: notifier.getBgColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Student's Progress",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: notifier.text,
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
                SizedBox(height: 15),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: width < 950
                            ? null
                            : width < 1350
                                ? constraints.maxWidth / 1.1 + 60
                                : width < 1600
                                    ? constraints.maxWidth / 1.1 + 80
                                    : constraints.maxWidth / 1.1 + 100,
                        child: Table(
                          border: TableBorder(
                            horizontalInside:
                                BorderSide(color: notifier.getfillborder),
                          ),
                          columnWidths: {
                            0: FixedColumnWidth(70),
                            1: FixedColumnWidth(
                              width < 750
                                  ? 160
                                  : width < 950
                                      ? 290
                                      : 300,
                            ),
                            2: FixedColumnWidth(width < 750
                                ? 220
                                : width < 950
                                    ? 290
                                    : 300),
                            3: FixedColumnWidth(100),
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
                                      "Name",
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
                                      "Course Name",
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
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Progress",
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
                            for (var a = studentController.loadmore;
                                a <
                                    studentController.loadmore +
                                        studentController.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 50,
                                        child: Text(
                                          "#${studentController.studentId[a]}",
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        studentController.studentName[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: notifier.text,
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
                                        studentController.studentCourseName[a],
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
                                        height: 50,
                                        alignment: Alignment.centerRight,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              studentController.progress[a],
                                              style: TextStyle(
                                                letterSpacing: 1,
                                                fontFamily: "Outfit",
                                                fontSize: 15,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            ProgressBar(
                                              value: studentController
                                                  .progressvalues[a],
                                              width: constraints.maxWidth,
                                              color: studentController
                                                  .progressColor[a],
                                              height: 5,
                                              backgroundColor: Colors.black12,
                                            ),
                                          ],
                                        ),
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
                  number1: "5",
                  number2: "10",
                  number3: "15",
                  numberofpages: "1 – 5 of 10",
                  backbutton: () {
                    if (button == true) {
                      setState(() {
                        button = !button;
                        studentController.studentId.shuffle();
                        studentController.studentName.shuffle();
                        studentController.studentCourseName.shuffle();
                        studentController.progress.shuffle();
                        studentController.progressColor.shuffle();
                        studentController.progressvalues.shuffle();
                      });
                      studentController
                          .setloadmore(studentController.selectpage);
                    }
                  },
                  nextbutton: () {
                    if (button == false) {
                      setState(() {
                        button = !button;
                        studentController.studentId.shuffle();
                        studentController.studentName.shuffle();
                        studentController.studentCourseName.shuffle();
                        studentController.progress.shuffle();
                        studentController.progressColor.shuffle();
                        studentController.progressvalues.shuffle();
                      });
                      studentController
                          .setloadmore(studentController.selectpage);
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
