
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget salesOverview(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      color: const Color(0xFF796df6),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Sales Overview",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            letterSpacing: 1,
            fontFamily: "Outfit",
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Sales",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        letterSpacing: 1,
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "8,764",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        letterSpacing: 1,
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Monthly Sales",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: "Outfit",
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "4,328",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: "Outfit",
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Sales",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: "Outfit",
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "357",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    color: Colors.white,
                    letterSpacing: 1,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ProgressBar(
            value: 0.7,
            width: width,
            color: Colors.white,
            height: 3,
            backgroundColor: Colors.black26,
          ),
        ),
        Text(
          "20% increase in last month",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: "Outfit",
            letterSpacing: 1,
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget averageDailySales(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return GetBuilder<MainDrawerController>(
    initState: (state) {
      data = [
        _ChartData('Jan', 21),
        _ChartData('Feb', 22),
        _ChartData('Mar', 10),
        _ChartData('Apr', 28),
        _ChartData('May', 16),
        _ChartData('Jun', 21),
        _ChartData('Jul', 30),
      ];
      tooltip = TooltipBehavior(enable: true);
    },
    builder: (inboxController) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Average Daily Sales",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    color: notifier.text,
                    // color: Color(0xFF475569),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: notifier.ligreenColor,
                    border: Border.all(
                      color: Colors.green,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/trend-up.png",
                          color: Colors.green,
                        ),
                        const Text(
                          " 5.25%",
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: "Outfit",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: SfCartesianChart(
                  title: ChartTitle(
                    text: "\$5K+",
                    alignment: ChartAlignment.near,
                    textStyle: TextStyle(
                      fontFamily: "Outfit",
                      color: notifier.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis: const NumericAxis(
                    minimum: 0,
                    maximum: 30,
                    interval: 5,
                  ),
                  tooltipBehavior: tooltip,
                  series: <CartesianSeries<_ChartData, String>>[
                    ColumnSeries<_ChartData, String>(
                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: "Month",
                      color: const Color(0xFF25d1e7),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget newCustomersThisMonth(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: height / 4,
                  child: Text(
                    "New Customers This Month",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontFamily: "Outfit",
                      fontSize: 20,
                      color: notifier.text,
                      // color: Color(0xFF475569),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: notifier.ligreenColor,
                    border: Border.all(
                      color: Colors.green,
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/trend-up.png",
                          color: Colors.green,
                        ),
                        const Text(
                          " 2.75%",
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: "Outfit",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "2,537",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                color: notifier.text,
                // color: Color(0xFF475569),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Join Today",
              style: TextStyle(
                letterSpacing: 1,
                fontFamily: "Outfit",
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: height / 60),
            SizedBox(
              width: width / 2,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/avatar-8 1.png",
                      // height: width < 650 ? 40 : 50,
                      height: height / 20,
                    ),
                  ),
                  Positioned(
                    left: 25,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar-7 1.png",
                        height: height / 20,
                        // height: width < 650 ? 40 : 50,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 45,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar-6 1.png",
                        height: height / 20,
                        // height: width < 650 ? 40 : 50,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 65,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar-8 1.png",
                        // height: width < 650 ? 40 : 50,
                        height: height / 20,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 85,
                    child: Container(
                      height: height / 20,
                      width: height / 20,
                      // height: width < 650 ? 40 : 50,
                      // width: width < 650 ? 40 : 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0f79f3),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          "27",
                          style: TextStyle(
                            fontFamily: "Outfit",
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

late List<_ChartData> data;
late TooltipBehavior tooltip;

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
