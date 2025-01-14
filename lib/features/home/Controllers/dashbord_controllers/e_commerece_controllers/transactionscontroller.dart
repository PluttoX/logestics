import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionsController extends GetxController implements GetxService {
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

  List transactionsicons = [
    "assets/images/rotate-left-circle.png",
    "assets/images/bank.png",
    "assets/images/credit-card.png",
    "assets/images/wallet.png",
    "assets/images/dollar.png",
    "assets/images/money-bills-simple.png",
    "assets/images/credit-card.png",
    "assets/images/wallet.png",
    "assets/images/rotate-left-circle.png",
    "assets/images/dollar.png",
    "assets/images/money-bills-simple.png",
    "assets/images/rotate-left-circle.png",
  ];

  List transactionstext = [
    "Refund Bill payment",
    "Bank Transfer",
    "Master Card",
    "Wallet",
    "Cash Withdrawal",
    "Payment",
    "Master Card",
    "Wallet",
    "Refund Bill payment",
    "Cash Withdrawal",
    "Payment",
    "Master Card",
  ];

  List transactionstimeanddate = [
    "17 Sep 2024 - 11:40pm",
    "19 Sep 2024 - 8:20am",
    "20 Sep 2024 - 11:40pm",
    "21 Sep 2024 - 10:10am",
    "23 Sep 2024 - 1:30pm",
    "14 Sep 2024 - 12:34pm",
    "02 Sep 2024 - 11:40am",
    "12 Sep 2024 - 10:10am",
    "03 Sep 2024 - 11:40am",
    "16 Sep 2024 - 1:30pm",
    "28 Sep 2024 - 12:34pm",
    "25 Sep 2024 - 11:40am",
  ];

  List transactionsamount = [
    "+\$235",
    "-\$2,340",
    "+\$234",
    "+\$543",
    "-\$232",
    "-\$534",
    "+\$343",
    "+\$432",
    "+\$884",
    "-\$342",
    "-\$983",
    "+\$263",
  ];

  List<Color> transactionsiconcolor = [
    Color(0xFF0f79f3),
    Color(0xFFe74e3f),
    Color(0xFF796df6),
    Color(0xFF05cbe4),
    Color(0xFFffb368),
    Color(0xFF32cc71),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
  ];
}
