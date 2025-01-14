import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsHistoryControllers extends GetxController
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

  int selectindex = 10;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List orderId = [
    "#ARP-1217",
    "#ABC-1231",
    "#VGS-4123",
    "#FES-4212",
    "#FDA-1234",
    "#DSE-5421",
    "#GTR-3123",
    "#AWS-1264",
    "#DXA-1963",
    "#FFSA-3451",
    "#FFSA-3451",
    "#DXA-1963",
    "#AWS-1264",
    "#GTR-3123",
    "#DSE-5421",
    "#FDA-1234",
    "#FES-4212",
    "#VGS-4123",
    "#ABC-1231",
    "#ARP-1217",
  ];

  List status = [
    "Successful",
    "Successful",
    "Pending",
    "Rejected",
    "Successful",
    "Rejected",
    "Pending",
    "Successful",
    "Successful",
    "Pending",
    "Pending",
    "Successful",
    "Successful",
    "Pending",
    "Rejected",
    "Successful",
    "Rejected",
    "Pending",
    "Successful",
    "Successful",
  ];

  List<Color> statusTextColor = [
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFFffb265),
    Color(0xFFe74c3d),
    Color(0xFF0f79f3),
    Color(0xFFe74c3d),
    Color(0xFFffb265),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFFffb265),
    Color(0xFFffb265),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFFffb265),
    Color(0xFFe74c3d),
    Color(0xFF0f79f3),
    Color(0xFFe74c3d),
    Color(0xFFffb265),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
  ];

  List amount = [
    "6855.00",
    "258.00",
    "3890.00",
    "2,500.00",
    "8,200.00",
    "640.00",
    "9,100.00",
    "7,300.00",
    "6,600.00",
    "2,800.00",
    "2,800.00",
    "6,600.00",
    "7,300.00",
    "9,100.00",
    "640.00",
    "8,200.00",
    "2,500.00",
    "3890.00",
    "258.00",
    "6855.00",
  ];

  List rewards = [
    "12.00",
    "9.00",
    "11.00",
    "23.42",
    "10.84",
    "3.21",
    "43.21",
    "42.42",
    "11.21",
    "14.32",
    "14.32",
    "11.21",
    "42.42",
    "43.21",
    "3.21",
    "10.84",
    "23.42",
    "11.00",
    "9.00",
    "12.00",
  ];

  List date = [
    "14 Jan 2024",
    "13 Jan 2024",
    "12 Jan 2024",
    "11 Jan 2024",
    "10 Jan 2024",
    "09 Jan 2024",
    "08 Jan 2024",
    "07 Jan 2024",
    "06 Jan 2024",
    "05 Jan 2024",
    "05 Jan 2024",
    "06 Jan 2024",
    "07 Jan 2024",
    "08 Jan 2024",
    "09 Jan 2024",
    "10 Jan 2024",
    "11 Jan 2024",
    "12 Jan 2024",
    "13 Jan 2024",
    "14 Jan 2024",
  ];
}
