
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/e_commerece_controllers/transactionscontroller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget transactionsHistory(context) {
  TransactionsController transactionsHistory =
      Get.put(TransactionsController());

  bool button = false;

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  List<Color> transactionsiconbgcolor = [
    notifier.liblueColor,
    notifier.liredColor,
    notifier.lipurpleColor,
    notifier.litealAccentColor,
    notifier.liyellowColor,
    notifier.ligreenColor,
    notifier.liblueColor,
    notifier.liblueColor,
    notifier.liblueColor,
    notifier.liblueColor,
    notifier.liblueColor,
    notifier.liblueColor,
  ];

  return LayoutBuilder(
    builder: (context, constraints) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: notifier.getBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transactions History",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 20,
                        fontWeight: FontWeight.bold, color: notifier.text,
                        // color: const Color(0xFF475569),
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
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // color: Colors.amber.shade50,
                            ),
                        width: width < 550
                            ? constraints.maxWidth - 50
                            : width < 950
                                ? constraints.maxWidth / 1.2 + 100
                                : width < 1600
                                    ? constraints.maxWidth / 1.2 + 170
                                    : constraints.maxWidth / 1.2 + 230,
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: notifier.getfillborder,
                            ),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(250),
                            1: FixedColumnWidth(100),
                          },
                          children: [
                            for (var a = transactionsHistory.loadmore;
                                a <
                                    transactionsHistory.loadmore +
                                        transactionsHistory.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: ListTile(
                                      minVerticalPadding: 0,
                                      contentPadding: EdgeInsets.zero,
                                      leading: Container(
                                        height: height / 20,
                                        width: height / 20,
                                        decoration: BoxDecoration(
                                          color: transactionsiconbgcolor[a],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          transactionsHistory
                                              .transactionsicons[a],
                                          // height: 40,
                                          color: transactionsHistory
                                              .transactionsiconcolor[a],
                                        ),
                                      ),
                                      title: Text(
                                        transactionsHistory.transactionstext[a],
                                        style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: notifier.text
                                            // color: const Color(0xFF475569),
                                            ),
                                      ),
                                      subtitle: Text(
                                        transactionsHistory
                                            .transactionstimeanddate[a],
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Outfit",
                                          color: Colors.grey,
                                        ),
                                      ),
                                      dense: true,
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        width: width / 5,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        child: Text(
                                          transactionsHistory
                                              .transactionsamount[a],
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: a == 1 ||
                                                    a == 4 ||
                                                    a == 5 ||
                                                    a == 9 ||
                                                    a == 10
                                                ? Colors.red
                                                : Colors.green,
                                            fontFamily: "Outfit",
                                          ),
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
                NextPageButton(
                  number1: "6",
                  number2: "12",
                  number3: "18",
                  numberofpages: "1 – 6 of 12",
                  backbutton: () {
                    if (button == true) {
                      setState(() {
                        button = !button;
                        transactionsHistory.transactionsicons.shuffle();
                        transactionsHistory.transactionstext.shuffle();
                        transactionsHistory.transactionsamount.shuffle();
                        transactionsHistory.transactionstimeanddate.shuffle();
                        transactionsHistory.transactionsiconcolor.shuffle();
                        transactionsiconbgcolor.shuffle();
                      });
                      transactionsHistory
                          .setloadmore(transactionsHistory.selectpage);

                    }
                  },
                  nextbutton: () {
                    if (button == false) {
                      setState(() {
                        button = !button;
                        transactionsHistory.transactionsicons.shuffle();
                        transactionsHistory.transactionstext.shuffle();
                        transactionsHistory.transactionsamount.shuffle();
                        transactionsHistory.transactionstimeanddate.shuffle();
                        transactionsHistory.transactionsiconcolor.shuffle();
                        transactionsiconbgcolor.shuffle();
                      });
                      transactionsHistory
                          .setloadmore(transactionsHistory.selectpage);
                    }
                  },
                )
              ],
            ),
          );
        },
      );
    },
  );
}
