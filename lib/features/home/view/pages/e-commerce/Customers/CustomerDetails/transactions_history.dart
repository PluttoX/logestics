
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../Controllers/pages_controllers/e-commerce_controllers/CustomerDetailsControllers/transactions_history_controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../../widget/next_page_button.dart';
import '../../../../../widget/popupbutton.dart';

class TransactionsHistory extends StatefulWidget {
  const TransactionsHistory({super.key});

  @override
  State<TransactionsHistory> createState() => _TransactionsHistoryState();
}

class _TransactionsHistoryState extends State<TransactionsHistory> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  TransactionsHistoryControllers transactionsHistoryControllers =
      Get.put(TransactionsHistoryControllers());

  late ColorNotifier notifier;

  bool button = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    List<Color> statusbgColor = [
      notifier.liblueColor,
      notifier.liblueColor,
      notifier.liyellowColor,
      notifier.liredColor,
      notifier.liblueColor,
      notifier.liredColor,
      notifier.liyellowColor,
      notifier.liblueColor,
      notifier.liblueColor,
      notifier.liyellowColor,
      notifier.liyellowColor,
      notifier.liblueColor,
      notifier.liblueColor,
      notifier.liyellowColor,
      notifier.liredColor,
      notifier.liblueColor,
      notifier.liredColor,
      notifier.liyellowColor,
      notifier.liblueColor,
      notifier.liblueColor,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transactions History",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: notifier.text,
                      ),
                    ),
                    Popupbutton(
                      title: "Last Month",
                      items: const [
                        "Last Day",
                        "Last Week",
                        "Last Month",
                        "Last Year",
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: width < 750 ? null : constraints.maxWidth,
                      child: Table(
                        border: TableBorder(
                          horizontalInside:
                              BorderSide(color: notifier.getfillborder),
                        ),
                        columnWidths: width < 750
                            ? {
                                0: FixedColumnWidth(150),
                                1: FixedColumnWidth(100),
                                2: FixedColumnWidth(150),
                                3: FixedColumnWidth(130),
                                4: FixedColumnWidth(150),
                              }
                            : {},
                        children: [
                          TableRow(
                            decoration:
                                BoxDecoration(color: notifier.tablehader),
                            children: [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Order ID",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Status",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Amount",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Reward",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          for (var a = transactionsHistoryControllers.loadmore;
                              a <
                                  transactionsHistoryControllers.loadmore +
                                      transactionsHistoryControllers
                                          .selectindex;
                              a++)
                            TableRow(
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      transactionsHistoryControllers.orderId[a],
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color: statusbgColor[a],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        transactionsHistoryControllers
                                            .status[a],
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: transactionsHistoryControllers
                                              .statusTextColor[a],
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "\$${transactionsHistoryControllers.amount[a]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "\$${transactionsHistoryControllers.rewards[a]}",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      transactionsHistoryControllers.date[a],
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: NextPageButton(
                  number1: "10",
                  number2: "20",
                  number3: "30",
                  numberofpages: "1 – 10 of 20",
                  backbutton: () {
                    if (button == true) {
                      setState(() {
                        button = !button;
                        transactionsHistoryControllers.orderId.shuffle();
                        transactionsHistoryControllers.status.shuffle();
                        transactionsHistoryControllers.amount.shuffle();
                        transactionsHistoryControllers.rewards.shuffle();
                        transactionsHistoryControllers.date.shuffle();
                      });
                      transactionsHistoryControllers.setloadmore(
                          transactionsHistoryControllers.selectpage);
                    }
                  },
                  nextbutton: () {
                    if (button == false) {
                      setState(() {
                        button = !button;
                        transactionsHistoryControllers.orderId.shuffle();
                        transactionsHistoryControllers.status.shuffle();
                        transactionsHistoryControllers.amount.shuffle();
                        transactionsHistoryControllers.rewards.shuffle();
                        transactionsHistoryControllers.date.shuffle();
                      });
                      transactionsHistoryControllers.setloadmore(
                          transactionsHistoryControllers.selectpage);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
