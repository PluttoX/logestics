
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class SlaMonitoringController extends GetxController implements GetxService {
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

  int selectindex = 12;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List ticketID = [
    "745",
    "634",
    "342",
    "645",
    "458",
    "347",
    "982",
    "764",
    "837",
    "854",
    "343",
    "656",
  ];

  List subject = [
    "Flutter",
    "Python",
    "Java",
    "HTML",
    "Android",
    "UI/UX Desing",
    "Flutter",
    "Python",
    "Java",
    "HTML",
    "Android",
    "UI/UX Desing",
  ];

  List requester = [
    "example@${AllString.user1}.com",
    "example@${AllString.user2}.com",
    "example@${AllString.user3}.com",
    "example@${AllString.user4}.com",
    "example@${AllString.user5}.com",
    "example@${AllString.user6}.com",
    "example@${AllString.user1}.com",
    "example@${AllString.user2}.com",
    "example@${AllString.user3}.com",
    "example@${AllString.user4}.com",
    "example@${AllString.user5}.com",
    "example@${AllString.user6}.com",
  ];

  List slaDueBy = [
    "Nov 30, 2024 2:00 PM",
    "Dec 30, 2024 10:30 AM",
    "Dec 10, 2024 12:00 PM",
    "Dec 30, 2024 10:30 AM",
    "Dec 10, 2024 12:00 PM",
    "Nov 30, 2024 2:00 PM",
    "Dec 15, 2024 9:30 AM",
    "Dec 15, 2024 9:30 AM",
    "Nov 30, 2024 2:00 PM",
    "Dec 10, 2024 12:00 PM",
    "Dec 15, 2024 9:30 AM",
    "Dec 30, 2024 10:30 AM",
  ];

  List endRemaining = [
    "1 days 4 hours",
    "1 day",
    "5 days 7 hours",
    "15 days 2 hours",
    "1 days 4 hours",
    "1 day",
    "5 days 7 hours",
    "15 days 2 hours",
    "1 days 4 hours",
    "1 day",
    "5 days 7 hours",
    "15 days 2 hours",
  ];
}
