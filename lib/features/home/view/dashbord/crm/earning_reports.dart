
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget earningReports(context) {
  final List<ChartData> getChartData = [
    ChartData('Jan', 440),
    ChartData('Feb', 505),
    ChartData('Mar', 414),
    ChartData('Apr', 671),
    ChartData('May', 227),
    ChartData('Jun', 413),
    ChartData('Jul', 201),
    ChartData('Aug', 352),
    ChartData('Sep', 752),
    ChartData('Oct', 320),
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Earning Reports",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: notifier.text,
                // color: const Color(0xFF475569),
              ),
            ),
            Popupbutton(
              title: "This Month",
              items: const [
                "This Day",
                "This Week",
                "This Month",
                "This Year",
              ],
            ),
          ],
        ),
        Expanded(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 800,
              interval: 200,
            ),
            series: [
              ColumnSeries<ChartData, String>(
                dataSource: getChartData,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.value,
                color: Color(0xFF6c86f4),
              ),
              LineSeries<ChartData, String>(
                dataSource: getChartData,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.value,
                color: Color(0xFF25d1e6),
                markerSettings: MarkerSettings(isVisible: false),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

class ChartData {
  ChartData(this.month, this.value);

  final String month;
  final double value;
}
