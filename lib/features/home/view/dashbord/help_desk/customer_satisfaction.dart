
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget customerSatisfaction(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  final List<ChartData> chartData = [
    ChartData('Highly Satisfied', 20, '55%%'),
    ChartData('Satisfied', 21, '45%'),
    ChartData('Unsatisfied', 19, '35%'),
  ];

  final List<Color> chartcolor = [
    Color(0xFF00cae3),
    Color(0xFF0f79f3),
    Color(0xFF796df6),
  ];

  return Container(
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Customer Satisfaction",
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
              title: "This Week",
              items:const [
                "This Day",
                "This Week",
                "This Month",
                "This Year",
              ],
            ),

          ],
        ),
        Expanded(
          child: SfCircularChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(
                color: Colors.grey,
                fontFamily: "Outfit",
              ),
            ),
            palette: chartcolor,
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointRadiusMapper: (ChartData data, _) => data.size,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class ChartData {
  ChartData(this.x, this.y, this.size);

  final String x;
  final double y;
  final String size;
}
