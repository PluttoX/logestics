
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget firstResponseTime(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  final List<FlSpot> firstResponseTime = [
    FlSpot(0, 51),
    FlSpot(1, 65),
    FlSpot(2, 54),
    FlSpot(3, 56),
    FlSpot(4, 37),
    FlSpot(5, 53),
    FlSpot(6, 62),
    FlSpot(7, 24),
    FlSpot(8, 46),
    FlSpot(9, 39),
    FlSpot(10, 27),
    FlSpot(11, 38),
    FlSpot(12, 61),
    FlSpot(13, 45),
    FlSpot(14, 27),
    FlSpot(15, 54),
    FlSpot(16, 93),
    FlSpot(17, 41),
    FlSpot(18, 31),
  ];

  return Container(
    width: width,
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "First Response Time",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                  ),
                ),
              ),
              Popupbutton(
                title: "Last 30 days",
                items: const [
                  "Last 30 days",
                  "Last 15 days",
                  "Last 7 days",
                  "Last Day",
                ],
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: '1 ',
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              color: notifier.text,
            ),
            children:const <TextSpan>[
              TextSpan(
                text: 'hrs ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: ': 22',
              ),
              TextSpan(
                text: ' min ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
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
                  spots: firstResponseTime,
                  color: Color(0xFFffb264),
                  belowBarData: BarAreaData(
                    show: true,
                    color: notifier.liyellowColor,
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
