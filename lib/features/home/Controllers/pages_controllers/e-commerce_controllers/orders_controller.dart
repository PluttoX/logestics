import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class OrdersControllers extends GetxController {
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
    "assets/images/download 1.png",
    "assets/images/avatar-1-51c6502a 1.png",
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
    AllString.user1,
    AllString.user3,
  ];

  List items = [
    "120",
    "62",
    "49",
    "25",
    "82",
    "64",
    "91",
    "73",
    "66",
    "28",
    "28",
    "66",
    "73",
    "91",
    "64",
    "82",
    "25",
    "49",
    "62",
    "120",
  ];

  List price = [
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

  List date = [
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

  List vendor = [
    "Dennis Matthews",
    "Susan Rader",
    "Douglas Harvey",
    "John Valdez",
    "Kathryn Turner",
    "Ilona Slover",
    "Melanie Goldman",
    "Norma Collett",
    "Lucy Sturgill",
    "Shirley Scott",
    "Shirley Scott",
    "Lucy Sturgill",
    "Norma Collett",
    "Melanie Goldman",
    "IIona Slover",
    "Kathryn Turner",
    "John Valdez",
    "Douglas Harvey",
    "Susan Rader",
    "Dennis Matthews",
  ];

  List status = [
    "Shipped",
    "Confirmed",
    "Pending",
    "Shipped",
    "Rejected",
    "Pending",
    "Confirmed",
    "Confirmed",
    "Shipped",
    "Rejected",
    "Rejected",
    "Shipped",
    "Confirmed",
    "Confirmed",
    "Pending",
    "Rejected",
    "Shipped",
    "Pending",
    "Confirmed",
    "Shipped",
  ];

  List<Color> statusTextColor = [
    Color(0xFF5287f4),
    Color(0xFF30d47e),
    Color(0xFFffb264),
    Color(0xFF5287f4),
    Color(0xFFea7055),
    Color(0xFFffb264),
    Color(0xFF30d47e),
    Color(0xFF30d47e),
    Color(0xFF5287f4),
    Color(0xFFea7055),
    Color(0xFFea7055),
    Color(0xFF5287f4),
    Color(0xFF30d47e),
    Color(0xFF30d47e),
    Color(0xFFffb264),
    Color(0xFFea7055),
    Color(0xFF5287f4),
    Color(0xFFffb264),
    Color(0xFF30d47e),
    Color(0xFF5287f4),
  ];
}
