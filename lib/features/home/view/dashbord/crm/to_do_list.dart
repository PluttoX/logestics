
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/crm_controllers/to_do_list_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/Searchfield.dart';
import '../../../widget/my_dropdown_field.dart';
import '../../../widget/my_text_field.dart';

late ColorNotifier notifier;

Widget toDoList(context, {bool? titleshow}) {
  bool isActive = false;

  ToDoListController toDoListController = Get.put(ToDoListController());

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  List<Color> statusbgcolor = [
    notifier.liyellowColor,
    notifier.ligreenColor,
    notifier.liblueColor,
    notifier.liredColor,
    notifier.liyellowColor,
    notifier.liredColor,
  ];

  return LayoutBuilder(
    builder: (context, constraints) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            decoration: BoxDecoration(
              color: notifier.getBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: width < 650
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleshow == false
                                ? InkWell(
                                    onTap: () {
                                      showAddNewTaskDialog(context);
                                    },
                                    child: Text(
                                      "+ Add New Task",
                                      style: TextStyle(
                                        color: Color(0xFF0f7bf4),
                                        fontFamily: "Outfit",
                                      ),
                                    ),
                                  )
                                : Text(
                                    "To Do List",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                      // color: const Color(0xFF475569),
                                    ),
                                  ),
                            SizedBox(height: 5),
                            TextField(
                              cursorColor: notifier.text,
                              style: TextStyle(color: notifier.text),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: notifier.textFileColor,
                                hintText: 'Search here...',
                                prefixIcon: Image.asset(
                                  'assets/images/search.png',
                                  scale: 1.2,
                                  color: notifier.text,
                                ),
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            titleshow == false
                                ? InkWell(
                                    onTap: () {
                                      showAddNewTaskDialog(context);
                                    },
                                    child: Text(
                                      "+ Add New Task",
                                      style: TextStyle(
                                        color: Color(0xFF0f7bf4),
                                        fontFamily: "Outfit",
                                      ),
                                    ),
                                  )
                                : Text(
                                    "To Do List",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                      // color: const Color(0xFF475569),
                                    ),
                                  ),
                            SizedBox(
                              width: width < 850 ? width / 2 : width / 3.5,
                              child: Searchfield(),
                            ),
                          ],
                        ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: width < 1410 ? null : constraints.maxWidth,
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: notifier.getfillborder,
                            ),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(80),
                            1: FixedColumnWidth(90),
                            2: FixedColumnWidth(300),
                            3: FixedColumnWidth(180),
                            4: FixedColumnWidth(120),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(120),
                            7: FixedColumnWidth(100),
                          },
                          children: [
                            TableRow(
                              decoration:
                                  BoxDecoration(color: notifier.getHoverColor),
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
                                        side:  BorderSide(
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
                                      "Task ID",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Task Name",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Assigned To",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Due Date",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Priority",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Status",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                        // color: Color(0xFF475569),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var a = toDoListController.loadmore;
                                a <
                                    toDoListController.loadmore +
                                        toDoListController.selectindex;
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
                                              overlayColor:
                                                  MaterialStateProperty.all<
                                                      Color>(
                                                Colors.transparent,
                                              ),
                                              activeColor:
                                                  const Color(0xff0f79f3),
                                              side:  BorderSide(
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
                                      child: Text(
                                        "#${toDoListController.taskid[a]}",
                                        style: TextStyle(
                                          letterSpacing: 1,
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
                                        toDoListController.taskname[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
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
                                        toDoListController.assignedto[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: notifier.text,
                                          // color: const Color(0xFF475569),
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
                                        toDoListController.duedate[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
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
                                        toDoListController.priority[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
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
                                    child: Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: statusbgcolor[a],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          toDoListController.status[a],
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            color: toDoListController
                                                .statustextcolor[a],
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/eye.png",
                                            height: 20,
                                            color: Color(0xFF2a8ef6),
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
                titleshow == false
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                showAddNewTaskDialog(context);
                              },
                              child: Text(
                                "+ Add New Task",
                                style: TextStyle(
                                  color: Color(0xFF0f7bf4),
                                  fontFamily: "Outfit",
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
    },
  );
}

showAddNewTaskDialog(context) {
  notifier = Provider.of(context, listen: false);

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: notifier.getBgColor,
            ),
            colorScheme: ColorScheme.light(
              onSurface: notifier.text,
              background: notifier.getBgColor,
              primary: Color(0xFF2B79F3),
            ), // body text color
          ),
          child: child!,
        );
      },
    );
  }

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  var assignedselected = "Shawn Kennedy";
  var priorityselected = "High";
  var statusselected = "In Progress";

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      if (width < 850) {
        return AlertDialog(
          backgroundColor: notifier.getBgColor,
          insetPadding: EdgeInsets.symmetric(horizontal: 3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add New Task",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: notifier.text,
                  // color: Color(0xFF475569),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close, color: notifier.text,
                  // color: Color(0xFF475569),
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: width / 1.5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  MyTextFormField(
                    titleText: "Task Name",
                    labelText: "Task Name",
                    hintText: "E.g. Hand Wathe",
                  ),
                  SizedBox(height: 10),
                  MyDropdownFormField(
                    titletext: "Assigned To",
                    hinttext: "Select",
                    items: const [
                      "Shawn Kennedy",
                      "Roberto Cruz",
                      "Juli Johnson",
                      "Catalina Engles",
                      "Louis Nagle",
                      "Michael Marquez",
                    ],
                    onChanged: (value) {
                      assignedselected = value;
                    },
                  ),
                  SizedBox(height: 10),
                  MyDropdownFormField(
                    titletext: "Priority",
                    hinttext: "Select",
                    items: const ["High", "Medium", "Low"],
                    onChanged: (value) {
                      priorityselected = value;
                    },
                  ),
                  SizedBox(height: 10),
                  MyTextFormField(
                    titleText: "Due Date",
                    labelText: "Choose a date",
                    hintText: "",
                    suffixIcon: IconButton(
                      onPressed: () {
                        selectDate(context);
                      },
                      icon: Icon(
                        Icons.calendar_today_rounded,
                        color: notifier.text,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  MyDropdownFormField(
                    titletext: "Status",
                    hinttext: "Select",
                    items: const [
                      "In Progress",
                      "Pending",
                      "Completed",
                      "Not Started"
                    ],
                    onChanged: (value) {
                      statusselected = value;
                    },
                  ),
                ],
              ),
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
                      fontFamily: "Outfit",
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
                      fontFamily: "Outfit",
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
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add New Task",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.bold, color: notifier.text,
                  // color: Color(0xFF475569),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close, color: notifier.text,
                  // color: Color(0xFF475569),
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextFormField(
                  titleText: "Task Name",
                  hintText: "E.g. Hand Watch",
                  labelText: "Task Name",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Column(
                        children: [
                          MyDropdownFormField(
                            titletext: "Assigned To",
                            hinttext: "Select",
                            items: const [
                              "Shawn Kennedy",
                              "Roberto Cruz",
                              "Juli Johnson",
                              "Catalina Engles",
                              "Louis Nagle",
                              "Michael Marquez",
                            ],
                            onChanged: (value) {
                              assignedselected = value;
                            },
                          ),
                          SizedBox(height: 20),
                          MyDropdownFormField(
                            titletext: "Priority",
                            hinttext: "Select",
                            items: const [
                              "High",
                              "Medium",
                              "Low",
                            ],
                            onChanged: (value) {
                              priorityselected = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextFormField(
                            titleText: "Due Date",
                            hintText: "",
                            labelText: "Due Date",
                            suffixIcon: IconButton(
                              onPressed: () {
                                // showDatePickers();
                                selectDate(context);
                              },
                              icon: Icon(
                                Icons.calendar_today_rounded,
                                color: notifier.text,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          MyDropdownFormField(
                            titletext: "Status",
                            hinttext: "Select",
                            items: const [
                              "In Progress",
                              "Pending",
                              "Completed",
                              "Not Started"
                            ],
                            onChanged: (value) {
                              statusselected = value;
                            },
                          ),
                        ],
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
                minimumSize: Size(130, 60),
              ),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Outfit",
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
                minimumSize: Size(130, 60),
              ),
              child: Text(
                "Create",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Outfit",
                ),
              ),
            ),
          ],
        );
      }
    },
  );
}
