
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/apps/file_manager/personal_screen.dart';
import 'package:logestics/features/home/view/apps/file_manager/projects_screen.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';
import 'assets_screen.dart';
import 'documents_screen.dart';
import 'file_manager_drawer.dart';
import 'file_manager_table_screen.dart';
import 'my_drive.dart';

class FileManagerView extends StatefulWidget {
  const FileManagerView({super.key});

  @override
  State<FileManagerView> createState() => _FileManagerViewState();
}

class _FileManagerViewState extends State<FileManagerView> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    if (width < 950) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "File Manager",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => mainDrawerController.updateSelectedIndex(0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/home.png",
                              height: 15,
                              color: Color(0xFF0f7bf4),
                            ),
                            Text(
                              " Dashboard",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "Apps",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "File Manager",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: notifier.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: height - 50,
              child: FileManagerDrawer(),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "File Manager",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: notifier.text,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () => mainDrawerController.updateSelectedIndex(0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/home.png",
                            height: 15,
                            color: Color(0xFF0f7bf4),
                          ),
                          Text(
                            " Dashboard",
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "Apps",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      "File Manager",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: notifier.text,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height / 50),
            SizedBox(
              height: width < 1300 ? 950 : 990,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 700,
                      child: FileManagerDrawer(),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: width / 1.7,
                    child: mainDrawerController.selectControllers == 13
                        ? MyDriveScreenView()
                        : mainDrawerController.selectControllers == 14
                            ? AssetsScreen()
                            : mainDrawerController.selectControllers == 15
                                ? ProjectsScreen()
                                : mainDrawerController.selectControllers == 16
                                    ? PersonalScreen()
                                    : mainDrawerController.selectControllers ==
                                            17
                                        ? FileManagerTable(
                                            title: "Application",
                                            icon: Icons.folder_outlined,
                                            showcheckboxes: true,
                                          )
                                        : mainDrawerController
                                                    .selectControllers ==
                                                18
                                            ? DocumentsScreen()
                                            : FileManagerTable(
                                                title: "Media",
                                                icon: Icons.image_outlined,
                                                showcheckboxes: false,
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
}
