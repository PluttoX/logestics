
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/pages/e-commerce/Orders/Order_Details/recent_orders.dart';
import 'package:logestics/features/home/view/pages/e-commerce/Orders/Order_Details/tracking_id.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../cart/order_summary.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context,listen: true);
    
    if (width < 980) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: width < 650 ? 55 : 40,
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order Details",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => mainDrawerController.updateSelectedIndex(0),
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
                        "Orders",
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
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Order Details",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 15,
                      color: notifier.text,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: width < 550 ? 250 : 160,
              width: width,
              child: TrackingId(),
            ),
            SizedBox(height: 20),
            SizedBox(height: 460, child: RecentOrders()),
            SizedBox(height: 20),
            OrderSummary(showPaymentMethod: true),
            SizedBox(height: 20),
            width < 680
                ? Column(
                    children: [
                      detailsContainer(
                        "Billing Details",
                        ["Name", "Email", "Phone", "Address"],
                        [
                          "Gary Fraser",
                          "example@unity.com",
                          "+1 444 333 5566",
                          "715 Maple St, Hamletville, England",
                        ],
                      ),
                      SizedBox(height: 20),
                      detailsContainer(
                        "Shipping Details",
                        ["Shipping Date", "Email", "Phone", "Address"],
                        [
                          "Nov 25, 2024 10:30 AM",
                          "example@unity.com",
                          "+1 444 333 5566",
                          "789 Pine St, Villageton, England",
                        ],
                      ),
                      SizedBox(height: 20),
                      detailsContainer(
                        "Delivery Informatin",
                        ["XYZ Delivery", "Order ID", "Payment Method", "Email"],
                        ["", "XXXXXX1004", "Master Card", "example@unity.com"],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: detailsContainer(
                              "Billing Details",
                              ["Name", "Email", "Phone", "Address"],
                              [
                                "Gary Fraser",
                                "example@unity.com",
                                "+1 444 333 5566",
                                "715 Maple St, Hamletville, England",
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: detailsContainer(
                              "Shipping Details",
                              ["Shipping Date", "Email", "Phone", "Address"],
                              [
                                "Nov 25, 2024 10:30 AM",
                                "example@unity.com",
                                "+1 444 333 5566",
                                "789 Pine St, Villageton, England",
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: detailsContainer(
                              "Delivery Informatin",
                              [
                                "XYZ Delivery",
                                "Order ID",
                                "Payment Method",
                                "Email"
                              ],
                              [
                                "",
                                "XXXXXX1004",
                                "Master Card",
                                "example@unity.com"
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(child: Container()),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Details",
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
                        onTap: () => mainDrawerController.updateSelectedIndex(0),
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
                        "Orders",
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
                        "Order Details",
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
            SizedBox(
              height: 600,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width < 1300 ? width / 1.7 : width / 2 + 40,
                    decoration: BoxDecoration(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 160,
                          width: width,
                          child: TrackingId(),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: RecentOrders(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 550,
                      decoration: BoxDecoration(),
                      child: OrderSummary(showPaymentMethod: true),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(),
              height: 180,
              child: Row(
                children: [
                  Expanded(
                    child: detailsContainer(
                      "Billing Details",
                      ["Name", "Email", "Phone", "Address"],
                      [
                        "Gary Fraser",
                        "example@unity.com",
                        "+1 444 333 5566",
                        "715 Maple St, Hamletville, England",
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: detailsContainer(
                    "Shipping Details",
                    ["Shipping Date", "Email", "Phone", "Address"],
                    [
                      "Nov 25, 2024 10:30 AM",
                      "example@unity.com",
                      "+1 444 333 5566",
                      "789 Pine St, Villageton, England",
                    ],
                  )),
                  SizedBox(width: 20),
                  Expanded(
                    child: detailsContainer(
                      "Delivery Informatin",
                      ["XYZ Delivery", "Order ID", "Payment Method", "Email"],
                      ["", "XXXXXX1004", "Master Card", "example@unity.com"],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget detailsContainer(String title, List key, List value) {
    notifier = Provider.of(context,listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              ListView.separated(
                itemCount: key.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(
                        value[index] == "" ? key[index] : "${key[index]} : ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 16,
                          color: notifier.text,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: index != 3
                            ? constraints.maxWidth / 2.3
                            : constraints.maxWidth / 1.5,
                        child: Text(
                          value[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 9);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
