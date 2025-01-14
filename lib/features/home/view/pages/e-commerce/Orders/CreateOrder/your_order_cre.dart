
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  
  late ColorNotifier notifier;
  
  @override
  Widget build(BuildContext context) {
    MainDrawerController mainDrawerController = Get.put(MainDrawerController());

    notifier= Provider.of(context,listen: true);
    
    List description = [
      "Grand Total",
      "Discount",
      "Tax",
      "Subtotal",
      "Shipping Charge",
      "Coupon Charge",
      "Total",
    ];

    List price = [
      "1,105.00",
      "105.00",
      "75.00",
      "1,000.00",
      "80.00",
      "20.00",
      "900.00",
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Text(
              "YourOrder",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: notifier.text,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ordered items",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: "Outfit",
                    fontSize: 16,
                    color: notifier.text,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                InkWell(
                  onTap: () {
                    mainDrawerController.updateSelectedIndex(25);
                  },
                  child: Text(
                    "Edit Card",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontFamily: "Outfit",
                      fontSize: 16,
                      color: Color(0xFF0f7bf4),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 40,
            decoration: BoxDecoration(color: notifier.tablehader),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                  ),
                ),
                Text(
                  "Price",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                  ),
                ),
              ],
            ),
          ),
          ListView.separated(
            itemCount: description.length,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${description[index]} :",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        fontFamily: "Outfit",
                        fontSize: 14,
                        color: index == 3 || index == 6
                            ? notifier.text
                            : Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "\$0.00",
                      textAlign: TextAlign.center,
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
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: StyledDivider(
                  color: notifier.getfillborder,
                  lineStyle: DividerLineStyle.dashed,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}