
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

List<String>? _splineList;
late String _selectedSplineType;
SplineType? _spline;
TooltipBehavior? _tooltipBehavior;

late ColorNotifier notifier;

Widget totalSales(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

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
  // return LayoutBuilder(
  //   builder: (context, constraints) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      // color: Colors.white,

      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Sales",
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
              title: "Year 2024",
              items: const [
                "Year 2024",
                "Year 2023",
                "Year 2022",
              ],
            ),
          ],
        ),
        width < 650 ? Container() : SizedBox(height: height / 50),
        Expanded(
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.top,
              textStyle: TextStyle(
                // color: Colors.grey,
                color: notifier.text,
                fontFamily: "Outfit",
              ),
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: [
              LineSeries<SalesData, String>(
                name: 'Orders',
                dataSource: salesDate,
                xValueMapper: (SalesData data, _) => data.month,
                yValueMapper: (SalesData data, _) => data.orders,
                enableTooltip: true,
              ),
              LineSeries<SalesData, String>(
                name: 'Sales',
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
  //   },
  // );
}

class SalesData {
  SalesData(this.month, this.orders, this.sales);

  final String month;
  final double orders;
  final double sales;
}

Widget profit(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  notifier = Provider.of(context, listen: true);

  return GetBuilder<MainDrawerController>(
    initState: (state) {
      _selectedSplineType = 'natural';
      _spline = SplineType.natural;
      _splineList =
          <String>['natural', 'monotonic', 'cardinal', 'clamped'].toList();
      _tooltipBehavior =
          TooltipBehavior(enable: true, header: '', canShowMarker: false);
    },
    builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: width / 70,
          vertical: height / 50,
        ),
        decoration: BoxDecoration(
          // color: Colors.white,
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profit",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit", color: notifier.text,
                    // color: const Color(0xFF475569),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Popupbutton(
                  title: "Last Month",
                  items: const [
                    "Last Day",
                    "Last Week",
                    "Last Month",
                    "Last Year",
                  ],
                ),
              ],
            ),
            Expanded(child: _buildTypesSplineChart()),
          ],
        ),
      );
    },
  );
}

Widget bestSellerOfTheMonth(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      color: notifier.isDark ? Color(0xFF363F49) : const Color(0xFFddddef),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best Seller Of The Month",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    color: notifier.text,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Michael Marquez!",
                  style: TextStyle(
                    letterSpacing: 1,
                    fontFamily: "Outfit",
                    fontSize: 18,
                    color: notifier.text,
                    // color: const Color(0xFF796df6),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height / 70),
                RichText(
                  text: TextSpan(
                    text: '\$3.5K',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontFamily: "Outfit",
                      fontSize: 18,
                      color: notifier.text,
                      // color: const Color(0xFF475569),
                      fontWeight: FontWeight.w600,
                    ),
                    children: const [
                      TextSpan(
                        text: '(Sales)',
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              "Details View",
              style: TextStyle(
                fontFamily: "Outfit",
                letterSpacing: 1,
                decorationColor: notifier.text,
                decoration: TextDecoration.underline,
                // decorationColor: const Color(0xFF475569),
                fontSize: 15,
                color: notifier.text,
                // color: const Color(0xFF475569),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Positioned(
          right: 0,
          bottom: -10,
          child: Image.asset(
            "assets/images/man.png",
            height: height / 5,
          ),
        ),
      ],
    ),
  );
}

SfCartesianChart _buildTypesSplineChart() {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: const ChartTitle(
      alignment: ChartAlignment.near,
      text: '\$359K',
      textStyle: TextStyle(
        fontFamily: "Outfit",
        color:  Color(0xFF475569),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    primaryXAxis: NumericAxis(isVisible: false),
    primaryYAxis: NumericAxis(isVisible: false),
    series: _getSplineTypesSeries(),
    tooltipBehavior: _tooltipBehavior,
  );
}

List<SplineSeries<_ChartData, num>> _getSplineTypesSeries() {
  return <SplineSeries<_ChartData, num>>[
    SplineSeries<_ChartData, num>(
      color: const Color(0xFF796df6),
      splineType: _spline!,
      dataSource: <_ChartData>[
        _ChartData(2010, -0.1),
        _ChartData(2011, 0.01),
        _ChartData(2012, 0.04),
        _ChartData(2013, -0.08),
        _ChartData(2013.25, -0.02),
        _ChartData(2014.25, 0.02),
        _ChartData(2014.50, 0.04),
        _ChartData(2014.75, -0.02),
        _ChartData(2015.25, 0.10),
        _ChartData(2015.75, 0.11),
        _ChartData(2016, 0.12),
        _ChartData(2017, 0.15),
        _ChartData(2018, 0.17),
        _ChartData(2019, 0.10),
        _ChartData(2020, 0.20),
        _ChartData(2021, 0.25),
      ],
      xValueMapper: (_ChartData sales, _) => sales.x,
      yValueMapper: (_ChartData sales, _) => sales.y,
    )
  ];
}

class _ChartData {
  _ChartData(this.x, this.y);

  final double x;
  final double y;
}

LineChartData get lineChartData => LineChartData(
      lineTouchData: lineTouchData,
      gridData: FlGridData(show: false),
      titlesData: titlesData,
      borderData: borderData,
      lineBarsData: lineBarsData,
      minX: 0,
      maxX: 26,
      minY: 0,
      maxY: 4,
    );

LineTouchData get lineTouchData => LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
        getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
      ),
    );

FlTitlesData get titlesData => FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: bottomTitles,
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: leftTitles(),
      ),
    );

List<LineChartBarData> get lineBarsData => [
      lineChartBarData_1,
      lineChartBarData_2,
    ];

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Color(0xFF475569),
    fontFamily: "Outfit",
  );
  Widget text;

  switch (value.toInt()) {
    case 0:
      text = const Text('Jan', style: style);
      break;
    case 2:
      text = const Text('Feb', style: style);
      break;
    case 5:
      text = const Text('Mar', style: style);
      break;
    case 8:
      text = const Text('Apr', style: style);
      break;
    case 11:
      text = const Text('May', style: style);
      break;
    case 14:
      text = const Text('Jun', style: style);
      break;
    case 17:
      text = const Text('Jul', style: style);
      break;
    case 20:
      text = const Text('Aug', style: style);
      break;
    case 23:
      text = const Text('Sep', style: style);
      break;
    case 26:
      text = const Text('Oct', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      reservedSize: 32,
      interval: 1,
      getTitlesWidget: bottomTitleWidgets,
    );

FlBorderData get borderData => FlBorderData(
      show: true,
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 4),
      ),
    );

SideTitles leftTitles() => SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      interval: 1,
      reservedSize: 40,
    );

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 13,
    color: Color(0xFF475569),
    fontFamily: "Outfit",
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '0';
      break;
    case 2:
      text = '5000';
      break;
    case 3:
      text = '10000';
      break;
    case 4:
      text = '15000';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.center);
}

LineChartBarData get lineChartBarData_1 => LineChartBarData(
      isCurved: true,
      color: Color(0xFF796df6),
      barWidth: 8,
      isStrokeCapRound: true,
      spots: const [
        FlSpot(0, 1),
        FlSpot(2, 1),
        FlSpot(5, 1),
        FlSpot(8, 1.6),
        FlSpot(11, 1),
        FlSpot(14, 0.9),
        FlSpot(17, 1),
        FlSpot(20, 1.4),
        FlSpot(23, 1),
        FlSpot(26, 0.9),
      ],
    );

LineChartBarData get lineChartBarData_2 => LineChartBarData(
      isCurved: true,
      color: Color(0xFF1dcfe6),
      barWidth: 8,
      spots: const [
        FlSpot(0, 1.5),
        FlSpot(2, 1.9),
        FlSpot(5, 1.6),
        FlSpot(8, 2),
        FlSpot(11, 2.5),
        FlSpot(14, 2.5),
        FlSpot(17, 2),
        FlSpot(20, 1.9),
        FlSpot(23, 1.8),
        FlSpot(26, 2),
      ],
    );
