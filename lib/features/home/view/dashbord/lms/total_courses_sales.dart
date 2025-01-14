
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget totalCoursesSales(context) {
  final List<FlSpot> totalCoursesSales = [
    FlSpot(0, 8200),
    FlSpot(1, 8000),
    FlSpot(2, 8100),
    FlSpot(3, 8400),
    FlSpot(4, 8000),
    FlSpot(5, 8423),
    FlSpot(6, 8423),
    FlSpot(7, 8300),
    FlSpot(8, 8481),
    FlSpot(9, 8487),
    FlSpot(10, 8506),
    FlSpot(11, 8626),
    FlSpot(12, 8668),
    FlSpot(13, 8602),
    FlSpot(14, 8607),
    FlSpot(15, 8512),
    FlSpot(16, 8496),
    FlSpot(17, 8600),
    FlSpot(18, 8881),
    FlSpot(19, 8500),
  ];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return LayoutBuilder(
    builder: (context, constraints) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: notifier.getBgColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Courses Sales",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      Popupbutton(
                        title: "This Month",
                        items: const [
                          "This Day",
                          "This Week",
                          "This Month",
                          "This Year",
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "84,127",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 24,
                      color: notifier.text,
                    ),
                  ),
                  Container(
                    width: 80,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: notifier.ligreenColor,
                      border: Border.all(
                        color: Color(0xFF35d582),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/trend-up.png",
                            color: Color(0xFF35d582),
                          ),
                          Text(
                            " 3.21%",
                            style: TextStyle(
                              color: Color(0xFF35d582),
                              fontFamily: "Outfit",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: false,
                  ),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: totalCoursesSales,
                      color: Color(0xFF8175f6),
                      belowBarData: BarAreaData(
                        show: true,
                        color:notifier.isDark?Color(0xFF464872): Color(0xFFdedbfd),
                      ),
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
