
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/lms_controllers/courses_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';

late ColorNotifier notifier;

Widget courses(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  CoursesController coursesController = Get.put(CoursesController());

  notifier = Provider.of(context, listen: true);

  bool button = false;

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
              children: [
                width < 550
                    ? Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Courses",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: notifier.text,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: coursesController
                                    .coursesCategoryimage.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          coursesController
                                              .updateSelectPackagevalue(index);
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: index ==
                                                coursesController.selectPackage
                                                    .toInt()
                                            ? Color(0xFF0f79f3)
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: index ==
                                                  coursesController
                                                      .selectPackage
                                                      .toInt()
                                              ? Color(0xFF0f79f3)
                                              : notifier.getfillborder,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              coursesController
                                                  .coursesCategoryimage[index],
                                              height: height / 65,
                                              color: index ==
                                                      coursesController
                                                          .selectPackage
                                                          .toInt()
                                                  ? Colors.white
                                                  : coursesController
                                                          .coursesCategoryimagecolor[
                                                      index],
                                            ),
                                            Text(
                                              " ${coursesController.coursesCategory[index]}",
                                              style: TextStyle(
                                                fontFamily: "Outfit",
                                                // fontSize: height / 70,
                                                color: index ==
                                                        coursesController
                                                            .selectPackage
                                                            .toInt()
                                                    ? Colors.white
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(width: 10);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Courses",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: notifier.text,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: coursesController
                                    .coursesCategoryimage.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          coursesController
                                              .updateSelectPackagevalue(index);
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: index ==
                                                coursesController.selectPackage
                                                    .toInt()
                                            ? Color(0xFF0f79f3)
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: index ==
                                                  coursesController
                                                      .selectPackage
                                                      .toInt()
                                              ? Color(0xFF0f79f3)
                                              : notifier.getfillborder,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              coursesController
                                                  .coursesCategoryimage[index],
                                              height: height / 65,
                                              color: index ==
                                                      coursesController
                                                          .selectPackage
                                                          .toInt()
                                                  ? Colors.white
                                                  : coursesController
                                                          .coursesCategoryimagecolor[
                                                      index],
                                            ),
                                            Text(
                                              " ${coursesController.coursesCategory[index]}",
                                              style: TextStyle(
                                                fontFamily: "Outfit",
                                                color: index ==
                                                        coursesController
                                                            .selectPackage
                                                            .toInt()
                                                    ? Colors.white
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(width: 10);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 15),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: width < 1600
                            ? null
                            : constraints.maxWidth / 1.1 + 100,
                        child: Table(
                          border: TableBorder(
                            horizontalInside:
                                BorderSide(color: notifier.getfillborder),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(80),
                            1: FixedColumnWidth(250),
                            2: FixedColumnWidth(120),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(130),
                            6: FixedColumnWidth(130),
                            7: FixedColumnWidth(115),
                            8: FixedColumnWidth(120),
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
                                    child: Text(
                                      "Category",
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
                                      "Instructor",
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
                                      "Enrolled Students",
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
                                        "Start Date",
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
                                        "End Date",
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
                                        "Price",
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
                                        textAlign: TextAlign.center,
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
                            for (var a = coursesController.loadmore;
                                a <
                                    coursesController.loadmore +
                                        coursesController.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "#${coursesController.id[a]}",
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
                                        coursesController.courseName[a],
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
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        coursesController.category[a],
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
                                        coursesController.instructor[a],
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
                                        coursesController.enrolledStudents[a],
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
                                          coursesController.startDate[a],
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
                                        child: Text(
                                          coursesController.endDate[a],
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
                                        child: Text(
                                          coursesController.price[a],
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
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            "assets/images/eye.png",
                                            height: 20,
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
                SizedBox(height: 15),
                NextPageButton(
                  number1: "6",
                  number2: "12",
                  number3: "18",
                  numberofpages: "1 – 6 of 12",
                  backbutton: () {
                    if (button == true) {
                      setState(() {
                        button = !button;
                        coursesController.id.shuffle();
                        coursesController.courseName.shuffle();
                        coursesController.category.shuffle();
                        coursesController.instructor.shuffle();
                        coursesController.enrolledStudents.shuffle();
                        coursesController.startDate.shuffle();
                        coursesController.endDate.shuffle();
                        coursesController.price.shuffle();
                      });
                      coursesController
                          .setloadmore(coursesController.selectpage);
                    }
                  },
                  nextbutton: () {
                    if (button == false) {
                      setState(() {
                        button = !button;
                        coursesController.id.shuffle();
                        coursesController.courseName.shuffle();
                        coursesController.category.shuffle();
                        coursesController.instructor.shuffle();
                        coursesController.enrolledStudents.shuffle();
                        coursesController.startDate.shuffle();
                        coursesController.endDate.shuffle();
                        coursesController.price.shuffle();
                      });
                      coursesController
                          .setloadmore(coursesController.selectpage);
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
