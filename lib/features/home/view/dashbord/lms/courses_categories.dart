
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/lms_controllers/courses_categories_controllers.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget coursesCategory(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  bool button = false;

  notifier = Provider.of(context, listen: true);

  CoursesCategoriesControllers coursesControllers =
      Get.put(CoursesCategoriesControllers());

  return StatefulBuilder(
    builder: (context, setState) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: notifier.getBgColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses Categories",
                      overflow: TextOverflow.ellipsis,
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
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Table(
                        border: TableBorder(
                          horizontalInside:
                              BorderSide(color: notifier.getfillborder),
                        ),
                        columnWidths: {
                          0: FixedColumnWidth(
                            width < 570
                                ? constraints.maxWidth / 2.5
                                : width < 770
                                    ? constraints.maxWidth / 2.4
                                    : width < 950
                                        ? constraints.maxWidth / 2.2
                                        : width < 1200
                                            ? constraints.maxWidth / 2.4
                                            : width < 1300
                                                ? constraints.maxWidth / 2.5
                                                : width < 1600
                                                    ? constraints.maxWidth / 2.4
                                                    : constraints.maxWidth /
                                                        2.3,
                          ),
                          1: FixedColumnWidth(
                            width < 570
                                ? constraints.maxWidth / 2.5
                                : width < 770
                                    ? constraints.maxWidth / 2.4
                                    : width < 950
                                        ? constraints.maxWidth / 2.2
                                        : width < 1200
                                            ? constraints.maxWidth / 2.4
                                            : width < 1300
                                                ? constraints.maxWidth / 2.5
                                                : width < 1600
                                                    ? constraints.maxWidth / 2.4
                                                    : constraints.maxWidth /
                                                        2.3,
                          ),
                          2: FixedColumnWidth(40),
                        },
                        children: [
                          for (var a = coursesControllers.loadmore;
                              a <
                                  coursesControllers.loadmore +
                                      coursesControllers.selectindex;
                              a++)
                            TableRow(
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: ClipOval(
                                        child: Image.network(
                                          coursesControllers.coursesImages[a],
                                          // height: 50,
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      title: Text(
                                        coursesControllers.coursesName[a],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 16,
                                          color: notifier.text,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${coursesControllers.coursesCategories[a]} Courses",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // color: Colors.green,
                                        ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Enrolled ${coursesControllers.enrolled[a]}",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Container(
                                    // padding: const EdgeInsets.all(8.0),
                                    height: 40,
                                    margin: EdgeInsets.only(
                                      top: 19,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
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
                        coursesControllers.coursesImages.shuffle();
                        coursesControllers.coursesName.shuffle();
                        coursesControllers.coursesCategories.shuffle();
                        coursesControllers.enrolled.shuffle();
                      });
                      coursesControllers
                          .setloadmore(coursesControllers.selectpage);
                    }
                  },
                  nextbutton: () {
                    if (button == false) {
                      setState(() {
                        button = !button;
                        coursesControllers.coursesImages.shuffle();
                        coursesControllers.coursesName.shuffle();
                        coursesControllers.coursesCategories.shuffle();
                        coursesControllers.enrolled.shuffle();
                      });
                      coursesControllers
                          .setloadmore(coursesControllers.selectpage);
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
