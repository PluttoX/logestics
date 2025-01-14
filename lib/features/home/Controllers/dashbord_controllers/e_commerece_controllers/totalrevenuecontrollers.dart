
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class Totalrevenuecontrollers extends GetxController implements GetxService {
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

  List orderId = [
    "2356",
    "3947",
    "9783",
    "7384",
    "2347",
    "3498",
    "4930",
    "9584",
    "8634",
    "3726",
  ];

  List customerimages = [
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/artist.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/blue-man.jpg",
  ];

  List customername = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user1,
    AllString.user2,
  ];

  List created = [
    "25 Dec,2023",
    "19 Dec,2023",
    "17 Dec,2023",
    "11 Dec,2023",
    "21 Dec,2023",
    "30 Dec,2023",
    "7 Dec,2023",
    "4 Dec,2023",
    "2 Dec,2023",
    "3 Dec,2023",
  ];

  List total = [
    "5,672",
    "1,937",
    "2,083",
    "8,345",
    "6,534",
    "2,345",
    "5,565",
    "2,563",
    "4,643",
    "3,875",
  ];

  List profit = [
    "3,347",
    "347",
    "863",
    "736",
    "843",
    "283",
    "543",
    "123",
    "736",
    "74",
  ];

  List status = [
    "Shipped",
    "Confirmed",
    "Pending",
    "Rejected",
    "Shipped",
    "Shipped",
    "Shipped",
    "Confirmed",
    "Confirmed",
    "Rejected",
  ];

  List<Color> statustextcolors = [
    Color(0xFF4486f3),
    Color(0xFF44d78f),
    Color(0xFFffb36c),
    Color(0xFFeb7a75),
    Color(0xFF4486f3),
    Color(0xFF4486f3),
    Color(0xFF4486f3),
    Color(0xFF44d78f),
    Color(0xFF44d78f),
    Color(0xFFeb7a75),
  ];
}
