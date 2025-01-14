
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class TopCustomersController extends GetxController implements GetxService {
  int selectpage = 0;
  int loadmore = 1;

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

  List topcustomersimage = [
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/blue-man.jpg",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/artist.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/blue-man.jpg",
  ];

  List topcustomerstext = [
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

  List topcustomersid = [
    "63743",
    "87232",
    "34723",
    "23827",
    "23823",
    "43443",
    "34873",
    "34733",
    "34384",
    "34383",
    "45498",
    "89963",
  ];
}
