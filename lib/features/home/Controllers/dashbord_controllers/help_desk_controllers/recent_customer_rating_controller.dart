import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/stringfile.dart';

class RecentCustomerRatingController extends GetxController
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

  int selectindex = 5;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List id = ["158", "132", "142", "125", "176", "199", "162", "187"];

  List customerImage = [
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
  ];

  List<double> ratingValues = [5, 4.5, 4, 4.9, 5, 4.5, 4, 4.9];

  List message = [
    "Overall good experience.",
    "Excellent experience!",
    "Top-notch customer service.",
    "Excellent experience overall",
    "Overall good experience.",
    "Excellent experience!",
    "Top-notch customer service.",
    "Excellent experience overall",
  ];
}
