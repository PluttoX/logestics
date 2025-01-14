
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget topContainers(
  context, {
  required String title,
  required String value,
  required String image,
  required String colortext,
  required String greytext,
  required Color color,
  required Widget child,
}) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  
  notifier = Provider.of(context,listen: true);
  
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    width: width,
    decoration: BoxDecoration(
      color:notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontFamily: "Outfit",
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: notifier.text,
                fontFamily: "Outfit",
              ),
            ),
            Spacer(),
            SizedBox(
              height: 30,
              child: Row(
                children: [
                  Image.asset(
                    image,
                    color: color,
                  ),
                  RichText(
                    text: TextSpan(
                      text: " $colortext ",
                      style: TextStyle(
                        fontSize: 15,
                        color: color,
                        fontFamily: "Outfit",
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: greytext,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 80,
          width: 150,
          child: child,
        ),
      ],
    ),
  );
}
