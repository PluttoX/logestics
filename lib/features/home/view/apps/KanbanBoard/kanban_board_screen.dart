
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board/custom/board.dart';
import 'package:kanban_board/models/inputs.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';

class KanbanBoardScreen extends StatefulWidget {
  const KanbanBoardScreen({super.key});

  @override
  State<KanbanBoardScreen> createState() => _KanbanBoardScreenState();
}

class _KanbanBoardScreenState extends State<KanbanBoardScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  bool toCompletedHover = false;

  List toReviewTitles = [
    "Mobile app development",
    "website development",
    "Social media campaign",
    "WordPress development",
    "Project monitoring",
    "Digital marketing",
  ];

  List toReviewDays = [
    "10 days left",
    "5 days left",
    "6 day left",
    "8 days left",
    "4 days left",
    "6 days left",
  ];

  List toReviewStatuse = [
    "IT",
    "Social",
    "App",
    "Website",
    "Digital",
    "WordPress",
  ];

  List toReviewDate = [
    "Created 10 Nov",
    "Created 11 Nov",
    "Created 12 Nov",
    "Created 13 Nov",
    "Created 14 Nov",
    "Created 15 Nov",
  ];

  List toDoTitles = [
    "Social media campaign",
    "Project",
    "Project monitoring",
    "Project",
  ];

  List toDoDays = [
    "3 days left",
    "2 days left",
    "4 day left",
    "2 days left",
  ];

  List toDoStatuse = [
    "Design",
    "Marketing",
    "unity",
    "Development",
  ];

  List toDoDate = [
    "Created 20 Nov",
    "Created 19 Nov",
    "Created 18 Nov",
    "Created 17 Nov",
  ];

  List inProgressTitles = [
    "web development",
    "eCommerce development",
    "unity dashboard design",
    "Digital marketing",
    "Frontend design update",
    "WordPress development",
    "Mobile app development",
  ];

  List inProgressDays = [
    "3 days left",
    "2 days left",
    "5 days left",
    "4 day left",
    "2 days left",
    "3 days left",
    "1 days left",
  ];

  List inProgressStatuse = [
    "Design",
    "Mobile",
    "Marketing",
    "unity",
    "Development",
    "Dashboard",
    "Design",
  ];

  List inProgressDate = [
    "Created 21 Nov",
    "Created 18 Nov",
    "Created 03 Nov",
    "Created 24 Nov",
    "Created 16 Nov",
    "Created 20 Nov",
    "Created 11 Nov",
  ];

  List toCompletedTitles = [
    "App project update",
    "E-commerce site",
    "LMS & education site design",
    "Creative portfolio design",
    "Vaxo admin dashboard",
  ];

  List toCompletedStatuse = [
    "App",
    "Site",
    "Education",
    "Protfolio",
    "Admin",
  ];

  List toCompletedDate = [
    "Created 25 Nov",
    "Created 24 Nov",
    "Created 23 Nov",
    "Created 22 Nov",
    "Created 21 Nov",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: width < 650 ? 55 : 40,
            child: width < 650
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kanban Board",
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
                            onTap: () =>
                                mainDrawerController.updateSelectedIndex(0),
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
                            "Kanban Board",
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
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kanban Board",
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
                            onTap: () =>
                                mainDrawerController.updateSelectedIndex(0),
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
                            "Kanban Board",
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 800,
                  width: width < 500 ? width : width + 1000,
                  child: _buildcanban(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // }
  }

  Widget _buildcanban() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return KanbanBoard(
      // backgroundColor: const Color(0xFFeff3f9),
      backgroundColor: notifier.mainBgColor,
      List.generate(4, (index1) {
        return BoardListsData(
          title: index1 == 0
              ? "To Do (04)"
              : index1 == 1
                  ? "In Progress (07)"
                  : index1 == 2
                      ? "To Review (06)"
                      : "To Completed (05)",
          width: 450,

          headerBackgroundColor: Color(0xFF6356e2),
          footerBackgroundColor: Color(0xFF6356e2),
          backgroundColor: Colors.transparent,

          // backgroundColor: Colors.greenAccent,
          items: List.generate(
              index1 == 0
                  ? toDoTitles.length
                  : index1 == 1
                      ? inProgressTitles.length
                      : index1 == 2
                          ? toReviewTitles.length
                          : toCompletedTitles.length, (index) {
            return Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: notifier.getBgColor,
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        index1 == 0
                            ? toDoTitles[index]
                            : index1 == 1
                                ? inProgressTitles[index]
                                : index1 == 2
                                    ? toReviewTitles[index]
                                    : toCompletedTitles[index],
                        style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: notifier.text),
                      ),
                      Text(
                        index1 == 0
                            ? toDoDays[index]
                            : index1 == 1
                                ? inProgressDays[index]
                                : index1 == 2
                                    ? toReviewDays[index]
                                    : "Done",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 14,
                          color: index1 == 0
                              ? Color(0xFF127bf3)
                              : index1 == 1
                                  ? Color(0xFFffbd6a)
                                  : index1 == 2
                                      ? Color(0xFFec604b)
                                      : Color(0xFF32d581),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      "This column represents tasks that have been identified but are not yet scheduled for work.",
                      style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 14,
                          color: notifier.text
                          // color: Colors.black,
                          ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      // color: Color(0xFFf4f6fc),
                      color: notifier.lightbgcolor,
                    ),
                    child: Text(
                      index1 == 0
                          ? toDoStatuse[index]
                          : index1 == 1
                              ? inProgressStatuse[index]
                              : index1 == 2
                                  ? toReviewStatuse[index]
                                  : toCompletedStatuse[index],
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: Color(0xFF32d581),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF4bdcf3),
                      ),
                      SizedBox(width: 4),
                      Text(
                        index1 == 0
                            ? toDoDate[index]
                            : index1 == 1
                                ? inProgressDate[index]
                                : index1 == 2
                                    ? toReviewDate[index]
                                    : toCompletedDate[index],
                        style: TextStyle(
                          fontFamily: "Outfit",
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 70,
                        child: Stack(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/avatar-1-51c6502a 1.png"),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/avatar-7 1.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/images/avatar-8 1.png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      }),
      onItemLongPress: (cardIndex, listIndex) {},
      onItemReorder:
          (oldCardIndex, newCardIndex, oldListIndex, newListIndex) {},
      onListLongPress: (listIndex) {},
      onListReorder: (oldListIndex, newListIndex) {},
      onItemTap: (cardIndex, listIndex) {},
      onListTap: (listIndex) {},
      onListRename: (oldName, newName) {},
      displacementY: 0,
      displacementX: 0,
      textStyle: TextStyle(
        fontSize: 18,
        height: 1.3,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
