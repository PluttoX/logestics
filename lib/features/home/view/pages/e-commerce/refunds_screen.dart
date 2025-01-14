
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/controllers.dart';
import '../../../Controllers/pages_controllers/e-commerce_controllers/refunds_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

class RefundsScreen extends StatefulWidget {
  const RefundsScreen({super.key});

  @override
  State<RefundsScreen> createState() => _RefundsScreenState();
}

class _RefundsScreenState extends State<RefundsScreen> {
  
  late ColorNotifier notifier;
  
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  RefundsController refundsController = Get.put(RefundsController());

  bool button = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier = Provider.of(context,listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width < 650 ? 55 : 40,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Refunds",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () =>
                                    mainDrawerController.updateSelectedIndex(0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/home.png",
                                      height: 15,
                                      color: Color(0xFF0f7bf4),
                                    ),
                                    Text(
                                      " Dashboard",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "E-Commerce",
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "Refunds",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  color: notifier.text,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Refunds",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () =>
                                    mainDrawerController.updateSelectedIndex(0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/home.png",
                                      height: 15,
                                      color: Color(0xFF0f7bf4),
                                    ),
                                    Text(
                                      " Dashboard",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "E-Commerce",
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                "Refunds",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  color: notifier.text,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                height: width < 550 ? 920 : 810,
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
                          SizedBox(
                            width: width < 430
                                ? constraints.maxWidth / 1.7
                                : width < 650
                                    ? constraints.maxWidth / 1.5
                                    : width < 950
                                        ? constraints.maxWidth / 2
                                        : width < 1200
                                            ? constraints.maxWidth / 3
                                            : constraints.maxWidth / 3.5,
                            child: TextField(
                              cursorColor: notifier.text,
                              style: TextStyle(
                                color: notifier.text
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: notifier.textFileColor,

                                hintText: 'Search order...',
                                prefixIcon: Image.asset(
                                  'assets/images/search.png',
                                  scale: 1.2,
                                  color: notifier.text,
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Outfit",
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                          Popupbutton(
                            title: "This Week",
                            items: const[
                              "This Day",
                              "This Week",
                              "This Month",
                              "This Year",
                            ],),
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
                            width: width < 1550 ? null : constraints.maxWidth,
                            child: Table(
                              border: TableBorder(
                                horizontalInside: BorderSide(
                                  color: notifier.getfillborder
                                ),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(130),
                                1: FixedColumnWidth(250),
                                2: FixedColumnWidth(150),
                                3: FixedColumnWidth(165),
                                4: FixedColumnWidth(165),
                                5: FixedColumnWidth(165),
                                6: FixedColumnWidth(140),
                                7: FixedColumnWidth(140),
                              },
                              children: [
                                TableRow(
                                  decoration:
                                      BoxDecoration(color: notifier.tablehader),
                                  children:  [
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Customer",
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
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
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "No. Orders Returned",
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "No. Order Refunded",
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "No. Orders Replaced",
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Total Refunded",
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          "Total Replaced",
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
                                  ],
                                ),
                                for (var a = refundsController.loadmore;
                                    a <
                                        refundsController.loadmore +
                                            refundsController.selectindex;
                                    a++)
                                  TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            refundsController.orderId[a],
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
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: ClipOval(
                                              child: Image.asset(
                                                refundsController
                                                    .customerImage[a],
                                                height: height / 20,
                                              ),
                                            ),
                                            title: Text(
                                              refundsController
                                                  .customerNames[a],
                                              style: TextStyle(
                                                fontFamily: "Outfit",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color:  notifier.text,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            refundsController.date[a],
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
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width < 1600 ? 20 : 45,
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            refundsController.ordersReturned[a],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
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
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width < 1600 ? 20 : 45,
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            refundsController.orderRefunded[a],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
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
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width < 1600 ? 15 : 45,
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            refundsController.ordersReplaced[a],
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
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
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width < 1650 ? 20 : 35,
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            "\$${refundsController.totalRefunded[a]}",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
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
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width < 1600 ? 20 : 35,
                                            vertical: 8,
                                          ),
                                          child: Text(
                                            "\$${refundsController.totalReplaced[a]}",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
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
                              refundsController.orderId.shuffle();
                              refundsController.customerImage.shuffle();
                              refundsController.customerNames.shuffle();
                              refundsController.date.shuffle();
                              refundsController.ordersReturned.shuffle();
                              refundsController.orderRefunded.shuffle();
                              refundsController.ordersReplaced.shuffle();
                              refundsController.totalRefunded.shuffle();
                              refundsController.totalReplaced.shuffle();
                            });
                            refundsController
                                .setloadmore(refundsController.selectpage);
                          }
                        },
                        nextbutton: () {
                          if (button == false) {
                            setState(() {
                              button = !button;
                              refundsController.orderId.shuffle();
                              refundsController.customerImage.shuffle();
                              refundsController.customerNames.shuffle();
                              refundsController.date.shuffle();
                              refundsController.ordersReturned.shuffle();
                              refundsController.orderRefunded.shuffle();
                              refundsController.ordersReplaced.shuffle();
                              refundsController.totalRefunded.shuffle();
                              refundsController.totalReplaced.shuffle();
                            });
                            refundsController
                                .setloadmore(refundsController.selectpage);
                          }
                        },
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
