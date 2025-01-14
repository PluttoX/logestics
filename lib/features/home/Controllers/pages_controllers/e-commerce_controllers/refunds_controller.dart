import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class RefundsController extends GetxController implements GetxService {
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
    "#ARP-1364",
    "#ARP-2951",
    "#ARP-7342",
    "#ARP-4619",
    "#ARP-7346",
    "#ARP-7612",
    "#ARP-1217",
    "#ARP-7642",
    "#ARP-4652",
    "#ARP-4652",
    "#ARP-7642",
    "#ARP-1217",
    "#ARP-7612",
    "#ARP-7346",
    "#ARP-4619",
    "#ARP-7342",
    "#ARP-2951",
    "#ARP-1364",
    "#ARP-1217",
  ];

  List customerImage = [
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
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-7 1.png",
  ];

  List customerNames = [
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
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user2,
    AllString.user4,
  ];

  List date = [
    "Aug 23, 2024",
    "Aug 12, 2024",
    "Aug 17, 2024",
    "Aug 19, 2024",
    "Aug 06, 2024",
    "Aug 05, 2024",
    "Aug 22, 2024",
    "Aug 24, 2024",
    "Aug 15, 2024",
    "Aug 28, 2024",
    "Aug 25, 2024",
    "Aug 28, 2024",
    "Aug 20, 2024",
    "Aug 14, 2024",
    "Aug 01, 2024",
    "Aug 13, 2024",
    "Aug 09, 2024",
    "Aug 26, 2024",
    "Aug 29, 2024",
    "Aug 30, 2024",
  ];

  List ordersReturned = [
    "4",
    "3",
    "5",
    "6",
    "3",
    "4",
    "6",
    "7",
    "8",
    "4",
    "3",
    "4",
    "2",
    "5",
    "6",
    "7",
    "2",
    "1",
    "5",
    "6",
  ];

  List orderRefunded = [
    "2",
    "3",
    "1",
    "4",
    "6",
    "2",
    "4",
    "5",
    "6",
    "3",
    "6",
    "1",
    "7",
    "8",
    "4",
    "3",
    "3",
    "1",
    "5",
    "6",
  ];

  List ordersReplaced = [
    "0",
    "0",
    "4",
    "2",
    "7",
    "2",
    "1",
    "4",
    "5",
    "6",
    "6",
    "5",
    "4",
    "1",
    "2",
    "7",
    "2",
    "4",
    "0",
    "0",
  ];

  List totalRefunded = [
    "42.00",
    "32.00",
    "53.00",
    "42.00",
    "24.00",
    "53.00",
    "52.00",
    "42.00",
    "44.00",
    "99.00",
    "99.00",
    "44.00",
    "42.00",
    "52.00",
    "53.00",
    "24.00",
    "42.00",
    "53.00",
    "32.00",
    "42.00",
  ];

  List totalReplaced = [
    "50.00",
    "54.00",
    "67.00",
    "56.00",
    "45.00",
    "56.00",
    "67.00",
    "46.00",
    "68.00",
    "742.00",
    "742.00",
    "68.00",
    "46.00",
    "67.00",
    "56.00",
    "45.00",
    "56.00",
    "67.00",
    "54.00",
    "50.00",
  ];
}
