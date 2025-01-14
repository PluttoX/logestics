
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../Controllers/pages_controllers/e-commerce_controllers/customers_controller.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/Searchfield.dart';
import '../../../../widget/next_page_button.dart';
import '../../../../widget/popupbutton.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  CustomersController customersController = Get.put(CustomersController());

  late ColorNotifier notifier;

  bool isActive = false;

  bool button = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width < 650 ? 55 : 40,
                width: width,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Customers",
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
                                "Customers",
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
                            "Customers",
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
                                "Customers",
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
                height: width < 550 ? 940 : 830,
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
                            child: Searchfield(),
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
                            width: width < 1550 ? null : constraints.maxWidth,
                            child: Table(
                              border: TableBorder(
                                horizontalInside:
                                    BorderSide(color: notifier.getfillborder),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(60),
                                1: FixedColumnWidth(120),
                                2: FixedColumnWidth(230),
                                3: FixedColumnWidth(230),
                                4: FixedColumnWidth(180),
                                5: FixedColumnWidth(140),
                                6: FixedColumnWidth(140),
                                7: FixedColumnWidth(110),
                                8: FixedColumnWidth(110),
                                9: FixedColumnWidth(110),
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
                                        child: Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            overlayColor:
                                                WidgetStateProperty.all<Color>(
                                              Colors.transparent,
                                            ),
                                            activeColor:
                                                const Color(0xff0f79f3),
                                            side: BorderSide(
                                              color: notifier.chakboxborder,
                                              width: 2,
                                            ),
                                            value: isActive,
                                            onChanged: (val) {
                                              setState(() {
                                                isActive = val!;
                                              });
                                            },
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
                                          "Order ID",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
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
                                          "Customer",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
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
                                          "Email",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
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
                                          "Phone",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
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
                                          "Last Login",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
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
                                          "Total Spend",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
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
                                          "Total Order",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
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
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
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
                                          "Action",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            //fontSize:15
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                for (var a = customersController.loadmore;
                                    a <
                                        customersController.loadmore +
                                            customersController.selectindex;
                                    a++)
                                  TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: StatefulBuilder(
                                            builder: (BuildContext context,
                                                setState) {
                                              return Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                  overlayColor:
                                                      WidgetStateProperty.all<
                                                          Color>(
                                                    Colors.transparent,
                                                  ),
                                                  activeColor:
                                                      const Color(0xff0f79f3),
                                                  side: BorderSide(
                                                    color:
                                                        notifier.chakboxborder,
                                                    width: 2,
                                                  ),
                                                  value: isActive,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      isActive = val!;
                                                    });
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            customersController.ordersId[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              //fontSize:15
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
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: ClipOval(
                                              child: Image.asset(
                                                customersController
                                                    .customerImages[a],
                                                height: height / 20,
                                              ),
                                            ),
                                            title: Text(
                                              customersController
                                                  .customerName[a],
                                              style: TextStyle(
                                                fontFamily: "Outfit",
                                                //fontSize:15
                                                fontWeight: FontWeight.bold,
                                                color: notifier.text,
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
                                            "${customersController.email[a]}",
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              //fontSize:15
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
                                            customersController.phone[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              //fontSize:15
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
                                            customersController.lastLogin[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              //fontSize:15
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
                                            "\$${customersController.totalSpend[a]}",
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              //fontSize:15
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
                                            customersController.totalOrders[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              //fontSize:15
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
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color:
                                                customersController.status[a] ==
                                                        "Active"
                                                    ? notifier.ligreenColor
                                                    : notifier.liredColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              customersController.status[a],
                                              style: TextStyle(
                                                letterSpacing: 1,
                                                fontFamily: "Outfit",
                                                //fontSize:15
                                                color: customersController
                                                            .status[a] ==
                                                        "Active"
                                                    ? Color(0xFF30d47e)
                                                    : Color(0xFFeb6e4f),
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
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/eye.png",
                                                height: 16,
                                                color: Color(0xFF2a8ef6),
                                              ),
                                              SizedBox(width: 10),
                                              Image.asset(
                                                "assets/images/pen.png",
                                                height: 16,
                                                color: notifier.text,
                                              ),
                                              SizedBox(width: 10),
                                              Image.asset(
                                                "assets/images/trash.png",
                                                height: 16,
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
                        number1: "10",
                        number2: "20",
                        number3: "30",
                        numberofpages: "1 – 10 of 20",
                        backbutton: () {
                          if (button == true) {
                            setState(() {
                              button = !button;
                              customersController.ordersId.shuffle();
                              customersController.customerImages.shuffle();
                              customersController.customerName.shuffle();
                              customersController.email.shuffle();
                              customersController.phone.shuffle();
                              customersController.lastLogin.shuffle();
                              customersController.totalSpend.shuffle();
                              customersController.totalOrders.shuffle();
                              customersController.status.shuffle();
                            });
                            customersController
                                .setloadmore(customersController.selectpage);
                          }
                        },
                        nextbutton: () {
                          if (button == false) {
                            setState(() {
                              button = !button;
                              customersController.ordersId.shuffle();
                              customersController.customerImages.shuffle();
                              customersController.customerName.shuffle();
                              customersController.email.shuffle();
                              customersController.phone.shuffle();
                              customersController.lastLogin.shuffle();
                              customersController.totalSpend.shuffle();
                              customersController.totalOrders.shuffle();
                              customersController.status.shuffle();
                            });
                            customersController
                                .setloadmore(customersController.selectpage);
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
