
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoListController extends GetxController implements GetxService {
  bool isActive = false;

  int selectpage = 0;
  int loadmore = 0;

  ScrollController scrollController = ScrollController();

  setloadmore(value) {
    loadmore = value;
    update();
  }

  setpage(value) {
    selectpage = value;
    update();
  }

  int selectindex = 6;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List taskid = [
    "673",
    "543",
    "546",
    "234",
    "565",
    "743",
  ];

  List taskname = [
    "Refund bill payment",
    "Python upgrade",
    "Hotel managerment system",
    "Send Proposal to APR Ltd",
    "Schedule meeting with unity",
    "Engineering lite touch",
  ];

  List assignedto = [
    "Shawn Kennedy",
    "Roberto Cruz",
    "Juli Johnson",
    "Catalina Engles",
    "Louis Nagle",
    "Michael Marquez",
  ];

  List duedate = [
    "12 Oct,2025",
    "17 Oct,2025",
    "08 Oct,2025",
    "22 Oct,2025",
    "28 Oct,2025",
    "14 Oct,2025",
  ];

  List priority = [
    "High",
    "Medium",
    "High",
    "Low",
    "Medium",
    "Low",
  ];

  List status = [
    "In Progress",
    "Pending",
    "Completed",
    "Not Started",
    "In Progress",
    "Not Started",
  ];

  List<Color> statustextcolor = [
    Color(0xFFffb269),
    Color(0xFF34d47f),
    Color(0xFF0f7bf4),
    Color(0xFFe85542),
    Color(0xFFffb269),
    Color(0xFFe85542),
  ];
}
