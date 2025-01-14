
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/stringfile.dart';
import '../live_chat_screen.dart';

class AllMessages extends StatefulWidget {
  const AllMessages({super.key});

  @override
  State<AllMessages> createState() => _AllMessagesState();
}

class _AllMessagesState extends State<AllMessages> {
  late ColorNotifier notifier;

  List profileImage = [
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
  ];

  List name = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
  ];

  List subtext = [
    "Typing...",
    "Hello Mateo...",
    "Great ! 🔥",
    "That cool, go for it...😀",
    "Hello!",
    "How are you Luca? Would...😐",
    "🎙 Voice message...",
    "Cool! 🔥",
    "What are you doing... 🙁",
    "Could you please...",
  ];

  List trailingtext = [
    "Just Now",
    "Sun 9:10 PM",
    "Mon 2:12 PM",
    "Tue 8:50 AM",
    "Wed 9:20 PAM",
    "wed 11:50 PM",
    "Thu 6:10 PM",
    "Fri 3:09 PM",
    "Sun 9:51 PM",
    "Mon 7:23 AM",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: profileImage.length,
      shrinkWrap: true,
      physics: width < 900 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListTile(
            onTap: () {
              if (width < 950) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiveChatScreen(),
                  ),
                );
              }
            },
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(child: Image.asset(profileImage[index])),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Colors.green
                          : index % 2 == 0
                              ? Colors.red
                              : Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: notifier.getBgColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: Text(
              name[index],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 18,
                color: notifier.text,
              ),
            ),
            subtitle: Text(
              subtext[index],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15,
                color: index == 0 ? Colors.green : Colors.grey,
              ),
            ),
            trailing: Text(
              trailingtext[index],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: notifier.getfillborder);
      },
    );
  }
}
