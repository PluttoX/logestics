import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/stringfile.dart';

class ContactsListController extends GetxController implements GetxService {
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

  List contactID = [
    "ARP-3235",
    "ARP-6734",
    "ARP-4382",
    "ARP-3484",
    "ARP-3434",
    "ARP-7346",
    "ARP-3463",
    "ARP-4543",
    "ARP-8457",
    "ARP-4985",
    "ARP-4849",
    "ARP-8734",
    "ARP-3948",
    "ARP-3489",
    "ARP-3483",
    "ARP-3493",
    "ARP-8934",
    "ARP-3483",
    "ARP-9484",
    "ARP-4949",
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
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
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
    AllString.user5,
    AllString.user6,
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
    "${AllString.user6}@example.com	",
    "${AllString.user1}@example.com",
    "${AllString.user2}@example.com	",
    "${AllString.user3}@example.com",
    "${AllString.user4}@example.com",
    "${AllString.user5}@example.com",
    "${AllString.user6}@example.com",
    "${AllString.user1}@example.com",
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
    "+1 555-622-4488",
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

  List lastContacted = [
    "Dec 10, 2024",
    "Dec 11, 2024",
    "Dec 12, 2024",
    "Dec 13, 2024",
    "Dec 14, 2024",
    "Dec 15, 2024",
    "Dec 16, 2024",
    "Dec 17, 2024",
    "Dec 18, 2024",
    "Dec 19, 2024",
    "Dec 19, 2024",
    "Dec 18, 2024",
    "Dec 17, 2024",
    "Dec 16, 2024",
    "Dec 15, 2024",
    "Dec 14, 2024",
    "Dec 13, 2024",
    "Dec 12, 2024",
    "Dec 11, 2024",
    "Dec 10, 2024",
  ];

  List company = [
    "ABC Corporation",
    "Tech Solutions",
    "ABC Corporation",
    "Global Solutions",
    "Acma Industries",
    "Synergy Ltd",
    "Summint Solutions",
    "Strategies Ltd",
    "Tech Enterprise",
    "Synetic Solutions",
    "XYZ Ltd",
    "Strategies Ltd",
    "Summint Solutions",
    "Tech Enterprise",
    "Synergy Ltd",
    "Acma Industries",
    "Synetic Solutions",
    "Global Solutions",
    "Tech Solutions",
    "XYZ Ltd",
  ];

  List leadScore = [
    "89",
    "56",
    "23",
    "34",
    "45",
    "65",
    "65",
    "76",
    "96",
    "94",
    "34",
    "45",
    "54",
    "38",
    "16",
    "27",
    "25",
    "40",
    "35",
    "50",
  ];

  List statustext = [
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Deactive",
    "Active",
    "Active",
    "Active",
  ];
}
