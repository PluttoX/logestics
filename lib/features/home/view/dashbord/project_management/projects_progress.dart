
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';


late ColorNotifier notifier;

Widget projectsProgress(context) {
  List<Color> chartcolor = [
    const Color(0xFF00cae3),
    const Color(0xFF0e7aee),
    const Color(0xFF796df6),
  ];

  final List<_ChartData> data = [
    _ChartData('In Progress', 60),
    _ChartData('Not Started', 30),
    _ChartData('Completed', 10),
  ];

  List charttext = [
    "In Progress",
    "Not Started",
    "Completed",
  ];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);


  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Projects Progress",
          overflow: TextOverflow.ellipsis,
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
              position: LegendPosition.bottom,
              textStyle: TextStyle(
                color: Colors.grey,
                fontFamily: "Outfit",
                fontSize: 13,
              ),
            ),
            palette: chartcolor,
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
