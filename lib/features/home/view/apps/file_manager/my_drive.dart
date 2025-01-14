
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/apps_controllers/file_manager_controllers.dart/my_drive_controllers.dart';
import '../../../theme/theme.dart';
import '../../../widget/my_dropdown_field.dart';
import '../../../widget/my_text_field.dart';
import '../../../widget/mycontainers.dart';
import '../../../widget/popupbutton.dart';

class MyDriveScreenView extends StatefulWidget {
  const MyDriveScreenView({super.key});

  @override
  State<MyDriveScreenView> createState() => _MyDriveScreenViewState();
}

class _MyDriveScreenViewState extends State<MyDriveScreenView> {
  MyDriveControllers myDriveControllers = Get.put(MyDriveControllers());

  late ColorNotifier notifier;

  late List<bool> isHover;

  bool isActive = false;

  List folderNames = [
    "Assets",
    "Projects",
    "Personal",
    "Applications",
    "Documents",
    "Media",
  ];

  List folderInFiles = [
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
  ];

  @override
  void initState() {
    super.initState();
    isHover = List.filled(6, false);
  }

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
                "My Driver",
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
      body: SafeArea(
        child: Padding(
          padding: width < 950 ? EdgeInsets.all(10) : EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  itemCount: folderNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.folder_outlined,
                                      color: Color(0xFFffb264),
                                      size: 80,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                fontWeight: FontWeight.w600,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                SizedBox(height: 20),
                SizedBox(
                  height: 600,
                  width: width,
                  child: recentFiles(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget recentFiles() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Files",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: notifier.text,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        createNewFolder(context);
                      },
                      child: Text(
                        "+ Create New Folder",
                        style: TextStyle(
                          color: Color(0xFF0f7bf4),
                          fontFamily: "Outfit",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: width < 1500
                          ? null
                          : width < 1700
                              ? constraints.maxWidth
                              : width < 1860
                                  ? null
                                  : constraints.maxWidth,
                      child: Table(
                        border: TableBorder(
                          horizontalInside:
                              BorderSide(color: notifier.getfillborder),
                        ),
                        columnWidths: {
                          0: FixedColumnWidth(
                            width < 950
                                ? 50
                                : width < 1700
                                    ? 60
                                    : 100,
                          ),
                          1: FixedColumnWidth(
                            width < 950
                                ? 220
                                : width < 1700
                                    ? 220
                                    : 250,
                          ),
                          2: FixedColumnWidth(
                            width < 950
                                ? 150
                                : width < 1700
                                    ? 150
                                    : 200,
                          ),
                          3: FixedColumnWidth(
                            width < 950
                                ? 130
                                : width < 1700
                                    ? 120
                                    : 150,
                          ),
                          4: FixedColumnWidth(
                            width < 950
                                ? 120
                                : width < 1700
                                    ? 110
                                    : 140,
                          ),
                          5: FixedColumnWidth(
                            width < 950
                                ? 110
                                : width < 1700
                                    ? 110
                                    : 140,
                          ),
                          6: FixedColumnWidth(120),
                        },
                        children: [
                          TableRow(
                            decoration:
                                BoxDecoration(color: notifier.tablehader),
                            children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Transform.scale(
                                    scale: 1,
                                    child: Checkbox(
                                      overlayColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors.transparent,
                                      ),
                                      activeColor: const Color(0xff0f79f3),
                                      side: BorderSide(
                                        width: 2,
                                        color: notifier.chakboxborder,
                                      ),
                                      value: isActive,
                                      onChanged: (val) {
                                        setState(() {
                                          isActive = val!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Name",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Owner",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Listed Date",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "File Size",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "File Items",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Action",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          for (var a = myDriveControllers.loadmore;
                              a <
                                  myDriveControllers.loadmore +
                                      myDriveControllers.selectindex;
                              a++)
                            TableRow(
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: StatefulBuilder(
                                      builder:
                                          (BuildContext context, setState) {
                                        return Transform.scale(
                                          scale: 1,
                                          child: Checkbox(
                                            overlayColor: MaterialStateProperty
                                                .all<Color>(
                                              Colors.transparent,
                                            ),
                                            activeColor:
                                                const Color(0xff0f79f3),
                                            side: BorderSide(
                                              width: 2,
                                              color: notifier.chakboxborder,
                                            ),
                                            value: isActive,
                                            onChanged: (val) {
                                              setState(() {
                                                isActive = val!;
                                              });
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/folder_icon.png",
                                          color: Color(0xFFffb264),
                                          height: 15,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "  ${myDriveControllers.name[a]}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: notifier.text,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      myDriveControllers.owner[a],
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      myDriveControllers.listedDate[a],
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      myDriveControllers.fileSize[a],
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      myDriveControllers.fileItems[a],
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/file-download.png",
                                          height: 20,
                                          color: Color(0xFF297df3),
                                        ),
                                        SizedBox(width: 10),
                                        Image.asset(
                                          "assets/images/pen.png",
                                          height: 16,
                                          color: notifier.text,
                                        ),
                                        SizedBox(width: 10),
                                        Image.asset(
                                          "assets/images/trash.png",
                                          height: 16,
                                          color: notifier.text,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
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

createNewFolder(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  var selectOwner = "Linda Maddox";

  notifier = Provider.of(context, listen: false);

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      if (width < 900) {
        return AlertDialog(
          backgroundColor: notifier.getBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CreateNewFolde",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: notifier.text,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: notifier.text),
              ),
            ],
          ),
          contentPadding: EdgeInsets.all(20),
          content: SizedBox(
            height: 300,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFormField(
                  titleText: "Folder Name",
                  hintText: "E.g. Hand Watch",
                  labelText: "Folder Name",
                ),
                MyTextFormField(
                  titleText: "File items",
                  hintText: "E.g. 100",
                  labelText: "File items",
                ),
                MyDropdownFormField(
                  titletext: "Owner",
                  hinttext: "Owner",
                  items: const [
                    "Linda Maddox",
                    "Juanita Lavigne",
                    "Roy Pope",
                    "Cecil Jones",
                    "Trudy Venegas",
                  ],
                  onChanged: (value) {
                    selectOwner = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Color(0xFFe74c3c),
                    minimumSize: Size(100, 50),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "outfit",
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Color(0xFF0f79f3),
                    minimumSize: Size(100, 50),
                  ),
                  child: Text(
                    "Create",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "outfit",
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return AlertDialog(
          backgroundColor: notifier.getBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CreateNewFolde",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: notifier.text,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: notifier.text),
              ),
            ],
          ),
          contentPadding: EdgeInsets.all(20),
          content: SizedBox(
            height: 200,
            width: width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFormField(
                  titleText: "Folder Name",
                  hintText: "E.g. Hand Watch",
                  labelText: "Folder Name",
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyTextFormField(
                        titleText: "File items",
                        hintText: "E.g. 100",
                        labelText: "File items",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: MyDropdownFormField(
                        titletext: "Owner",
                        hinttext: "Owner",
                        items: const [
                          "Linda Maddox",
                          "Juanita Lavigne",
                          "Roy Pope",
                          "Cecil Jones",
                          "Trudy Venegas",
                        ],
                        onChanged: (value) {
                          selectOwner = value;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Color(0xFFe74c3c),
                minimumSize: Size(100, 50),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "outfit",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Color(0xFF0f79f3),
                minimumSize: Size(100, 50),
              ),
              child: Text(
                "Create",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "outfit",
                ),
              ),
            ),
          ],
        );
      }
    },
  );
}
