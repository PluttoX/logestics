
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/e_commerece_controllers/totalrevenuecontrollers.dart';
import '../../../theme/theme.dart';
import '../../../widget/Searchfield.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget recentOrder(context) {
  Totalrevenuecontrollers totalrevenuecontrollers =
      Get.put(Totalrevenuecontrollers());

  bool button = false;
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  List<Color> statustextbgcolors = [
    notifier.liblueColor,
    notifier.ligreenColor,
    notifier.liyellowColor,
    notifier.liredColor,
    notifier.liblueColor,
    notifier.liblueColor,
    notifier.liblueColor,
    notifier.ligreenColor,
    notifier.ligreenColor,
    notifier.liredColor,
  ];

  return LayoutBuilder(
    builder: (context, constraints) {
      return StatefulBuilder(
        builder: (context, setState) {
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
                  height: width < 850 ? 80 : 50,
                  child: recentordertitlebar(context),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: width < 850
                            ? null
                            : width < 1600
                                ? constraints.maxWidth / 1.2 + 180
                                : constraints.maxWidth / 1.2 + 230,
                        child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: notifier.getfillborder,
                            ),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(130),
                            1: FixedColumnWidth(200),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(100),
                            4: FixedColumnWidth(120),
                            5: FixedColumnWidth(150),
                            6: FixedColumnWidth(100),
                          },
                          children: [
                            TableRow(
                              decoration:
                                  BoxDecoration(color: notifier.tablehader),
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Order ID",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Customer",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Created",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Total",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Profit",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
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
                                      "Action",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: Color(0xFF475569),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (var a = totalrevenuecontrollers.loadmore;
                                a <
                                    totalrevenuecontrollers.loadmore +
                                        totalrevenuecontrollers.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "#ARP-${totalrevenuecontrollers.orderId[a]}",
                                        overflow: TextOverflow.ellipsis,
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              totalrevenuecontrollers
                                                  .customerimages[a],
                                              height: 40,
                                            ),
                                          ),
                                          SizedBox(width: height / 80),
                                          Text(
                                            totalrevenuecontrollers
                                                .customername[a],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: notifier.text,
                                              // color: const Color(0xFF475569),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        totalrevenuecontrollers.created[a],
                                        overflow: TextOverflow.ellipsis,
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
                                        "\$${totalrevenuecontrollers.total[a]}",
                                        overflow: TextOverflow.ellipsis,
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
                                        "\$${totalrevenuecontrollers.profit[a]}",
                                        overflow: TextOverflow.ellipsis,
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
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          color: statustextbgcolors[a],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            totalrevenuecontrollers.status[a],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: totalrevenuecontrollers
                                                  .statustextcolors[a],
                                              fontFamily: "Outfit",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            "assets/images/eye.png",
                                            height: 40,
                                            color: Color(0xFF2a8ef6),
                                          ),
                                          Image.asset(
                                            "assets/images/trash.png",
                                            height: 20,
                                            color: notifier.text,
                                          ),
                                        ],
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
                    number1: "5",
                    number2: "10",
                    number3: "20",
                    numberofpages: "1 – 5 of 10",
                    backbutton: () {
                      if (button == true) {
                        setState(() {
                          button = !button;
                          totalrevenuecontrollers.orderId.shuffle();
                          totalrevenuecontrollers.customerimages.shuffle();
                          totalrevenuecontrollers.customername.shuffle();
                          totalrevenuecontrollers.created.shuffle();
                          totalrevenuecontrollers.total.shuffle();
                          totalrevenuecontrollers.profit.shuffle();
                          totalrevenuecontrollers.status.shuffle();
                          statustextbgcolors.shuffle();
                          totalrevenuecontrollers.statustextcolors.shuffle();
                        });
                        totalrevenuecontrollers
                            .setloadmore(totalrevenuecontrollers.selectpage);
                      }
                    },
                    nextbutton: () {
                      if (button == false) {
                        setState(() {
                          button = !button;
                          totalrevenuecontrollers.orderId.shuffle();
                          totalrevenuecontrollers.customerimages.shuffle();
                          totalrevenuecontrollers.customername.shuffle();
                          totalrevenuecontrollers.created.shuffle();
                          totalrevenuecontrollers.total.shuffle();
                          totalrevenuecontrollers.profit.shuffle();
                          totalrevenuecontrollers.status.shuffle();
                          statustextbgcolors.shuffle();
                          totalrevenuecontrollers.statustextcolors.shuffle();
                        });
                        totalrevenuecontrollers
                            .setloadmore(totalrevenuecontrollers.selectpage);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget recentordertitlebar(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  if (width < 850) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Orders",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: notifier.text,
                // color: const Color(0xFF475569),
              ),
            ),
            Spacer(),
            Popupbutton(
              title: "Show All",
              items: const [
                "Shipped",
                "Confirmed",
                "Pending",
                "Rejected",
              ],
            ),
          ],
        ),
        SizedBox(width: 20),
        Searchfield(),
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Recent Orders",
          style: TextStyle(
            fontFamily: "Outfit",
            fontSize: 20, color: notifier.text,
            fontWeight: FontWeight.bold,
            // color: const Color(0xFF475569),
          ),
        ),
        Spacer(),
        Popupbutton(
          title: "Show All",
          items: const [
            "Shipped",
            "Confirmed",
            "Pending",
            "Rejected",
          ],
        ),
        SizedBox(width: height / 50),
        Transform.translate(
          offset: const Offset(-8, 0),
          child: Container(
            width: width / 4,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Searchfield(),
          ),
        ),
      ],
    );
  }
}
