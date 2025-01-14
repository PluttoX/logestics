
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class MyDriveControllers extends GetxController implements GetxService {
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

  int selectindex = 10;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List name = [
    "Dashboard design file",
    "Important documents",
    "Product design",
    "Dashboard design file",
    "Media files",
    "Graphics design file",
    "Personal photo",
    "Audio file",
    "English learning files",
    "Mix projects design files",
  ];

  List owner = [
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

  List listedDate = [
    "Nov 20,2024",
    "Nov 18,2024",
    "Nov 17,2024",
    "Nov 15,2024",
    "Nov 14,2024",
    "Nov 13,2024",
    "Nov 9,2024",
    "Nov 8,2024",
    "Nov 6,2024",
    "Nov 5,2024",
  ];

  List fileSize = [
    "1.2 GB",
    "2.6 GB",
    "3.2 GB",
    "1 GB",
    "1.5 GB",
    "1.6 GB",
    "1.2 GB",
    "1.3 GB",
    "1.1 GB",
    "1.2 GB",
  ];

  List fileItems = [
    "69",
    "236",
    "365",
    "25",
    "153",
    "142",
    "175",
    "136",
    "65",
    "88",
  ];
}
