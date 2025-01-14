
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget ticketsbyType(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier= Provider.of(context,listen: true);
  
  List<_ChartData> data = [
    _ChartData('Technical Issue', 40),
    _ChartData('Product Support', 30),
    _ChartData('General Inquiry', 20),
    _ChartData('Billing Inquiry', 10),
  ];

  List<Color> chartColors = [
    Color(0xFF00cae3),
    Color(0xFF0e7aee),
    Color(0xFF796df6),
    Color(0xFFee6666),
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
            palette: chartColors,
            series: <CircularSeries>[
              DoughnutSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.task,
                yValueMapper: (_ChartData data, _) => data.timeSpent,
                innerRadius: '70%',
                dataLabelSettings: DataLabelSettings(),
                explode: true,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _ChartData {
  _ChartData(this.task, this.timeSpent);
  final String task;
  final double timeSpent;
}
