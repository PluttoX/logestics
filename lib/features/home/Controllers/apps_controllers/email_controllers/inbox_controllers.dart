import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxControllers extends GetxController implements GetxService {
  bool isActive = false;

  bool button = false;
  
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

  List titles = [
    "Social Media"
    "Snap Chart",
    "Dribble",
    "Twitter",
    "LinkedIn",
    "Shane Rice",
    "J. Pink man, Me (12)",
    "D. Warner, Me (10)",
    "Daily UI/Ux Design",
    "Google",
    "Website weekly",
    "Google",
    "D. Warner, Me (10)",
    "Facebook",
    "J. Pink man, Me (12)",
    "Shane Rice",
    "LinkedIn",
    "Instagram",
    "Dribble",
    "Facebook",
  ];

  List messageText = [
    "Dictum Nauris Vestibule proin velit turpis integer tellus tellus.",
    "Convallis aenean egestas vitae ullamcorper aliquet luctus. lpsum turpis dolor eget lects sed.",
    "A ac et nisl proin quam lacus. Vitae tempor non imperdiet set habitasse adipiscing scelerisque risus porttitor.",
    "Faucibus non curabitur felis dignissim urna est. Amet accumsan suspendisse amet commodo sagittis.",
    "Volutpat cursus enim fames magna aliquam facilisis commodo purus.",
    "Faucibus non curabitur felis dignissim urna est. Amet accumsan suspendisse amet commodo sagittis.",
    "Exclusive Product Offer on Facebook - Limited Time Only!",
    "Scelerisque orci sed lorem vel non dignissim elementum volutpat.",
    "Tincidunt rhoncus risus id elit. Volutpat risus ut nunc bibendum.",
    "Get 70% off Dribble Pro for Cyber Monday! Today",
    "Dictumst gravida nulla sed vitae eget adipiscing eros. Fermentum bibendum morbi in sed amet.",
    "Scelerisque orci sed lorem vel non dignissim elementum volutpat.",
    "Volutpat cursus enim fames magna aliquam facilisis commodo purus.",
    "Exclusive Product Offer on Facebook - Limited Time Only!",
    "A ac et nisl proin quam lacus. Vitae tempor non imperdiet set habitasse adipiscing scelerisque risus porttitor.",
    "Dictumst gravida nulla sed vitae eget adipiscing eros. Fermentum bibendum morbi in sed amet.",
    "Convallis aenean egestas vitae ullamcorper aliquet luctus. lpsum turpis dolor eget lects sed.",
    "Dictum Nauris Vestibule proin veldt turpis integer tellus tellus.",
    "Get 70% off Dribbble Pro for Cyber Monday! Today",
    "Exclusive Product Offer on Facebook - Limited Time Only!",
  ];

  List date = [
    "20 Dec, 2025",
    "19 Dec, 2025",
    "18 Dec, 2025",
    "17 Dec, 2025",
    "16 Dec, 2025",
    "15 Dec, 2025",
    "14 Dec, 2025",
    "13 Dec, 2025",
    "12 Dec, 2025",
    "11 Dec, 2025",
    "11 Dec, 2025",
    "12 Dec, 2025",
    "14 Dec, 2025",
    "20 Dec, 2025",
    "15 Dec, 2025",
    "16 Dec, 2025",
    "17 Dec, 2025",
    "18 Dec, 2025",
    "19 Dec, 2025",
    "20 Dec, 2025",
  ];
}
