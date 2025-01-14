
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/apps_controllers/file_manager_controllers.dart/applications_controllers.dart';
import '../../../theme/theme.dart';

// ApplicationsScreen

class FileManagerTable extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool showcheckboxes;

  const FileManagerTable({
    super.key,
    required this.title,
    required this.icon,
    required this.showcheckboxes,
  });

  @override
  State<FileManagerTable> createState() => _FileManagerTableState();
}

class _FileManagerTableState extends State<FileManagerTable> {
  ApplicationsControllers applicationsControllers =
      Get.put(ApplicationsControllers());

  late ColorNotifier notifier;

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
                widget.title,
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
      body: Container(
        height: 800,
        width: width,
        decoration: BoxDecoration(
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                width < 950
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: notifier.text,
                          ),
                        ),
                      ),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: width < 1550 ? null : constraints.maxWidth,
                        child: Table(
                          border: TableBorder(
                            horizontalInside:
                                BorderSide(color: notifier.getfillborder),
                          ),
                          columnWidths: {
                            0: FixedColumnWidth(
                              widget.showcheckboxes == false ? 0 : 50,
                            ),
                            1: FixedColumnWidth(
                              widget.showcheckboxes == false ? 250 : 240,
                            ),
                            2: FixedColumnWidth(
                              widget.showcheckboxes == false ? 170 : 150,
                            ),
                            3: FixedColumnWidth(
                              widget.showcheckboxes == false ? 150 : 130,
                            ),
                            4: FixedColumnWidth(120),
                            5: FixedColumnWidth(103),
                            6: FixedColumnWidth(110),
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
                                    child: widget.showcheckboxes == false
                                        ? Container()
                                        : Transform.scale(
                                            scale: 1,
                                            child: Checkbox(
                                              overlayColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                Colors.transparent,
                                              ),
                                              activeColor:
                                                  const Color(0xff0f79f3),
                                              side: BorderSide(
                                                color: notifier.chakboxborder,
                                                width: 2,
                                              ),
                                              value: applicationsControllers
                                                  .isActive,
                                              onChanged: (val) {
                                                setState(() {
                                                  applicationsControllers
                                                      .isActive = val!;
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
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
                            for (var a = applicationsControllers.loadmore;
                                a <
                                    applicationsControllers.loadmore +
                                        applicationsControllers.selectindex;
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
                                          return widget.showcheckboxes == false
                                              ? Container()
                                              : Transform.scale(
                                                  scale: 1,
                                                  child: Checkbox(
                                                    overlayColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                      Colors.transparent,
                                                    ),
                                                    activeColor:
                                                        const Color(0xff0f79f3),
                                                    side: BorderSide(
                                                      color: notifier
                                                          .chakboxborder,
                                                      width: 2,
                                                    ),
                                                    value:
                                                        applicationsControllers
                                                            .isActive,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        applicationsControllers
                                                            .isActive = val!;
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
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 22,
                                        horizontal: 15,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            widget.icon,
                                            color: Color(0xFFffb264),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              "  ${applicationsControllers.name[a]}",
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
                                        applicationsControllers.owner[a],
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
                                        applicationsControllers.listedDate[a],
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
                                        applicationsControllers.fileSizes[a],
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
                                        applicationsControllers.fileItems[a],
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
                                            height: 20,
                                            color: notifier.text,
                                          ),
                                          SizedBox(width: 10),
                                          Image.asset(
                                            "assets/images/trash.png",
                                            height: 20,
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
            );
          },
        ),
      ),
    );
  }
}
