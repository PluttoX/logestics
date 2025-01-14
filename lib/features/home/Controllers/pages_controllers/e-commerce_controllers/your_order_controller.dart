import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YourOrderControllers extends GetxController {
  late List<bool> isHover;

  @override
  void onInit() {
    super.onInit();
    isHover = List.filled(orderId.length, false);
  }

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

  List orderId = [
    "#ARP-1217",
    "#ARP-1423",
    "#ARP-4312",
    "#ARP-3124",
    "#ARP-1234",
  ];

  List productImage = [
    "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
    "https://redtape.com/cdn/shop/files/RSO3752_1.jpg?v=1711713936",
    "https://images.unsplash.com/photo-1484788984921-03950022c9ef?q=80&w=2132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0KVypvpG8ULXx6MTf4wQvPXuSdqmbWIpNjw&s",
    "https://cdn.pixabay.com/photo/2022/08/16/04/52/jewel-7389356_640.jpg",
  ];

  List productName = [
    "Hand Watch",
    "Sports Shoes",
    "Gaming Laptop",
    "Woman Handbag",
    "Luxury Rendering",
  ];

  List quantity = [1, 3, 1, 5, 2];

  List price = [
    "80.00",
    "150.00",
    "750.00",
    "15.00",
    "25.00",
  ];

  List total = [
    "80.00",
    "450.00",
    "750.00",
    "75.00",
    "50.00",
  ];
}
