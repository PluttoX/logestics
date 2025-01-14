
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';
import 'email_drawer.dart';
import 'email_list.dart';

class InboxScreenView extends StatefulWidget {
  const InboxScreenView({super.key});

  @override
  State<InboxScreenView> createState() => _InboxScreenViewState();
}

class _InboxScreenViewState extends State<InboxScreenView> {
  late ColorNotifier notifier;

  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    if (width < 900) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inbox",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => mainDrawerController.updateSelectedIndex(0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/home.png",
                              height: 15,
                              color: Color(0xFF0f7bf4),
                            ),
                            Text(
                              " Dashboard",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "Apps",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "Inbox",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: notifier.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 750,
              child: EmailDrawer(),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Inbox",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: notifier.text,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () => mainDrawerController.updateSelectedIndex(0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/home.png",
                            height: 15,
                            color: Color(0xFF0f7bf4),
                          ),
                          Text(
                            " Dashboard",
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "Apps",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "Inbox",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: notifier.text,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: width < 1600
                  ? 740
                  : width < 2000
                      ? 760
                      : 900,
              child: Row(
                children: [
                  Expanded(child: EmailDrawer()),
                  SizedBox(width: 20),
                  SizedBox(width: width / 1.7, child: EmailListView()),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
