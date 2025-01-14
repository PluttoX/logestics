
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../Controllers/pages_controllers/e-commerce_controllers/your_order_controller.dart';
import '../../../../../theme/theme.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({super.key});

  @override
  State<RecentOrders> createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  YourOrderControllers yourOrderControllers = Get.put(YourOrderControllers());

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: notifier .getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width < 600 ? width / 3 : width / 5,
                      child: Text(
                        "RecentOrders",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width < 600 ? width / 3 : width / 5,
                      child: Text(
                        "Customer ID : 357951",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: width < 830
                          ? null
                          : width < 980
                              ? constraints.maxWidth
                              : width < 1500
                                  ? null
                                  : constraints.maxWidth,
                      child: Table(
                        border: TableBorder(
                          horizontalInside: BorderSide(
                            color:notifier.getfillborder
                          ),
                        ),
                        columnWidths: {
                          0: FixedColumnWidth(width < 600 ? 100 : 150),
                          1: FixedColumnWidth(width < 600 ? 200 : 260),
                          2: FixedColumnWidth(100),
                          3: FixedColumnWidth(width < 600 ? 150 : 198),
                          4: FixedColumnWidth(100),
                        },
                        children: [
                          TableRow(
                            decoration: BoxDecoration(color: notifier.tablehader),
                            children:  [
                              TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Order ID",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 14,
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
                                    "Product",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 14,
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
                                    "Items",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 14,
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
                                    "Price",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 14,
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
                                    "Total",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: notifier.text,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          for (var a = yourOrderControllers.loadmore;
                              a <
                                  yourOrderControllers.loadmore +
                                      yourOrderControllers.selectindex;
                              a++)
                            TableRow(
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    child: SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Text(
                                              yourOrderControllers.orderId[a],
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                letterSpacing: 1,
                                                fontFamily: "Outfit",
                                                fontSize: 14,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
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
                                    child: InkWell(
                                      onTap: () {},
                                      onHover: (value) {
                                        setState(() {
                                          yourOrderControllers.isHover[a] =
                                              value;
                                        });
                                      },
                                      child: ListTile(
                                        onTap: () {
                                          mainDrawerController
                                              .updateSelectedIndex(22);
                                        },
                                        contentPadding: EdgeInsets.zero,
                                        leading: ClipOval(
                                          child: Image.network(
                                            yourOrderControllers
                                                .productImage[a],
                                            height: 40,
                                            width: 40,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        title: Text(
                                          yourOrderControllers.productName[a],
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                yourOrderControllers.isHover[a]
                                                    ? Color(0xFF0f79f3)
                                                    :  notifier.text,
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${yourOrderControllers.quantity[a]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 14,
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
                                      "\$${yourOrderControllers.price[a]}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontFamily: "Outfit",
                                        fontSize: 14,
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
                                      "\$${yourOrderControllers.total[a]}",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontFamily: "Outfit",
                                        fontSize: 14,
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
            ],
          ),
        );
      },
    );
  }
}
