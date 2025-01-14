
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget ticketsbyChannel(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier=Provider.of(context,listen: true);
  
  final List<ChartData> chartData = [
    ChartData('Email', 25, '65%%'),
    ChartData('App', 25, '50%'),
    ChartData('web', 25, '40%'),
    ChartData('Chat', 25, '30%'),
  ];

  final List<Color> chartcolor = [
    Color(0xFF00cae3),
    Color(0xFF0f79f3),
    Color(0xFF796df6),
    Color(0xFFffb264),
  ];

  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tickets by Channel",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color:  notifier.text,
          ),
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
