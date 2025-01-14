
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';
import 'time_line.dart';

class OrderTrackingInformation extends StatefulWidget {
  const OrderTrackingInformation({super.key});

  @override
  State<OrderTrackingInformation> createState() =>
      _OrderTrackingInformationState();
}

class _OrderTrackingInformationState extends State<OrderTrackingInformation> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  List viewDetailsTime = [
    "22 Mar, 2024 - 11:35AM",
    "23 Mar, 2024 - 10:35AM",
    "24 Mar, 2024 - 3:45PM",
    "25 Mar, 2024 - 2:21PM",
  ];

  List viewDetailsTime1 = [
    "22 Mar, 2024 \n 11:35AM",
    "23 Mar, 2024 \n 10:35AM",
    "24 Mar, 2024 \n 3:45PM",
    "25 Mar, 2024 \n 2:21PM",
  ];

  List viewDetails = [
    "Your order is now on warehouse. It's being ready for shipped.",
    "Your order is on the way for deliver.",
    "Your order shipped.",
    "Your order delivered.",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

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
              width < 550
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order ID #2435679",
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
                            "Order ID #2435679",
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
                            "Tracking ID #1004216609",
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
              SizedBox(height: 15),
              Text(
                "IBAN: EST6049283742809",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 16,
                  color: Color(0xFF949ba3),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Date: 26th Mar, 2024",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 16,
                  color: Color(0xFF949ba3),
                ),
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(),
                height: width < 800 ? 500 : 120,
                child: width < 800
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TimeLine(
                            number: "01",
                            title: "Order Placed",
                            description: "22 Mar, 2024 - 11:35AM",
                            isActive: false,
                          ),
                          TimeLine(
                            number: "02",
                            title: "Packed",
                            description: "23 Mar, 2024 - 10:35AM",
                            isActive: false,
                          ),
                          TimeLine(
                            number: "03",
                            title: "Shipped",
                            description: "24 Mar, 2024 - 3:45PM",
                            isActive: false,
                          ),
                          TimeLine(
                            number: "04",
                            title: "Delivered",
                            description: "25 Mar, 2024 - 2:21PM",
                            isActive: true,
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          TimeLine(
                            number: "01",
                            title: "Order Placed",
                            description: "22 Mar, 2024 - 11:35AM",
                            isActive: false,
                          ),
                          TimeLine(
                            number: "02",
                            title: "Packed",
                            description: "23 Mar, 2024 - 10:35AM",
                            isActive: false,
                          ),
                          TimeLine(
                            number: "03",
                            title: "Shipped",
                            description: "24 Mar, 2024 - 3:45PM",
                            isActive: false,
                          ),
                          TimeLine(
                            number: "04",
                            title: "Delivered",
                            description: "25 Mar, 2024 - 2:21PM",
                            isActive: true,
                          ),
                        ],
                      ),
              ),
              SizedBox(height: 40),
              Text(
                "View Details : ",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              ListView.separated(
                itemCount: viewDetails.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        width < 450
                            ? "${viewDetailsTime1[index]} : "
                            : "${viewDetailsTime[index]} : ",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Color(0xFF949ba3),
                        ),
                      ),
                      SizedBox(
                        width: width < 430
                            ? constraints.maxWidth / 1.8
                            : width < 950
                                ? constraints.maxWidth / 2
                                : constraints.maxWidth / 1.5,
                        child: Text(
                          viewDetails[index],
                          // overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color: notifier.text,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
