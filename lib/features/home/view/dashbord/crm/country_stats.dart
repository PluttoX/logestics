
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget countryStats(context) {
  List countryflags = [
    "assets/images/usa.png",
    "assets/images/china.png",
    "assets/images/germany.png",
    "assets/images/australia.png",
  ];

  List countryname = ["United States", "China", "Germany", "Australia"];

  List user = ["18903", "42827", "21673", "67822"];

  List bouncerate = ["0.73%", "0.34%", "0.56%", "0.87%"];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

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
              "Country Stats",
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
        SizedBox(height: 20),
        Expanded(
          child: Image.asset(
            "assets/images/locations-map.png",
          ),
        ),
        Row(
          children: [
            Text(
              "Country",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15,
                fontWeight: FontWeight.bold, color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
            Spacer(),
            SizedBox(width: width < 550 ? 70 : 80),
            Text(
              "User",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15,
                fontWeight: FontWeight.bold, color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
            Spacer(),
            Text(
              "Bounce Rate",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15,
                fontWeight: FontWeight.bold, color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
          ],
        ),
        ListView.builder(
          itemCount: countryflags.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width < 800
                      ? width / 3.5
                      : width < 1300
                          ? width / 6.9
                          : width / 7.5,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey,
                      ),
                      child: Image.asset(
                        countryflags[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      countryname[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        fontWeight: FontWeight.bold, color: notifier.text,
                        // color: Color(0xFF475569),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  user[index],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                Spacer(flex: 2),
                Text(
                  bouncerate[index],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
