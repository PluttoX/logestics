
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget aveResolutionTime(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  final List<FlSpot> aveResolutionTime = [
    FlSpot(0, 41),
    FlSpot(1, 31),
    FlSpot(2, 35),
    FlSpot(3, 61),
    FlSpot(4, 46),
    FlSpot(5, 27),
    FlSpot(6, 47),
    FlSpot(7, 45),
    FlSpot(8, 42),
    FlSpot(9, 24),
    FlSpot(10, 45),
    FlSpot(11, 55),
    FlSpot(12, 27),
    FlSpot(13, 39),
    FlSpot(14, 35),
    FlSpot(15, 56),
    FlSpot(16, 62),
    FlSpot(17, 53),
    FlSpot(18, 52),
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
                  "Ave Resolution Time",
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
            text: '10 ',
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              color: notifier.text,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: 'hrs ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: ': 30',
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
                  spots: aveResolutionTime,
                  color: Color(0xFF796df6),
                  belowBarData: BarAreaData(
                    show: true,
                    color: notifier.lipurpleColor,
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
