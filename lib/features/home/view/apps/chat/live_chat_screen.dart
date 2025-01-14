
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  late ColorNotifier notifier;

  final List<Map<String, dynamic>> messages = [
    {
      'image': 'assets/images/avatar-7 1.png',
      'text':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pharetra ligula non varius curabitur etiam malesuada.',
      'time': '09:15 AM',
      'isSentByMe': false,
      'isImage': false,
    },
    {
      'image': 'assets/images/avatar-7 1.png',
      'text': 'Lorem ipsum dolor sit amet. 🥳',
      'time': '09:19 AM',
      'isSentByMe': false,
      'isImage': false,
    },
    {
      'image': 'assets/images/avatar-7 1.png',
      'text': 'Lorem ipsum dolor sit amet. 🥳',
      'time': '09:19 AM',
      'isSentByMe': false,
      'isImage': false,
    },
    {
      'image': 'assets/images/avatar-1-51c6502a 1.png',
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
        'image': 'assets/images/avatar-1-51c6502a 1.png',
        'text': textEditingController.text,
        'time': '09:20 AM',
        'isSentByMe': true,
        'isImage': false,
      });
      textEditingController.clear();
    }
  }

  List status = ["Mute Chat", "Delete", "Block"];

  List popupicons = [
    Icons.sentiment_satisfied_alt_outlined,
    Icons.link,
    Icons.mic_none,
    Icons.image_outlined,
  ];

  List popuptext = ["emoji", "Link", "Mute", "Gallery"];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.getBgColor,
      body: SafeArea(
        child: Padding(
          padding: width < 900
              ? EdgeInsets.only(left: 10, right: 10, top: 8)
              : EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: width < 900 ? 50 : 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    width < 900
                        ? IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: notifier.text,
                            ),
                          )
                        : Container(),
                    Stack(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            "assets/images/avatar-1-51c6502a 1.png",
                          ),
                        ),
                        Positioned(
                          right: width < 900 ? 1 : 3,
                          bottom: width < 900 ? 1 : 3,
                          child: Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: notifier.getBgColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Marcia Baker",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: notifier.text,
                          ),
                        ),
                        Text(
                          "Active Now",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      "assets/images/phone.png",
                      height: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 15),
                    Image.asset(
                      "assets/images/video.png",
                      height: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 15),
                    Popupbutton(
                      items: status,
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: notifier.getfillborder),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final message = messages[messages.length - 1 - index];
                    return SizedBox(
                      width: width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: message['isSentByMe']
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          message['isSentByMe']
                              ? Container()
                              : ClipOval(
                                  child: Image.asset(
                                    message["image"],
                                    height: 30,
                                  ),
                                ),
                          message['isSentByMe']
                              ? Container()
                              : SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: message['isSentByMe']
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: width < 900
                                      ? width / 1.7
                                      : width < 1250
                                          ? width / 2.5
                                          : width / 4,
                                ),
                                decoration: BoxDecoration(
                                  color: message['isSentByMe']
                                      ? Color(0xFF0f79f3)
                                      : notifier.lightbgcolor,
                                  borderRadius: message['isSentByMe']
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        )
                                      : BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  message['text'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 100,
                                  style: TextStyle(
                                    color: message['isSentByMe']
                                        ? Colors.white
                                        : Color(0xFFa5a5b3),
                                    fontFamily: "Outfit",
                                    // fontSize: height / 55,
                                  ),
                                ),
                              ),
                              Text(
                                message['time'],
                                style: TextStyle(
                                  color: Color(0xFFa5a5b3),
                                  fontFamily: "Outfit",
                                  // fontSize: height / 55,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                          message['isSentByMe']
                              ? SizedBox(width: 10)
                              : Container(),
                          message['isSentByMe']
                              ? ClipOval(
                                  child: Image.asset(
                                    message["image"],
                                    height: 30,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: width < 750 ? height / 12 : null,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: notifier.lightbgcolor,
                ),
                child: Row(
                  children: [
                    width < 950
                        ? Row(
                            children: [
                              Container(
                                width: 47,
                                height: 47,
                                decoration: BoxDecoration(
                                  color: notifier.getBgColor,
                                  borderRadius: width < 750
                                      ? BorderRadius.circular(30)
                                      : BorderRadius.circular(5),
                                ),
                                child: PopupMenuButton(
                                  tooltip: '',
                                  color: notifier.getBgColor,
                                  offset: const Offset(0, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.zero,
                                  elevation: 1,
                                  splashRadius: 1,
                                  shadowColor: Colors.grey,
                                  child: SizedBox(
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Colors.grey,
                                      size: 14,
                                    ),
                                  ),
                                  itemBuilder: (context) => [
                                    for (var i = 0; i < popupicons.length; i++)
                                      PopupMenuItem(
                                        value: i,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              popupicons[i],
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              " ${popuptext[i]}",
                                              style: TextStyle(
                                                fontFamily: "Outfit",
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                            ],
                          )
                        // ? Container()
                        : Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.sentiment_satisfied_alt_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.link, color: Colors.grey),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child:
                                      Icon(Icons.mic_none, color: Colors.grey),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.image_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: notifier.text),
                        controller: textEditingController,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (value) {
                          width < 600
                              ? null
                              : setState(() {
                                  sendMessage();
                                });
                        },
                        cursorColor: notifier.text,
                        decoration: InputDecoration(
                          hintText: 'Type something...',
                          hintStyle: TextStyle(
                            fontFamily: "Outfit",
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: notifier.getBgColor,
                          hoverColor: notifier.getBgColor,
                          border: OutlineInputBorder(
                            borderRadius: width < 750
                                ? BorderRadius.circular(30)
                                : BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: notifier.getfillborder,
                            ),
                            borderRadius: width < 750
                                ? BorderRadius.circular(30)
                                : BorderRadius.circular(5),
                          ),
                          focusedBorder: width < 750
                              ? OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0f79f3),
                                  ),
                                  borderRadius: width < 750
                                      ? BorderRadius.circular(30)
                                      : BorderRadius.circular(5),
                                )
                              : UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0f79f3),
                                  ),
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
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Color(0xFF0f79f3),
                          borderRadius: width < 750
                              ? BorderRadius.circular(30)
                              : BorderRadius.circular(5),
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
        ),
      ),
    );
  }
}
