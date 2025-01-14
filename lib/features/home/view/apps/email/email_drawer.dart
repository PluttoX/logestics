
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';
import '../../../widget/Searchfield.dart';
import 'email_list.dart';
import 'new_message.dart';

class EmailDrawer extends StatefulWidget {
  const EmailDrawer({super.key});

  @override
  State<EmailDrawer> createState() => _EmailDrawerState();
}

class _EmailDrawerState extends State<EmailDrawer> {
  MainDrawerController mainDrawerController = MainDrawerController();

  late ColorNotifier notifier;

  List icon = [
    "assets/images/inbox.png",
    "assets/images/star.png",
    "assets/images/alarm-check.png",
    "assets/images/send-right.png",
    "assets/images/envelope-open.png",
    "assets/images/spam.png",
    "assets/images/trash.png",
    "assets/images/important.png",
    "assets/images/envelope.png",
    "assets/images/user.png",
    "assets/images/bag.png",
    "assets/images/dollar.png",
    "assets/images/users.png",
  ];

  List text = [
    "Inbox",
    "Starred",
    "Snoozed",
    "Sent",
    "Drafts",
    "Spam",
    "Trash",
    "Important",
    "All Mail",
    "Personal",
    "Company",
    "Wallet Balance",
    "Friends",
  ];

  late List<bool> isHover;

  @override
  void initState() {
    super.initState();
    isHover = List.filled(13, false);
  }

  @override
  Widget build(BuildContext context) {
    MainDrawerController mainDrawerController = Get.put(MainDrawerController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              width < 900 ? Container() : Searchfield(),
              width < 900 ? Container() : SizedBox(height: 20),
              InkWell(
                onTap: () {
                  if (width < 900) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateMessageView(),
                      ),
                    );
                  } else {
                    mainDrawerController.updateSelectedIndex(11);
                  }
                },
                child: Container(
                  height: 50,
                  width: width,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF0f79f3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Compose Email",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Outfit",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                itemCount: text.length,
                shrinkWrap: true,
                physics: width < 900
                    ? NeverScrollableScrollPhysics()
                    : ScrollPhysics(),
                itemBuilder: (context, index) {
                  int emaildrawerindex = index + 10;
                  return InkWell(
                    onHover: (value) {
                      setState(() {
                        isHover[index] = value;
                      });
                    },
                    onTap: () {
                      if (width < 900) {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailListView(),
                            ),
                          );
                        }
                      } else {
                        if (index == 0) {
                          mainDrawerController.updateSelectedIndex(10);
                        }
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          icon[index],
                          height: height / 50,
                          color: mainDrawerController.selectControllers ==
                                  emaildrawerindex
                              ? Color(0xFF0f79f3)
                              : isHover[index]
                                  ? Color(0xFF0f79f3)
                                  : notifier.text,
                        ),
                        SizedBox(width: 5),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth / 2,
                          ),
                          child: Text(
                            text[index],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 16,
                              color: mainDrawerController.selectControllers ==
                                      emaildrawerindex
                                  ? Color(0xFF0f79f3)
                                  : isHover[index]
                                      ? Color(0xFF0f79f3)
                                      : notifier.text,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          index == 0
                              ? "10"
                              : index == 5
                                  ? "15"
                                  : index == 6
                                      ? "7"
                                      : "",
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: height / 50);
                },
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Text(
                  "+ Create New Label",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Outfit",
                    color: Color(0xFF0f79f3),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
