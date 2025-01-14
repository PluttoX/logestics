
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../Controllers/pages_controllers/e-commerce_controllers/your_order_controller.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';

class YourOrder extends StatefulWidget {
  const YourOrder({super.key});

  @override
  State<YourOrder> createState() => _YourOrderState();
}

class _YourOrderState extends State<YourOrder> {
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
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: width < 550
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Order",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                          ),
                          Text(
                            "Tracking ID #1004216609",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth / 2.2,
                            child: Text(
                              "Your Order",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: notifier.text,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxWidth / 2.2,
                            child: Text(
                              "Customer ID : 357951",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 16,
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
                      width: width < 1550 ? null : constraints.maxWidth,
                      child: Table(
                        border: TableBorder(
                          horizontalInside:
                              BorderSide(color: notifier.getfillborder),
                        ),
                        columnWidths: {
                          0: FixedColumnWidth(width < 600 ? 100 : 150),
                          1: FixedColumnWidth(width < 600 ? 200 : 240),
                          2: FixedColumnWidth(120),
                          3: FixedColumnWidth(width < 600 ? 150 : 198),
                          4: FixedColumnWidth(100),
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
                                    "Quantity",
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
                                                    : notifier.text,
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
                                    child: Container(
                                      height: 45,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: notifier.tablehader,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (yourOrderControllers
                                                        .quantity[a] >
                                                    1) {
                                                  yourOrderControllers
                                                      .quantity[a]--;
                                                }
                                              });
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.grey,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 40,
                                            child: Center(
                                              child: Text(
                                                "${yourOrderControllers.quantity[a]}",
                                                style: TextStyle(
                                                  fontFamily: "Outfit",
                                                  fontSize: 14,
                                                  color: notifier.text,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                yourOrderControllers
                                                    .quantity[a]++;
                                              });
                                            },
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.grey,
                                              size: 15,
                                            ),
                                          ),
                                        ],
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
              Divider(color: notifier.getfillborder),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: width < 600
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width,
                            child: TextField(
                              style: TextStyle(color: notifier.text),
                              textInputAction: TextInputAction.next,
                              cursorColor: Color(0xff0f79f3),
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                labelText: 'Coupon Code',
                                labelStyle: TextStyle(
                                  fontFamily: "Outfit",
                                  color: Colors.grey,
                                ),
                                hintText: "E.g. #ARP1217",
                                hintStyle: TextStyle(
                                  fontFamily: "Outfit",
                                  color: notifier.text,
                                ),
                                floatingLabelStyle: TextStyle(
                                  color: Color(0xff0165FC),
                                  fontFamily: "Outfit",
                                ),
                                filled: true,
                                fillColor: notifier.textFileColor,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: notifier.getfillborder,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0f79f3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            text: "Apply",
                            onPressed: () {},
                            bgcolor: Color(0xFF0f79f3),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          SizedBox(
                            width: width < 950 ? width / 3 : width / 5,
                            child: TextField(
                              style: TextStyle(color: notifier.text),
                              textInputAction: TextInputAction.next,
                              cursorColor: Color(0xff0f79f3),
                              onSubmitted: (value) {},
                              decoration: InputDecoration(
                                labelText: 'Coupon Code',
                                labelStyle: TextStyle(
                                  fontFamily: "Outfit",
                                  color: Colors.grey,
                                ),
                                hintText: "E.g. #ARP1217",
                                hintStyle: TextStyle(
                                  fontFamily: "Outfit",
                                  color: notifier.text,
                                ),
                                floatingLabelStyle: TextStyle(
                                  color: Color(0xff0165FC),
                                  fontFamily: "Outfit",
                                ),
                                filled: true,
                                fillColor: notifier.textFileColor,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: notifier.textFileColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff0f79f3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          CustomButton(
                            text: "Apply",
                            onPressed: () {},
                            bgcolor: Color(0xFF0f79f3),
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
