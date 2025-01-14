
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class RecentLeadsController extends GetxController implements GetxService {
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

  List customerimage = [
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
  ];

  List customername = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
  ];

  List emial = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
  ];

  List source = [
    "Website",
    "Referral",
    "Cold Call",
    "Email Campaign",
    "Online Store",
    "Online Store",
    "Email Campaign",
    "Colod Call",
    "Referral",
    "Website",
  ];

  List status = [
    "New",
    "Won",
    "In Progress",
    "Lost",
    "New",
    "New",
    "New",
    "Won",
    "Won",
    "Lost",
  ];

  List<Color> statustextcolor = [
    Color(0xFF34d47f),
    Color(0xFF0f7bf4),
    Color(0xFFffb269),
    Color(0xFFe85542),
    Color(0xFF34d47f),
    Color(0xFF34d47f),
    Color(0xFF34d47f),
    Color(0xFF0f7bf4),
    Color(0xFF0f7bf4),
    Color(0xFFe85542),
  ];
}
