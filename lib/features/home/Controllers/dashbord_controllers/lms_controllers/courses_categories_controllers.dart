import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesCategoriesControllers extends GetxController
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

  int selectindex = 6;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List coursesImages = [
    "https://t4.ftcdn.net/jpg/05/85/00/55/360_F_585005559_YNUJFQaDLRWN61mGNxWzz9GZypXSrOgz.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShMEQH1Xg-IGevzMn3B_63xGK-G7ag6NetoFhLdK8DWkaNdX8Xh0rBM30M_TzxBOyqvtg&usqp=CAU",
    "https://media.istockphoto.com/id/1462788498/vector/welcome-in-major-world-language-word-cloud-vector-illustration.jpg?s=612x612&w=0&k=20&c=rL5EgzJffElbl6LofqPu_vfy3_VkxHKwuiZ_o7G-INk=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWvc7dxS0WZYyLdnWyWTb5Sg0Fy_svy9cQTQ&s",
    "https://tmsdaad.weebly.com/uploads/8/2/7/0/82704762/6320138_orig.png",
    "https://media.licdn.com/dms/image/v2/D5612AQGVtZvvvXWreQ/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1716183914718?e=2147483647&v=beta&t=zGQ4sqGmPpIWmVq6x5QXD8qZBrPAQXLiAt3DfnaqZOE",
    "https://t4.ftcdn.net/jpg/05/85/00/55/360_F_585005559_YNUJFQaDLRWN61mGNxWzz9GZypXSrOgz.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShMEQH1Xg-IGevzMn3B_63xGK-G7ag6NetoFhLdK8DWkaNdX8Xh0rBM30M_TzxBOyqvtg&usqp=CAU",
    "https://media.istockphoto.com/id/1462788498/vector/welcome-in-major-world-language-word-cloud-vector-illustration.jpg?s=612x612&w=0&k=20&c=rL5EgzJffElbl6LofqPu_vfy3_VkxHKwuiZ_o7G-INk=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWvc7dxS0WZYyLdnWyWTb5Sg0Fy_svy9cQTQ&s",
    "https://tmsdaad.weebly.com/uploads/8/2/7/0/82704762/6320138_orig.png",
    "https://media.licdn.com/dms/image/v2/D5612AQGVtZvvvXWreQ/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1716183914718?e=2147483647&v=beta&t=zGQ4sqGmPpIWmVq6x5QXD8qZBrPAQXLiAt3DfnaqZOE",
  ];

  List coursesName = [
    "Technology",
    "Business",
    "Language",
    "Science",
    "Arts & Design",
    "UI/UX",
    "UI/UX",
    "Science",
    "Business",
    "Language",
    "Technology",
    "Arts & Design",
  ];

  List coursesCategories = [
    "30+",
    "75+",
    "45+",
    "55+",
    "80+",
    "25+",
    "25+",
    "55+",
    "75+",
    "45+",
    "30+",
    "80+",
  ];

  List enrolled = [
    "950",
    "4586",
    "759",
    "8542",
    "2485",
    "869",
    "869",
    "8542",
    "4586",
    "759",
    "950",
    "2485",
  ];
}
