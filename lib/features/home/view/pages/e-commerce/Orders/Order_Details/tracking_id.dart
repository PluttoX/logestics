import 'package:flutter/material.dart';

class TrackingId extends StatefulWidget {
  const TrackingId({super.key});

  @override
  State<TrackingId> createState() => _TrackingIdState();
}

class _TrackingIdState extends State<TrackingId> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: Color(0xFF6456e2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tracking ID: 000346798254",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              fontFamily: "Outfit",
            ),
          ),
          SizedBox(
            child: width < 550
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          trackingIdContainer("01"),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          trackingIdContainer("02"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          trackingIdName(
                              context, "Order Placed", TextAlign.start),
                          trackingIdName(context, "Packed", TextAlign.end),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          trackingIdContainer("03"),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          trackingIdContainer("04"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          trackingIdName(context, "Shipped", TextAlign.start),
                          trackingIdName(context, "Delivered", TextAlign.end),
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          trackingIdContainer("01"),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          trackingIdContainer("02"),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          trackingIdContainer("03"),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                          trackingIdContainer("04"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          trackingIdName(
                              context, "Order Placed", TextAlign.start),
                          SizedBox(width: width < 950 ? 20 : 8),
                          trackingIdName(context, "Packed", TextAlign.center),
                          SizedBox(width: 70),
                          trackingIdName(context, "Shipped", TextAlign.center),
                          SizedBox(width: 50),
                          trackingIdName(context, "Delivered", TextAlign.end),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

Widget trackingIdContainer(String number) {
  bool isHover = false;
  return StatefulBuilder(
    builder: (context, setState) {
      return InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: isHover == true ? Color(0xFF00cae3) : Color(0xFF978bff),
            border: Border.all(
              color: Colors.white,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Outfit",
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget trackingIdName(context, String name, TextAlign alignment) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  return SizedBox(
    width: width < 550
        ? null
        : width < 950
            ? width / 9
            : width / 14,
    child: Text(
      name,
      overflow: TextOverflow.ellipsis,
      textAlign: alignment,
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        letterSpacing: 1,
        fontWeight: FontWeight.w500,
        fontFamily: "Outfit",
      ),
    ),
  );
}


        // SizedBox(height: 15),
        // Text(
        //   name,
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 15,
        //     letterSpacing: 1,
        //     fontWeight: FontWeight.w500,
        //     fontFamily: "Outfit",
        //   ),
        // ),
