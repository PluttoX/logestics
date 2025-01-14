
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget timeSpending(context) {
  List<_ChartData> data = [
    _ChartData('Team A', 65),
    _ChartData('Team B', 55),
    _ChartData('Team C', 45),
    _ChartData('Team D', 35),
    _ChartData('Team E', 25),
    _ChartData('Team G', 15),
    _ChartData('Team F', 5),
  ];

  List<Color> chartColors = [
    Color(0xFF796df6),
    Color(0xFF8d83f7),
    Color(0xFFa199f9),
    Color(0xFFb5affa),
    Color(0xFFc9c5fb),
    Color(0xFFdddbfd),
    Color(0xFFf2f0fe),
  ];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: 10,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: notifier.getBgColor,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time Spending's",
          style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: notifier.text),
        ),
        Expanded(
          child: SfCircularChart(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Weekly report",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: "Outfit",
              ),
            ),
            Container(
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
                      " 35.5%",
                      style: TextStyle(
                        color: Color(0xFF35d582),
                        fontFamily: "Outfit",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
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
