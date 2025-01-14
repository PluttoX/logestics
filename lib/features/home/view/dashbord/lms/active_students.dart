
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget activeStudents(context) {
  final List<_ChartData> data = [
    _ChartData('Jan', 23, 44, 30),
    _ChartData('Feb', 11, 55, 25),
    _ChartData('Mar', 22, 41, 36),
    _ChartData('Apr', 27, 65, 30),
    _ChartData('May', 13, 22, 45),
    _ChartData('Jun', 22, 43, 35),
    _ChartData('Jul', 37, 21, 65),
    _ChartData('Aug', 21, 41, 52),
    _ChartData('Sep', 44, 56, 59),
    _ChartData('Oct', 22, 27, 36),
    _ChartData('Nov', 30, 43, 39),
  ];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

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
          'Active Students',
          style: TextStyle(
            fontFamily: "Outfit",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: notifier.text,
          ),
        ),
        SizedBox(height: 10),
        width < 550
            ? Column(
                children: [
                  _buildSummary(
                    context,
                    'Monthly',
                    '2,323',
                    '5.34%',
                    Colors.green,
                    notifier.ligreenColor,
                    "assets/images/trend-up.png",
                  ),
                  _buildSummary(
                    context,
                    'Weekly',
                    '543',
                    '1.34%',
                    Colors.red,
                    notifier.liredColor,
                    "assets/images/trend-down.png",
                  ),
                  _buildSummary(
                    context,
                    'Daily',
                    '654',
                    '3.43%',
                    Colors.green,
                    notifier.ligreenColor,
                    "assets/images/trend-up.png",
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummary(
                    context,
                    'Monthly',
                    '2,323',
                    '5.34%',
                    Colors.green,
                    notifier.ligreenColor,
                    "assets/images/trend-up.png",
                  ),
                  _buildSummary(
                    context,
                    'Weekly',
                    '543',
                    '1.34%',
                    Colors.red,
                    notifier.liredColor,
                    "assets/images/trend-down.png",
                  ),
                  _buildSummary(
                    context,
                    'Daily',
                    '654',
                    '3.43%',
                    Colors.green,
                    notifier.ligreenColor,
                    "assets/images/trend-up.png",
                  ),
                ],
              ),
        SizedBox(height: 20),
        Expanded(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 70,
              interval: 10,
            ),
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(
                color: Colors.grey,
                fontFamily: "Outfit",
              ),
            ),
            series: [
              SplineAreaSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.month,
                yValueMapper: (_ChartData data, _) => data.weekly,
                name: 'Weekly',
                borderColor:
                    notifier.isDark ? Color(0xFF4F5560) : Color(0xFFd2d2e4),
                color: notifier.isDark ? Color(0xFF494F5B) : Color(0xFFf4f4f8),
              ),
              SplineSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.month,
                yValueMapper: (_ChartData data, _) => data.daily,
                name: 'Daily',
                color: Color(0xFF796df6),
              ),
              ColumnSeries<_ChartData, String>(
                dataSource: data,
                xValueMapper: (_ChartData data, _) => data.month,
                yValueMapper: (_ChartData data, _) => data.monthly,
                name: 'Monthly',
                color: Color(0xFF24d0e6),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildSummary(
  context,
  String title,
  String value,
  String change,
  Color color,
  Color bgColor,
  String image,
) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontFamily: "Outfit",
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: "Outfit",
              color: notifier.text,
            ),
          ),
        ],
      ),
      SizedBox(width: 10),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: color,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Image.asset(image, color: color),
              Text(
                " $change",
                style: TextStyle(
                  color: color,
                  fontSize: 15,
                  fontFamily: "Outfit",
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

class _ChartData {
  _ChartData(this.month, this.monthly, this.weekly, this.daily);

  final String month;
  final double monthly;
  final double weekly;
  final double daily;
}
