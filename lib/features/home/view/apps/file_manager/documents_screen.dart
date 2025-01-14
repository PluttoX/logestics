
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  late ColorNotifier notifier;

  List filesImages = [
    "assets/images/png.png",
    "assets/images/jpg.png",
    "assets/images/txt.png",
    "assets/images/pdf.png",
    "assets/images/xl4.png",
    "assets/images/doc.png",
    "assets/images/png.png",
    "assets/images/jpg.png",
    "assets/images/txt.png",
    "assets/images/pdf.png",
    "assets/images/xl4.png",
    "assets/images/doc.png",
  ];

  List filesNames = [
    "sketch-design.zip",
    "compile.png",
    "integrations.pdf",
    "contact@32.txt",
    "app-Design.doc",
    "image02.png",
    "ubold-sketch.doc",
    "annualreport.txt",
    "wireframes.xl4",
    "sketch-design.zip",
    "unity.png",
    "hello32.txt",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.mainBgColor,
      appBar: width < 950
          ? AppBar(
              backgroundColor: notifier.mainBgColor,
              centerTitle: true,
              title: Text(
                "Documents",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
            )
          : null,
      body: GridView.builder(
        itemCount: filesImages.length,
        padding: width < 950 ? EdgeInsets.all(10) : EdgeInsets.zero,
        shrinkWrap: true,
        physics: width < 950 ? ScrollPhysics() : NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width < 950
              ? 1
              : width < 1300
                  ? 2
                  : 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          mainAxisExtent: 170,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 170,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: notifier.getBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            filesImages[index],
                            height: 70,
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: const [
                              Popupbutton(
                                items: [
                                  "Rename",
                                  "Download",
                                  "Remove",
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
                    Container(
                      decoration: BoxDecoration(),
                      width: constraints.maxWidth / 1.5,
                      child: Text(
                        filesNames[index],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: notifier.text,
                        ),
                      ),
                    ),
                    index == 7
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "522 Files",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "5.5 GB",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        : Container(height: 0),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
