import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class CustomersController extends GetxController implements GetxService {
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

  List ordersId = [
    "#ARP-1217",
    "#ARP-1364",
    "#ARP-2951",
    "#ARP-7342",
    "#ARP-4619",
    "#ARP-7346",
    "#ARP-7612",
    "#ARP-7642",
    "#ARP-4652",
    "#ARP-7895",
    "#ARP-7895",
    "#ARP-4652",
    "#ARP-7642",
    "#ARP-7612",
    "#ARP-7346",
    "#ARP-4619",
    "#ARP-7342",
    "#ARP-2951",
    "#ARP-1364",
    "#ARP-1217",
  ];

  List customerImages = [
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
    "assets/images/artist.png",
    "assets/images/download 1.png",
    "assets/images/avatar-7 1.png",
  ];

  List customerName = [
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
    AllString.user3,
    AllString.user4,
  ];

  List email = [
    "${AllString.user1}@example.com",
    "${AllString.user2}@example.com",
    "${AllString.user3}@example.com",
    "${AllString.user4}@example.com",
    "${AllString.user5}@example.com",
    "${AllString.user6}@example.com",
    "${AllString.user1}@example.com",
    "${AllString.user2}@example.com",
    "${AllString.user3}@example.com",
    "${AllString.user4}@example.com",
    "${AllString.user5}@example.com",
    "${AllString.user6}@example.com",
    "${AllString.user1}@example.com",
    "${AllString.user2}@example.com",
    "${AllString.user3}@example.com",
    "${AllString.user4}@example.com",
    "${AllString.user5}@example.com",
    "${AllString.user6}@example.com",
    "${AllString.user3}@example.com",
    "${AllString.user2}@example.com",
  ];

  List phone = [
    "+1 555-123-4567",
    "+1 555-987-6543",
    "+1 555-456-7890",
    "+1 555-369-7878",
    "+1 555-658-4488",
    "+1 555-558-9966",
    "+1 555-357-5888",
    "+1 555-456-8877",
    "+1 555-622-4488",
    "+1 555-225-4488",
    "+1 555-225-4488",
    "+1 555-622-4488",
    "+1 555-456-8877",
    "+1 555-357-5888",
    "+1 555-558-9966",
    "+1 555-658-4488",
    "+1 555-369-7878",
    "+1 555-456-7890",
    "+1 555-987-6543",
    "+1 555-123-4567",
  ];

  List lastLogin = [
    "Nov 10, 2024",
    "Nov 11, 2024",
    "Nov 12, 2024",
    "Nov 13, 2024",
    "Nov 14, 2024",
    "Nov 15, 2024",
    "Nov 16, 2024",
    "Nov 17, 2024",
    "Nov 18, 2024",
    "Nov 19, 2024",
    "Nov 19, 2024",
    "Nov 18, 2024",
    "Nov 17, 2024",
    "Nov 16, 2024",
    "Nov 15, 2024",
    "Nov 14, 2024",
    "Nov 13, 2024",
    "Nov 12, 2024",
    "Nov 11, 2024",
    "Nov 10, 2024",
  ];

  List totalSpend = [
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

  List totalOrders = [
    "125",
    "99",
    "145",
    "279",
    "169",
    "46",
    "184",
    "166",
    "75",
    "55",
    "55",
    "75",
    "166",
    "184",
    "46",
    "169",
    "279",
    "145",
    "99",
    "125",
  ];

  List status = [
    "Active",
    "Active",
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Active",
    "Active",
    "Deactive",
    "Deactive",
    "Active",
    "Active",
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Active",
    "Active",
  ];
}
