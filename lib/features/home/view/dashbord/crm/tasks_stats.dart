
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget tasksStats(context) {
  final List<ChartData1> chartData1 = [
    ChartData1("Jan", 35),
    ChartData1("Feb", 41),
    ChartData1("Mar", 62),
    ChartData1("Apr", 42),
    ChartData1("May", 13),
    ChartData1("Jun", 18),
    ChartData1("Jul", 29),
    ChartData1("Aug", 37),
    ChartData1("Sep", 36),
    ChartData1("Oct", 51),
    ChartData1("Now", 32),
    ChartData1("Dec", 53),
  ];

  final List<ChartData2> chartData2 = [
    ChartData2("Jan", 45),
    ChartData2("Feb", 52),
    ChartData2("Mar", 38),
    ChartData2("Apr", 24),
    ChartData2("May", 33),
    ChartData2("Jun", 26),
    ChartData2("Jul", 21),
    ChartData2("Aug", 20),
    ChartData2("Sep", 6),
    ChartData2("Oct", 8),
    ChartData2("Now", 15),
    ChartData2("Dec", 10),
  ];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return Container(
    width: width / 2.1,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Color(0xFF5f51de),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Tasks Stats",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Popupbutton(
              title: "Year 2024",
              textColor: Colors.white,
              items: [
                "Year 2024",
                "Year 2023",
                "Year 2024",
              ],
            ),
          ],
        ),
        Expanded(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              labelStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'outfit',
              ),
            ),
            primaryYAxis: CategoryAxis(
              labelStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'outfit',
              ),
            ),
            series: <CartesianSeries>[
              LineSeries<ChartData1, String>(
                dataSource: chartData1,
                dashArray: const [5, 5],
                color: Colors.amber,
                xValueMapper: (ChartData1 data, _) => data.x,
                yValueMapper: (ChartData1 data, _) => data.y,
              ),
              LineSeries<ChartData2, String>(
                dataSource: chartData2,
                color: Color(0xFF12b8e4),
                xValueMapper: (ChartData2 data, _) => data.x,
                yValueMapper: (ChartData2 data, _) => data.y,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class ChartData1 {
  ChartData1(this.x, this.y);

  final String x;
  final double y;
}

class ChartData2 {
  ChartData2(this.x, this.y);

  final String x;
  final double y;
}
