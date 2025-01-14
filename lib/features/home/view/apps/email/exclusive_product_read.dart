
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';
import '../../../widget/stringfile.dart';

class ExclusiveProductRead extends StatefulWidget {
  const ExclusiveProductRead({super.key});

  @override
  State<ExclusiveProductRead> createState() => _ExclusiveProductReadState();
}

class _ExclusiveProductReadState extends State<ExclusiveProductRead> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.mainBgColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(width < 900 ? 0 : 10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: width < 900 ? 60 : null,
                  child: width < 900
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: notifier.text,
                                  ),
                                ),
                                SizedBox(width: 15),
                                SizedBox(
                                  width: width / 1.5,
                                  child: Text(
                                    "Exclusive Product Offer on Facebook - Limited Time Only!",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/rotate-right.png",
                                    color: Colors.grey,
                                    height: 15,
                                  ),
                                  SizedBox(width: 13),
                                  Image.asset(
                                    "assets/images/computer-printer.png",
                                    color: Colors.grey,
                                    height: 15,
                                  ),
                                  SizedBox(width: 13),
                                  Image.asset(
                                    "assets/images/spam.png",
                                    color: Colors.grey,
                                    height: 15,
                                  ),
                                  SizedBox(width: 13),
                                  Image.asset(
                                    "assets/images/trash.png",
                                    color: Colors.grey,
                                    height: 15,
                                  ),
                                  SizedBox(width: 13),
                                  Popupbutton(
                                    items: const [
                                      "Recent",
                                      "Unread",
                                      "Mark All Read",
                                      "Spam",
                                      "Delete All",
                                    ],
                                    child: Icon(
                                      Icons.more_horiz,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width / 2.7,
                              child: Text(
                                "Exclusive Product Offer on Facebook - Limited Time Only!",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: notifier.text,
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: width < 900
                                  ? EdgeInsets.all(0)
                                  : EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/rotate-right.png",
                                    color: Colors.grey,
                                    height: 15,
                                  ),
                                  SizedBox(width: 13),
                                  Image.asset(
                                    "assets/images/computer-printer.png",
                                    color: Colors.grey,
                                    height: 15,
                                  ),
                                  SizedBox(width: 13),
                                  Image.asset(
                                    "assets/images/spam.png",
                                    color: Colors.grey,
                                    height: 15,
                                  ),
                                  SizedBox(width: 13),
                                  Image.asset(
                                    "assets/images/trash.png",
                                    color: Colors.grey,
                                    height: 15,
                                  ),
                                  SizedBox(width: 13),
                                  Popupbutton(
                                    items: const [
                                      "Recent",
                                      "Unread",
                                      "Mark All Read",
                                      "Spam",
                                      "Delete All",
                                    ],
                                    child: Icon(
                                      Icons.more_horiz,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
                width < 900
                    ? Divider(color: notifier.getfillborder)
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(color: notifier.getfillborder),
                      ),
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/avatar-1-51c6502a 1.png",
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AllString.user4,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                          ),
                          SizedBox(
                            width: width < 650 ? width / 2 : null,
                            child: Text(
                              "From: ${AllString.user4}@gmail.com",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "20 Nov, 2024",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: width < 900
                      ? EdgeInsets.only(left: 0)
                      : EdgeInsets.only(left: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello ${AllString.user4}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Limited-Time Offer: ${AllString.user4} at a Special Price!",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Here's what you get:",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "1. Mperdiet sit hendrerit tincidunt bibendum donec adipiscing.",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "2. Tellus non morbi nascetur cursus etiam facilisis mi. Dolor aliquam sed amet aliquam venenatis.",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "3. Molestie tincidunt ut consequat a urna tortor. Vitae velit ac nisl velit mauris placerat nisi placerat.",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "How to Redeem",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Thank you for being a part of our community!",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Best regards,",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Robert Fairweather",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          height: 1.5,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(color: notifier.getfillborder),
                ),
                Container(
                  margin: width < 900
                      ? EdgeInsets.only(left: 0)
                      : EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFF0f79f3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Reply",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: notifier.getfillborder),
                          ),
                          child: Center(
                            child: Text(
                              "Forward",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: notifier.text,
                                fontFamily: "Outfit",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
