
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';
import '../../../widget/multipleselect_dropdawon_field.dart';
import '../../../widget/my_text_field.dart';
import '../../../widget/popupbutton.dart';

class CreateMessageView extends StatefulWidget {
  const CreateMessageView({super.key});

  @override
  State<CreateMessageView> createState() => _CreateMessageViewState();
}

class _CreateMessageViewState extends State<CreateMessageView> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  final QuillEditorController quillEditorController = QuillEditorController();

  late ColorNotifier notifier;

  var toSelectEmail = "hello@james.com";
  var ccSelectEmail = "hello@james.com";
  var bccSelectEmail = "hello@james.com";

  List to = [
    "hello@james.com",
    "hello@andy.com",
    "hello@mateo.com",
    "hello@luca.com",
    "hello@sausage.com",
    "hello@tomato.com",
  ];

  List cc = [
    "hello@james.com",
    "hello@andy.com",
    "hello@mateo.com",
    "hello@luca.com",
    "hello@sausage.com",
    "hello@tomato.com",
  ];

  List bcc = [
    "hello@james.com",
    "hello@andy.com",
    "hello@mateo.com",
    "hello@luca.com",
    "hello@sausage.com",
    "hello@tomato.com",
  ];

  late List toChake;
  late List ccChake;
  late List bccChake;

  @override
  void initState() {
    toChake = List.filled(to.length, false);
    ccChake = List.filled(cc.length, false);
    bccChake = List.filled(bcc.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.mainBgColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            // color: width < 900 ? const Color(0xFFeff3f9) : Colors.white,
            borderRadius: BorderRadius.circular(width < 900 ? 0 : 10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.transparent,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      width < 900 ? SizedBox(width: 10) : Container(),
                      Text(
                        "New Message",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            width < 900 ? EdgeInsets.all(0) : EdgeInsets.all(0),
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
                width < 900 ? SizedBox(height: 10) : Container(),
                width < 900
                    ? Column(
                        children: [
                          MultipleselectDropdawonField(
                            title: "To",
                            tags: to,
                            checkbox: toChake,
                            hintText: "To",
                          ),
                          SizedBox(height: 15),
                          MultipleselectDropdawonField(
                            title: "Cc",
                            hintText: "Cc",
                            tags: cc,
                            checkbox: ccChake,
                          ),
                          SizedBox(height: 15),
                          MultipleselectDropdawonField(
                            title: "Bcc",
                            hintText: "Bcc",
                            tags: bcc,
                            checkbox: bccChake,
                          ),
                          SizedBox(height: 15),
                          MyTextFormField(
                            titleText: "Subject",
                            hintText: "E.g. Hand Watch",
                            labelText: "Write your Subject",
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                MultipleselectDropdawonField(
                                  title: "To",
                                  hintText: "To",
                                  tags: to,
                                  checkbox: toChake,
                                ),
                                SizedBox(height: 20),
                                MultipleselectDropdawonField(
                                  title: "Bcc",
                                  hintText: "Bcc",
                                  tags: bcc,
                                  checkbox: bccChake,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              children: [
                                MultipleselectDropdawonField(
                                  title: "Cc",
                                  hintText: "Cc",
                                  tags: cc,
                                  checkbox: ccChake,
                                ),
                                SizedBox(height: 20),
                                MyTextFormField(
                                  titleText: "Subject",
                                  hintText: "E.g. Hand Watch",
                                  labelText: "Write your Subject",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 20),
                Text(
                  "Your Email",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    color: notifier.text,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: notifier.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: notifier.getfillborder),
                  ),
                  child: Column(
                    children: [
                      ToolBar(
                        activeIconColor: Color(0xFF0f79f3),
                        iconColor: notifier.text,
                        padding: const EdgeInsets.all(8),
                        toolBarColor: notifier.getBgColor,
                        iconSize: 15,
                        controller: quillEditorController,
                      ),
                      QuillHtmlEditor(
                        controller: quillEditorController,
                        textStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Outfit",
                        ),
                        backgroundColor: notifier.getBgColor,
                        hintText: 'Type here...',
                        hintTextStyle: TextStyle(
                          fontFamily: "Outfit",
                          color: Colors.grey,
                        ),
                        isEnabled: true,
                        minHeight: height / 4,
                        hintTextAlign: TextAlign.start,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        hintTextPadding: EdgeInsets.zero,
                        loadingBuilder: (context) {
                          return const Center();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
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
                            "Send",
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
                    SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/smiley.png",
                        height: 20,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/paperclip.png",
                        height: 20,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/image.png",
                        height: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
