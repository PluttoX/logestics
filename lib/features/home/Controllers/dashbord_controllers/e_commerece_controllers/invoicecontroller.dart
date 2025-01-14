import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController implements GetxService {
  int selectpage = 0;
  int loadmore = 1;

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

  List sellingproductimages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTecHn-7vAR6u5TXNU4JkMwjpZWJTO152NeFQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX72nNkTuehbB8zZah1TW6b6J4q3T1lQSB5A&s",
    "https://rukminim2.flixcart.com/image/850/1000/xif0q/smartwatch/b/o/t/45-9-t21-black-bluetooth-smart-watch-with-1-81inch-hd-display-original-imagjufjmgqgutzn.jpeg?q=20&crop=false",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYekZxynaEs8_DaFSVfKPzFIs1cZbs2UEgsw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTglAZ3gtDo9VvehyEjL_4mdeYagQPjviQHTQ&s",
    "https://m.media-amazon.com/images/I/51srHZlnlyL._AC_UY1000_.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8k1RGNv6SkV-fKLMLoQ2npvzmx0SPgnLtBw&s",
    "https://assets.ajio.com/medias/sys_master/root/20231028/PL5u/653cae77ddf77915195ff66d/-473Wx593H-465618157-tan-MODEL5.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnoLaCLI4QqMf6DA7Wkr7LYCjOthUYeNUnRg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTecHn-7vAR6u5TXNU4JkMwjpZWJTO152NeFQ&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX72nNkTuehbB8zZah1TW6b6J4q3T1lQSB5A&s",
    "https://rukminim2.flixcart.com/image/850/1000/xif0q/smartwatch/b/o/t/45-9-t21-black-bluetooth-smart-watch-with-1-81inch-hd-display-original-imagjufjmgqgutzn.jpeg?q=20&crop=false",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYekZxynaEs8_DaFSVfKPzFIs1cZbs2UEgsw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTglAZ3gtDo9VvehyEjL_4mdeYagQPjviQHTQ&s",
    "https://m.media-amazon.com/images/I/51srHZlnlyL._AC_UY1000_.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8k1RGNv6SkV-fKLMLoQ2npvzmx0SPgnLtBw&s",
    "https://assets.ajio.com/medias/sys_master/root/20231028/PL5u/653cae77ddf77915195ff66d/-473Wx593H-465618157-tan-MODEL5.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnoLaCLI4QqMf6DA7Wkr7LYCjOthUYeNUnRg&s",
  ];

  List sellingproducttitle = [
    "Mobile Phone",
    "Laptop Device",
    "Smart Watch",
    "Black T-Shirt",
    "Headphones",
    "Hand Watch",
    "Gaming Laptop",
    "Sports Shose",
    "437 Handbag",
    "Luxury Rendering",
    "Hand Watch",
    "Gaming Laptop",
    "Sports Shose",
    "Gaming Laptop",
    "437 Handbag",
    "Luxury Rendering",
    "Hand Watch",
    "Gaming Laptop",
  ];

  List sellingproductsubtitle = [
    "745 Items Sold",
    "343 Items Sold",
    "453 Items Sold",
    "564 Items Sold",
    "453 Items Sold",
    "543 Items Sold",
    "232 Items Sold",
    "874 Items Sold",
    "532 Items Sold",
    "845 Items Sold",
    "387 Items Sold",
    "643 Items Sold",
    "675 Items Sold",
    "234 Items Sold",
    "875 Items Sold",
    "788 Items Sold",
    "485 Items Sold",
    "454 Items Sold",
  ];

  List sellingproductmonths = [
    "MAR-6534",
    "MAR-8672",
    "MAR-2637",
    "MAR-9732",
    "MAR-2376",
    "MAR-5327",
    "MAR-4332",
    "MAR-8894",
    "MAR-9732",
    "MAR-3723",
    "MAR-2393",
    "MAR-8456",
    "MAR-6635",
    "MAR-7253",
    "MAR-5424",
    "MAR-4312",
    "MAR-1265",
    "MAR-7253",
  ];
  List sellingproductprice = [
    "90,954",
    "85,648",
    "79,852",
    "73,624",
    "65,973",
    "42,455",
    "75,643",
    "45,678",
    "21,453",
    "43,242",
    "42,455",
    "75,643",
    "45,678",
    "75,643",
    "21,453",
    "43,242",
    "42,455",
    "75,643",
  ];
}
