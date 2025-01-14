import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController implements GetxService {
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

  var selectPackage = 0.obs;

  void updateSelectPackagevalue(int value) {
    selectPackage.value = value;
  }

  List coursesCategoryimage = [
    "assets/images/check2-circle.png",
    "assets/images/dollar-circle.png",
    "assets/images/cup.png",
    "assets/images/star.png",
    "assets/images/besstseller.png"
  ];

  List<Color> coursesCategoryimagecolor = [
    Color(0xFF0f79f3),
    Color(0xFF827af7),
    Color(0xFF14cee8),
    Color(0xFF3cd588),
    Color(0xFFe74c3c),
  ];

  List coursesCategory = [
    "All Courses",
    "Paid",
    "Free",
    "Top Rated",
    "Best Sellers",
  ];

  List id = [
    "258",
    "648",
    "945",
    "186",
    "439",
    "752",
    "752",
    "439",
    "186",
    "945",
    "648",
    "258",
  ];

  List courseName = [
    "Introduction to python",
    "Data science fundamentals",
    "Graphic design basics",
    "Web development basics",
    "Business finance",
    "Advanced app development",
    "Advanced app development",
    "Business finance",
    "Web development basics",
    "Graphic design basics",
    "Data science fundamentals",
    "Introduction to python",
  ];

  List category = [
    "Technology",
    "Science",
    "Arts & design",
    "Technology",
    "Business",
    "Technology",
    "Technology",
    "Business",
    "Technology",
    "Arts & design",
    "Science",
    "Technology",
  ];

  List instructor = [
    "Ann Cohen",
    "Len Lewis",
    "Lillie Walker",
    "Lynn Flinn",
    "Mark Rivera",
    "Chad Campos",
    "Chad Campos",
    "Mark Rivera",
    "Lynn Flinn",
    "Lillie Walker",
    "Lea Lewis",
    "Ann Cohen",
  ];

  List enrolledStudents = [
    "120",
    "99",
    "75",
    "140",
    "50",
    "90",
    "90",
    "50",
    "140",
    "75",
    "99",
    "120",
  ];

  List startDate = [
    "01 Aug, 2024",
    "15 Aug, 2024",
    "01 Sep, 2024",
    "15 Sep, 2024",
    "01 Oct, 2024",
    "15 Oct, 2024",
    "15 Oct, 2024",
    "01 Oct, 2024",
    "15 Sep, 2024",
    "01 Sep, 2024",
    "15 Aug, 2024",
    "01 Aug, 2024",
  ];

  List endDate = [
    "30 Dec, 2024",
    "15 Dec, 2024",
    "30 Nov, 2024",
    "30 Dec, 2024",
    "30 Dec, 2024",
    "30 Dec, 2024",
    "30 Dec, 2024",
    "30 Dec, 2024",
    "30 Dec, 2024",
    "30 Nov, 2024",
    "15 Dec, 2024",
    "30 Dec, 2024",
  ];

  List price = [
    "30.99",
    "25.99",
    "19.99",
    "14.99",
    "20.99",
    "22.99",
    "22.99",
    "20.99",
    "14.99",
    "19.99",
    "25.99",
    "30.99",
  ];
}
