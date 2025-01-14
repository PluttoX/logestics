import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class StudentProgressController extends GetxController implements GetxService {
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

  int selectindex = 5;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List studentId = [
    "532",
    "453",
    "564",
    "654",
    "738",
    "823",
    "923",
    "232",
    "354",
    "542",
  ];

  List studentName = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
  ];

  List studentCourseName = [
    "Business Finance",
    "Web Development",
    "Introduction to Python",
    "Graphics Design Basics",
    "Business Finance",
    "Introduction to Python",
    "Data Science",
    "Graphics Design Basics",
    "Data Science",
    "Web Development",
  ];

  List progress = [
    "75%",
    "55%",
    "65%",
    "90%",
    "70%",
    "70%",
    "90%",
    "65%",
    "55%",
    "75%",
  ];

  List<Color> progressColor = [
    Color(0xFF00cae3),
    Color(0xFF0f79f3),
    Color(0xFFffb264),
    Color(0xFF796df6),
    Color(0xFF2ed47e),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
  ];

  List<double> progressvalues = [
    0.7,
    0.5,
    0.6,
    0.9,
    0.7,
    0.7,
    0.9,
    0.6,
    0.5,
    0.7,
  ];
}
