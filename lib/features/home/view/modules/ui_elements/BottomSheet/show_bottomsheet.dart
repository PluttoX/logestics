
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../widget/mycontainers.dart';



Future<dynamic> bottomsheetshow(BuildContext context) {

  notifier = Provider.of(context,listen: false);

  List titleText = [
    "Google Keep",
    "Google Docs",
    "Google Plus",
    "Google Hangouts",
  ];

  List subTitletext = [
    "Add to a note",
    "Embed in a document",
    "Share with your friends",
    "Show to your coworkers",
  ];

  return showModalBottomSheet(
    backgroundColor: notifier.getBgColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: titleText.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titleText[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 16,
                        color: notifier.text,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      subTitletext[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
