import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class PerformanceOfAgentsController extends GetxController
    implements GetxService {
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

  List agentId = [
    "235",
    "643",
    "343",
    "343",
    "532",
    "342",
    "342",
    "323",
    "343",
    "454",
    "653",
    "132",
  ];

  List agentImages = [
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
  ];

  List agentName = [
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
    AllString.user5,
    AllString.user6,
  ];

  List totalTickets = [
    "325",
    "342",
    "32",
    "343",
    "453",
    "345",
    "32",
    "343",
    "834",
    "60",
    "343",
    "343",
  ];

  List openTickets = [
    "30",
    "50",
    "65",
    "34",
    "5",
    "23",
    "34",
    "34",
    "76",
    "54",
    "45",
    "23",
  ];

  List resolvedTickets = [
    "105",
    "130",
    "75",
    "90",
    "165",
    "70",
    "70",
    "165",
    "90",
    "75",
    "130",
    "90",
  ];

  List aveResolutionTime = [
    "6.2 hours",
    "3.2 hours",
    "7.1 hours",
    "7.2 hours",
    "4.7 hours",
    "9.4 hours",
    "2.4 hours",
    "8.7 hours",
    "4.2 hours",
    "2.2 hours",
    "1.3 hours",
    "5.4 hours",
  ];

  List satisfactionRate = [
    "90%",
    "85%",
    "95%",
    "80%",
    "85%",
    "95%",
    "95%",
    "85%",
    "80%",
    "95%",
    "85%",
    "80%",
  ];

  List<Color> satisfactionRateColor = [
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
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
  ];

  List satisfactionvalue = [
    0.90,
    0.85,
    0.95,
    0.80,
    0.85,
    0.95,
    0.95,
    0.85,
    0.80,
    0.95,
    0.85,
    0.80,
  ];
}
