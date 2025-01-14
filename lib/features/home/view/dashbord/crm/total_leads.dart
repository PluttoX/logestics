
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget totalLeads(context) {
  final List<FlSpot> totalleads = [
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

  return Container(
    width: width / 2,
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Leads",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  color: notifier.text,
                  // color: Color(0xFF475569),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
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
                        " 75%",
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
        ),
        SizedBox(height: height / 50),
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
                  spots: totalleads,
                  isCurved: true,
                  color:
                      notifier.isDark ? Color(0xFF396D79) : Color(0xFF00cae3),
                  belowBarData: BarAreaData(
                    show: true,
                    color:
                        notifier.isDark ? Color(0xFF2D5A67) : Color(0xFFc7f4f9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
