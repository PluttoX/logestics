
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget chatProjectsUser(context) {
  final List<Map<String, dynamic>> messages = [
    {
      'text':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra ligula non varius curabitur etiam malesuada.',
      'time': '09:15 AM',
      'isSentByMe': false,
      'isImage': false,
    },
    {
      'text': 'Lorem ipsum dolor sit amet. 🥳',
      'time': '09:21 AM',
      'isSentByMe': false,
      'isImage': false,
    },
    {
      'text': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'time': '09:20 AM',
      'isSentByMe': true,
      'isImage': false,
    },
  ];

  final TextEditingController textEditingController = TextEditingController();

  void sendMessage() {
    if (textEditingController.text.isNotEmpty) {
      messages.add({
        'text': textEditingController.text,
        'time': '09:20 AM',
        'isSentByMe': true,
        'isImage': false,
      });
      textEditingController.clear();
    }
  }

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chat Projects User",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: notifier.text,
                      ),
                    ),
                    Text(
                      "2024-11-10 09:15 AM",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Popupbutton(
                  title: "Russell Colon",
                  items: const [
                    "Mark Stjohn",
                    "Juana Thatcher",
                    "Raymond Nguyen",
                    "Frank Mele",
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final message = messages[messages.length - 1 - index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: message['isSentByMe']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: message['isSentByMe']
                              ? Color(0xFF0f79f3)
                              : notifier.lightbgcolor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['text'],
                              style: TextStyle(
                                color: message['isSentByMe']
                                    ? Colors.white
                                    : notifier.text,
                                fontFamily: "Outfit",
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              message['time'],
                              style: TextStyle(
                                color: message['isSentByMe']
                                    ? Colors.white54
                                    : notifier.text,
                                fontFamily: "Outfit",
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: notifier.text,
                      style: TextStyle(color: notifier.text),
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: TextStyle(color: notifier.text),
                        filled: true,
                        fillColor: notifier.textFileColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: notifier.getfillborder),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff0f79f3),
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sendMessage();
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF0f79f3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        ),
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
