import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../theme/theme.dart';

enum NotificationPopup {
  itemOne,
  itemTwo,
  itemThree,
  itemfour,
  itemfive,
  itemsix,
  itemsevan,
  itemeight
}

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late ColorNotifier notifier;

  NotificationPopup? selectedNotification;

  late List<bool> ishover;

  @override
  void initState() {
    ishover = List.filled(notifications.length, false);
    super.initState();
  }

  List notifications = [
    "assets/images/message-text.png",
    "assets/images/user.png",
    "assets/images/envelope.png",
  ];

  List notificationstext = [
    "You have requested to Withdrawal",
    "A new User added in unity",
    "You have requested to Withdrawal",
  ];

  List notificationssubtext = ["2 hrs ago", "3 hrs ago", "1 day ago"];

  List imageColor = [
    Color(0xFF2B79F3),
    Color(0xFF3BB2DE),
    Color(0xFF39B489),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PopupMenuButton(
            tooltip: '',
            // color: Colors.white,
            color: notifier.getBgColor,
            offset: const Offset(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 1,
            splashRadius: 1,
            constraints: BoxConstraints(
              maxWidth: 300,
              minWidth: 300,
            ),
            initialValue: selectedNotification,
            shadowColor: Colors.grey,
            child: Image.asset(
              "assets/images/bell.png",
              color: notifier.text,
            ),
            itemBuilder: (context) => <PopupMenuEntry<NotificationPopup>>[
              PopupMenuItem(
                padding: const EdgeInsets.all(12),
                value: NotificationPopup.itemTwo,
                enabled: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Notifications ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '(03)',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Clear All",
                          style: TextStyle(color: Color(0xff0165fc)),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    StyledDivider(
                      color: notifier.getfillborder,
                      lineStyle: DividerLineStyle.dashed,
                    ),
                    ListView.separated(
                      itemCount: notifications.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          // onTap: () {},
                          onHover: (value) {
                            setState(() {
                              ishover[index] = value;
                            });
                          },
                          child: ListTile(
                            hoverColor: Colors.transparent,
                            onTap: () {},
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: ishover[index] == true
                                    ? Color(0xff0165fc)
                                    : notifier.lightbgcolor,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                notifications[index],
                                color: imageColor[index],
                              ),
                            ),
                            titleTextStyle: TextStyle(
                              fontSize: 18,
                              fontFamily: "Outfit",
                              color: notifier.text,
                            ),
                            title: Text(notificationstext[index]),
                            subtitle: Text(notificationssubtext[index]),
                            subtitleTextStyle: const TextStyle(
                              fontFamily: "Outfit",
                              color: Colors.grey,
                            ),
                            trailing: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                color: index < 2
                                    ? const Color(0xFF0165FC)
                                    : Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return StyledDivider(
                          color: notifier.getfillborder,
                          lineStyle: DividerLineStyle.dashed,
                        );
                      },
                    ),
                    StyledDivider(
                      color: notifier.getfillborder,
                      lineStyle: DividerLineStyle.dashed,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        "See All Notifications",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF0165FC),
                          color: Color(0xFF0165FC),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
