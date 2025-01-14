
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

late ColorNotifier notifier;

Widget mycontainers(
  context, {
  required String title,
  required String subtitle,
  required String text,
  required Widget child,
  Color? backgroundColor,
  String? containertext,
  Color? textColor,
  String? image,
  Color? mainbackground,
}) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: mainbackground ?? notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: notifier.text,
                        // color: Color(0xFF475569),
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: notifier.text,
                        // color: Color(0xFF475569),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width < 415
                      ? constraints.maxWidth / 2.5
                      : width < 1550
                          ? constraints.maxWidth / 2
                          : null,
                  child: Text(
                    text,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 14,
                      color: notifier.text,
                      // color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                child,
                containertext == null
                    ? Container()
                    : Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border.all(
                            color: textColor ?? Colors.green,
                          ),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                image ?? "assets/images/trend-up.png",
                                color: textColor,
                              ),
                              Text(
                                containertext,
                                style: TextStyle(
                                  color: textColor,
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
