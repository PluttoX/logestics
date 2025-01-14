
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/apps/file_manager/personal_screen.dart';
import 'package:logestics/features/home/view/apps/file_manager/projects_screen.dart';
import 'package:provider/provider.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';
import '../../../widget/Searchfield.dart';
import 'assets_screen.dart';
import 'documents_screen.dart';
import 'file_manager_table_screen.dart';
import 'my_drive.dart';

class FileManagerDrawer extends StatefulWidget {
  const FileManagerDrawer({super.key});

  @override
  State<FileManagerDrawer> createState() => _FileManagerDrawerState();
}

class _FileManagerDrawerState extends State<FileManagerDrawer> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  late List<bool> isHover;

  late List<bool> isHover1;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    isHover = List.filled(7, false);
    isHover1 = List.filled(4, false);
  }

  List icon = [
    "assets/images/car.png",
    "assets/images/file-text.png",
    "assets/images/image.png",
    "assets/images/clock.png",
    "assets/images/star.png",
    "assets/images/spam.png",
    "assets/images/trash.png",
  ];

  List text = [
    "My Drive",
    "Documents",
    "Media",
    "Recents",
    "Imports",
    "Spam",
    "Trash",
  ];

  List myDrive = ["Assets", "Projects", "Personals", "Applications"];

  @override
  Widget build(BuildContext context) {
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
              Text(
                "My Driver",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 20),
              width < 950 ? Container() : Searchfield(),
              width < 950 ? Container() : SizedBox(height: 20),
              ListView.separated(
                itemCount: text.length,
                shrinkWrap: true,
                physics: width < 950
                    ? NeverScrollableScrollPhysics()
                    : ScrollPhysics(),
                itemBuilder: (context, index) {
                  int myDriverindex = index + 18;
                  return InkWell(
                    hoverColor: Color(0xFFe7effd),
                    borderRadius: BorderRadius.circular(8),
                    onHover: (value) {
                      setState(() {
                        isHover[index] = value;
                      });
                    },
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      if (width < 950) {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyDriveScreenView(),
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DocumentsScreen(),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FileManagerTable(
                                title: "Media",
                                icon: Icons.image_outlined,
                                showcheckboxes: false,
                              ),
                            ),
                          );
                        }
                      } else {
                        if (index == 0) {
                          mainDrawerController.updateSelectedIndex(13);
                        } else if (index == 1) {
                          mainDrawerController.updateSelectedIndex(18);
                        } else if (index == 2) {
                          mainDrawerController.updateSelectedIndex(19);
                        }
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          icon[index],
                          height: 15,
                          color: selectedIndex == index
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
                              fontSize: 15,
                              color: selectedIndex == index
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
                              ? "6"
                              : index == 5
                                  ? "10"
                                  : index == 6
                                      ? "15"
                                      : "",
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return ListView.builder(
                      itemCount: myDrive.length,
                      padding: EdgeInsets.only(bottom: 10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        int myDriverindex1 = index + 14;
                        return InkWell(
                          hoverColor: Color(0xFFe7effd),
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            height: 40,
                            child: InkWell(
                              onHover: (value) {
                                setState(() {
                                  isHover1[index] = value;
                                });
                              },
                              onTap: () {},
                              child: ListTile(
                                onTap: () {
                                  if (width < 950) {
                                    if (index == 0) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AssetsScreen(),
                                        ),
                                      );
                                    } else if (index == 1) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProjectsScreen(),
                                        ),
                                      );
                                    } else if (index == 2) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PersonalScreen(),
                                        ),
                                      );
                                    } else if (index == 3) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              FileManagerTable(
                                            title: "Application",
                                            icon: Icons.folder_outlined,
                                            showcheckboxes: true,
                                          ),
                                        ),
                                      );
                                    }
                                  } else {
                                    if (index == 0) {
                                      mainDrawerController
                                          .updateSelectedIndex(14);
                                    } else if (index == 1) {
                                      mainDrawerController
                                          .updateSelectedIndex(15);
                                    } else if (index == 2) {
                                      mainDrawerController
                                          .updateSelectedIndex(16);
                                    } else if (index == 3) {
                                      mainDrawerController
                                          .updateSelectedIndex(17);
                                    }
                                  }
                                },
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  width: 30,
                                  height: 10,
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                      color: mainDrawerController
                                                  .selectControllers ==
                                              myDriverindex1
                                          ? Color(0xFF0f79f3)
                                          : isHover1[index]
                                              ? Color(0xFF0f79f3)
                                              : notifier.text,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  myDrive[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: mainDrawerController
                                                .selectControllers ==
                                            myDriverindex1
                                        ? Color(0xFF0f79f3)
                                        : isHover1[index]
                                            ? Color(0xFF0f79f3)
                                            : notifier.text,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return SizedBox(height: 20);
                  }
                },
              ),
              Spacer(),
              SizedBox(height: 20),
              Text(
                "Storage Status",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ProgressBar(
                  value: 0.3,
                  width: constraints.maxWidth,
                  color: Color(0xFF0f79f3),
                  height: 10,
                  backgroundColor: notifier.lightbgcolor,
                ),
              ),
              Text(
                "% 32 GB used of 128 GB",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
