
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget aecContainer(
  context, {
  required String title,
  required String subtitle,
  required String image,
  required String greytext,
  required String colortext,
  required Color textcolor,
  required String arrowimage,
  required Color backgroundcolor,
  required Color centercontainer,
}) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return LayoutBuilder(
    builder: (context, constraints) {
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
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: notifier.text,
              ),
            ),
            Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: notifier.text,
              ),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 90,
                width: 90,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: centercontainer,
                ),
                child: SvgPicture.asset(image),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  greytext,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: "Outfit",
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: backgroundcolor,
                    border: Border.all(
                      color: textcolor,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          arrowimage,
                          color: textcolor,
                        ),
                        Text(
                          " $colortext",
                          style: TextStyle(
                            color: textcolor,
                            fontFamily: "Outfit",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
