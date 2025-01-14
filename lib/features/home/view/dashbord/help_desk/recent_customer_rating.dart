
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../../Controllers/dashbord_controllers/help_desk_controllers/recent_customer_rating_controller.dart';
import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget recentCustomerRating(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  RecentCustomerRatingController customerRatingController =
      Get.put(RecentCustomerRatingController());
  
  notifier = Provider.of(context,listen: true);

  return LayoutBuilder(
    builder: (context, constraints) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: notifier.getBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Customer Rating",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  notifier.text,
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
                        width: width < 1050 ? null : constraints.maxWidth,
                        child: Table(
                          columnWidths: const {
                            0: FixedColumnWidth(80),
                            1: FixedColumnWidth(200),
                            2: FixedColumnWidth(200),
                            3: FixedColumnWidth(250),
                          },
                          children: [
                            TableRow(
                              decoration:
                                  BoxDecoration(color: notifier.tablehader),
                              children:  [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "# ID",
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
                                      "Customer",
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
                                      "Rating",
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
                                      "Message",
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
                            for (var a = customerRatingController.loadmore;
                                a <
                                    customerRatingController.loadmore +
                                        customerRatingController.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "#${customerRatingController.id[a]}",
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
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              customerRatingController
                                                  .customerImage[a],
                                              height: 40,
                                            ),
                                          ),
                                          SizedBox(width: height / 80),
                                          Text(
                                            customerRatingController
                                                .customerName[a],
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color:  notifier.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          SmoothStarRating(
                                            allowHalfRating: true,
                                            size: 20,
                                            rating: customerRatingController
                                                .ratingValues[a],
                                            filledIconData: Icons.star,
                                            halfFilledIconData: Icons.star_half,
                                            defaultIconData: Icons.star_outline,
                                            starCount: 5,
                                            color: const Color(0xffECA61B),
                                            borderColor:
                                                const Color(0xffECA61B),
                                            onRatingChanged: (value) {
                                              setState(() {
                                                customerRatingController
                                                    .ratingValues[a] = value;
                                              });
                                            },
                                          ),
                                          Text(
                                            "(${customerRatingController.ratingValues[a].toStringAsFixed(1)})",
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "${customerRatingController.message[a]}",
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
    },
  );
}
