
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/apps_controllers/email_controllers/inbox_controllers.dart';
import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';
import 'exclusive_product_read.dart';

class EmailListView extends StatefulWidget {
  const EmailListView({super.key});

  @override
  State<EmailListView> createState() => _EmailListViewState();
}

class _EmailListViewState extends State<EmailListView> {
  late ColorNotifier notifier;

  InboxControllers inboxControllers = Get.put(InboxControllers());

  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

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
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    width < 900
                        ? InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: notifier.text,
                            ),
                          )
                        : Container(),
                    width < 900 ? SizedBox(width: 15) : Container(),
                    Text(
                      "Email List",
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
                            "Delete All"
                          ],
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: notifier.getfillborder),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Table(
                      border: TableBorder(
                        horizontalInside:
                            BorderSide(color: notifier.getfillborder),
                      ),
                      columnWidths: {
                        0: FixedColumnWidth(width < 1920 ? 100 : 120),
                        1: FixedColumnWidth(width < 1920 ? 200 : 230),
                        2: FixedColumnWidth(1000),
                        3: FixedColumnWidth(150),
                      },
                      children: [
                        for (var a = inboxControllers.loadmore;
                            a <
                                inboxControllers.loadmore +
                                    inboxControllers.selectindex;
                            a++)
                          TableRow(
                            children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: width < 900 ? 9 : 15,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      if (width < 900) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExclusiveProductRead(),
                                          ),
                                        );
                                      } else {
                                        mainDrawerController
                                            .updateSelectedIndex(11);
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        StatefulBuilder(
                                          builder:
                                              (BuildContext context, setState) {
                                            return Transform.scale(
                                              scale: 1,
                                              child: Checkbox(
                                                overlayColor:
                                                    WidgetStateProperty.all<
                                                        Color>(
                                                  Colors.transparent,
                                                ),
                                                activeColor:
                                                    const Color(0xff0f79f3),
                                                side: BorderSide(
                                                  color: notifier.chakboxborder,
                                                  width: 2,
                                                ),
                                                value:
                                                    inboxControllers.isActive,
                                                onChanged: (val) {
                                                  setState(() {
                                                    inboxControllers.isActive =
                                                        val!;
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                        Image.asset(
                                          "assets/images/star.png",
                                          color: notifier.text,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: width < 900 ? 9 : 15,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      if (width < 900) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExclusiveProductRead(),
                                          ),
                                        );
                                      } else {
                                        mainDrawerController
                                            .updateSelectedIndex(11);
                                      }
                                    },
                                    child: Text(
                                      inboxControllers.titles[a],
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: notifier.text,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: InkWell(
                                  onTap: () {
                                    if (width < 900) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ExclusiveProductRead(),
                                        ),
                                      );
                                    } else {
                                      mainDrawerController
                                          .updateSelectedIndex(11);
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: width < 900 ? 9 : 15,
                                    ),
                                    child: Text(
                                      inboxControllers.messageText[a],
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: InkWell(
                                  onTap: () {
                                    if (width < 900) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ExclusiveProductRead(),
                                        ),
                                      );
                                    } else {
                                      mainDrawerController
                                          .updateSelectedIndex(11);
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: width < 900 ? 9 : 15,
                                    ),
                                    child: Text(
                                      inboxControllers.date[a],
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              NextPageButton(
                number1: "10",
                number2: "20",
                number3: "30",
                numberofpages: "1 – 10 of 20",
                backbutton: () {
                  if (inboxControllers.button == true) {
                    setState(() {
                      inboxControllers.button = !inboxControllers.button;
                      inboxControllers.titles.shuffle();
                      inboxControllers.messageText.shuffle();
                      inboxControllers.date.shuffle();
                    });
                    inboxControllers.setloadmore(inboxControllers.selectpage);
                  }
                },
                nextbutton: () {
                  if (inboxControllers.button == false) {
                    setState(() {
                      inboxControllers.button = !inboxControllers.button;
                      inboxControllers.titles.shuffle();
                      inboxControllers.messageText.shuffle();
                      inboxControllers.date.shuffle();
                    });
                    inboxControllers.setloadmore(inboxControllers.selectpage);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
