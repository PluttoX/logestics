
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget clientPaymentStatus(context) {
  final List<ChartData> chartData = [
    ChartData('Paid', 20, '55%%'),
    ChartData('Pending', 21, '45%'),
    ChartData('Overdue', 19, '35%'),
  ];

  final List<Color> chartcolor = [
    Color(0xFF0f79f3),
    Color(0xFF00cae3),
    Color(0xFFffb264),
  ];

  List clientpaymentstatus = ["Paid", "Pending", "Overdue"];

  notifier = Provider.of(context, listen: true);

  return Container(
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Client Payment Status",
          style: TextStyle(
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: notifier.text,
            // color: Color(0xFF475569),
          ),
        ),
        Expanded(
          child: SfCircularChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.left,
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
