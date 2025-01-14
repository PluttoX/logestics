
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget averageEnrollmentRate(context) {
  final List<SalesData> salesDate = [
    SalesData('Jan', 3300, 1500),
    SalesData('Feb', 4900, 1700),
    SalesData('Mar', 4300, 1900),
    SalesData('Apr', 3700, 2200),
    SalesData('May', 5500, 3000),
    SalesData('Jun', 5900, 1000),
    SalesData('Jul', 4500, 1900),
    SalesData('Aug', 2400, 1200),
    SalesData('Sep', 1500, 1000),
    SalesData('Oct', 1000, 1500),
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
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Average Enrollment Rate",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: notifier.text,
              ),
            ),
            Popupbutton(
              title: "Year 2024",
              items: const [
                "Year 2024",
                "Year 2023",
                "Year 2022",
              ],
            ),
          ],
        ),
        Expanded(
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.top,
              textStyle: TextStyle(
                color: Colors.grey,
                fontFamily: "Outfit",
              ),
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: [
              LineSeries<SalesData, String>(
                name: 'On sale course',
                dataSource: salesDate,
                xValueMapper: (SalesData data, _) => data.month,
                yValueMapper: (SalesData data, _) => data.orders,
                enableTooltip: true,
              ),
              LineSeries<SalesData, String>(
                name: 'Regular paid course',
                dataSource: salesDate,
                xValueMapper: (SalesData data, _) => data.month,
                yValueMapper: (SalesData data, _) => data.sales,
                enableTooltip: true,
              ),
            ],
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              minimum: 0,
              interval: 5000,
              maximum: 15000,
            ),
          ),
        ),
      ],
    ),
  );
}

class SalesData {
  SalesData(this.month, this.orders, this.sales);

  final String month;
  final double orders;
  final double sales;
}
