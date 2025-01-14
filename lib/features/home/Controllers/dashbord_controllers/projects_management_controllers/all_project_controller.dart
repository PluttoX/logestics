import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProjectController extends GetxController implements GetxService {
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

  List id = [
    "634",
    "234",
    "564",
    "456",
    "756",
    "342",
    "762",
    "342",
    "456",
    "967",
  ];

  List projectName = [
    "Refund bill payment",
    "Python upgrade",
    "Hotel managerment system",
    "Send Proposal to APR Ltd",
    "Schedule meeting with unity",
    "Engineering lite touch",
    "services & startup agency",
    "NFT marketplace",
    "Money transfer",
    "Project launchpad",
  ];

  List client = [
    "Vaxo Corporation",
    "Beja Ltd",
    "Aegis Industries",
    "Affort Solutions",
    "Shawn Kennedy",
    "Addax Ltd",
    "Profun Solutions",
    "Futo Agency",
    "Alina Smith",
    "Mave Metaverse",
  ];

  List startDate = [
    "12 Oct,2025",
    "17 Oct,2025",
    "08 Oct,2025",
    "22 Oct,2025",
    "28 Oct,2025",
    "14 Oct,2025",
    "21 Oct,2025",
    "23 Oct,2025",
    "18 Oct,2025",
    "05 Oct,2025",
  ];

  List endDate = [
    "15 Oct, 2025",
    "14 Oct, 2025",
    "13 Oct, 2025",
    "12 Oct, 2025",
    "11 Oct, 2025",
    "10 Oct, 2025",
    "09 Oct, 2025",
    "08 Oct, 2025",
    "07 Oct, 2025",
    "06 Oct, 2025",
  ];

  List budget = [
    "5,250",
    "4,870",
    "3,500",
    "7,550",
    "2,500",
    "1,231",
    "2,412",
    "5,412",
    "6,412",
    "10,242",
  ];

  List status = [
    "In Progress",
    "Pending",
    "completed",
    "Not Started",
    "In Progress",
    "Pending",
    "Completed",
    "Not Started",
    "In Progress",
    "Completed",
  ];

  List<Color> statusTextColor = [
    Color(0xFFffb26f),
    Color(0xFF49d68a),
    Color(0xFF107af3),
    Color(0xFFe75244),
    Color(0xFFffb26f),
    Color(0xFF49d68a),
    Color(0xFF107af3),
    Color(0xFFe75244),
    Color(0xFFffb26f),
    Color(0xFF107af3),
  ];

  List<Color> statusBgColor = [
    Color(0xFFfef7e8),
    Color(0xFFeafbf2),
    Color(0xFFe7f1fe),
    Color(0xFFfdedeb),
    Color(0xFFfef7e8),
    Color(0xFFeafbf2),
    Color(0xFFe7f1fe),
    Color(0xFFfdedeb),
    Color(0xFFfef7e8),
    Color(0xFFe7f1fe),

    // Color(0xFF30312E),
    // Color(0xFF1B3536),
    // Color(0xFF1A2C42),
    // Color(0xFF2F272F),
    // Color(0xFF30312E),
    // Color(0xFF1B3536),
    // Color(0xFF1A2C42),
    // Color(0xFF2F272F),
    // Color(0xFF30312E),
    // Color(0xFF1A2C42),
  ];
}
