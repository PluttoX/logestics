
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  late List<bool> isHover;

  late ColorNotifier notifier;

  @override
  void initState() {
    super.initState();
    isHover = List.filled(12, false);
  }

  List folderNames = [
    "Projects",
    "Documents",
    "Media",
    "Applications",
    "HB Template",
    "React Template",
    "Matrial UI",
    "WP Themes",
    "Personal Photos",
    "Mobile Apps",
    "Important Files",
    "Angular Template",
  ];

  List folderInFiles = [
    "159 Files",
    "522 Files",
    "995 Files",
    "39 Files",
    "75 Files",
    "357 Files",
    "159 Files",
    "522 Files",
    "995 Files",
    "39 Files",
    "75 Files",
    "357 Files",
  ];

  List folderSizes = [
    "4.5 GB",
    "5.5 GB",
    "7.5 GB",
    "3.8 GB",
    "2.2 GB",
    "8.5 GB",
    "4.5 GB",
    "5.5 GB",
    "7.5 GB",
    "3.8 GB",
    "2.2 GB",
    "8.5 GB",
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
                "Assets",
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
        itemCount: folderNames.length,
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
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: notifier.getBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.folder_outlined,
                            color: Color(0xFFffb264),
                            size: 80,
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onHover: (value) {
                                  setState(() {
                                    isHover[index] = value;
                                  });
                                },
                                onTap: () {},
                                child: SizedBox(
                                  width: constraints.maxWidth / 2.2,
                                  child: Text(
                                    folderNames[index],
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isHover[index]
                                          ? Color(0xFF0f79f3)
                                          : notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          folderInFiles[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          folderSizes[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
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
