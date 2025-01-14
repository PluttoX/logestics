
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../theme/theme.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late ColorNotifier notifier;

  List messages = [
    "assets/images/user1.jpg",
    "assets/images/user2.jpg",
    "assets/images/user3.jpg",
  ];

  List messagetext = [
    "Jacob Liwiski",
    "Angela Carter",
    "Brad Traversy",
  ];

  List messagetime = [
    "35 mins ago",
    "1 day ago",
    "2 day ago",
  ];

  List messagesubtext = [
    "Hey Victor! Could you please...",
    "How are you Angela? Would you please...",
    "Hey Brad Traversy! Could you please...",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        tooltip: '',
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
        shadowColor: Colors.grey,
        child: Image.asset(
          "assets/images/envelope.png",
          color: notifier.text,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            padding: const EdgeInsets.all(12),
            enabled: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Message ',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 20,
                          color: notifier.text,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: '(05)',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Mark all as read",
                      style: TextStyle(
                        color: Color(0xff0165fc),
                        // fontFamily: "Outfit",
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                StyledDivider(
                  lineStyle: DividerLineStyle.dashed,
                  color: notifier.getfillborder,
                ),
                ListView.separated(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              messages[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            messagetext[index],
                            style: TextStyle(
                              color: notifier.text,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            messagetime[index],
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      subtitle: Text(messagesubtext[index]),
                      subtitleTextStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      trailing: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: index == 0
                              ? const Color(0xFF0165FC)
                              : Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return StyledDivider(
                      lineStyle: DividerLineStyle.dashed,
                      color: notifier.getfillborder,
                    );
                  },
                ),
                StyledDivider(
                  lineStyle: DividerLineStyle.dashed,
                  color: notifier.getfillborder,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    "View All Messages",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF0165FC),
                      color: Color(0xFF0165FC),
                      fontFamily: "Outfit",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
