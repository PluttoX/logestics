
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../../Controllers/dashbord_controllers/lms_controllers/instructors_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget topInstructors(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  bool button = false;

  InstructorsController instructorsController =
      Get.put(InstructorsController());

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Instructors",
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
                      Container(
                        decoration: BoxDecoration(
                            // color: Colors.amber,
                            ),
                        width: width < 1600
                            ? null
                            : constraints.maxWidth / 1.2 + 100,
                        child: Table(
                          border: TableBorder(
                            horizontalInside:
                                BorderSide(color: notifier.getfillborder),
                          ),
                          columnWidths: {
                            0: FixedColumnWidth(constraints.maxWidth / 2.2),
                            1: FixedColumnWidth(constraints.maxWidth / 2.2),
                          },
                          children: [
                            for (var a = instructorsController.loadmore;
                                a <
                                    instructorsController.loadmore +
                                        instructorsController.selectindex;
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
                                          child: Image.asset(
                                            instructorsController
                                                .instructorsImage[a],
                                            height: height / 20,
                                          ),
                                        ),
                                        title: Text(
                                          instructorsController
                                              .instructorsName[a],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 16,
                                            color: notifier.text,
                                          ),
                                        ),
                                        subtitle: Text(
                                         "${instructorsController.instructorsEmailId[a]}@unity.com",
                                          overflow: TextOverflow.ellipsis,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SmoothStarRating(
                                          allowHalfRating: true,
                                          size: 20,
                                          rating: instructorsController
                                              .ratingvalues[a],
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          defaultIconData: Icons.star_outline,
                                          starCount: 5,
                                          color: const Color(0xffECA61B),
                                          borderColor: const Color(0xffECA61B),
                                          onRatingChanged: (value) {
                                            setState(() {
                                              instructorsController
                                                  .ratingvalues[a] = value;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child: Text(
                                            " (${instructorsController.ratingvalues[a].toStringAsFixed(1)})",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: "Outfit",
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
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
                        instructorsController.instructorsImage.shuffle();
                        instructorsController.instructorsName.shuffle();
                        instructorsController.instructorsEmailId.shuffle();
                        instructorsController.ratingvalues.shuffle();
                      });
                      instructorsController
                          .setloadmore(instructorsController.selectpage);
                    }
                  },
                  nextbutton: () {
                    if (button == false) {
                      setState(() {
                        button = !button;
                        instructorsController.instructorsImage.shuffle();
                        instructorsController.instructorsName.shuffle();
                        instructorsController.instructorsEmailId.shuffle();
                        instructorsController.ratingvalues.shuffle();
                      });
                      instructorsController
                          .setloadmore(instructorsController.selectpage);
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
