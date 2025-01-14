
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';
import '../../../widget/stringfile.dart';

late ColorNotifier notifier;

Widget topSellers(context) {
  List<double> ratingvalues = [5, 4.5, 4, 5, 5, 3.5];

  List topsellerimages = [
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/blue-man.jpg",
  ];

  List topsellernames = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
  ];

  List topsellerCustId = ["76431", "64815", "34581", "67941", "36985", "26985"];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Sellers",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                    // color: const Color(0xFF475569),
                  ),
                ),
                Popupbutton(
                  title: "This Week",
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
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: topsellerimages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      "0${index + 1}.",
                      style: TextStyle(
                        letterSpacing: 1,
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    title: ListTile(
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      leading: ClipOval(
                        child: Image.asset(
                          topsellerimages[index],
                          height: height / 23,
                        ),
                      ),
                      title: Text(
                        topsellernames[index],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.bold, color: notifier.text,
                          // color: const Color(0xFF475569),
                        ),
                      ),
                      subtitle: Text(
                        "Customer ID #${topsellerCustId[index]}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    trailing: SizedBox(
                      width: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SmoothStarRating(
                            allowHalfRating: true,
                            size: height / 50,
                            rating: ratingvalues[index],
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half,
                            defaultIconData: Icons.star_outline,
                            starCount: 5,
                            color: const Color(0xffECA61B),
                            borderColor: const Color(0xffECA61B),
                            onRatingChanged: (value) {
                              setState(() {
                                ratingvalues[index] = value;
                              });
                            },
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              " (${ratingvalues[index].toStringAsFixed(1)})",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Outfit",
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 6,
                    child: StyledDivider(
                      color: notifier.getfillborder,
                      lineStyle: DividerLineStyle.dashed,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
