
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget revenue(context) {
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
              "Revenue",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: notifier.text,
                // color: const Color(0xFF475569),
              ),
            ),
            Popupbutton(
              title: "This Week",
              items: const [
                "This Day",
                "This Week",
                "This Month",
                "This Year",
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: LineChart(
              lineChartData,
              duration: Duration(seconds: 3),
            ),
          ),
        ),
      ],
    ),
  );
}

LineChartData get lineChartData => LineChartData(
      lineTouchData: lineTouchData,
      gridData: FlGridData(show: false),
      titlesData: titlesData,
      borderData: borderData,
      lineBarsData: lineBarsData,
      minX: 0,
      maxX: 18,
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
      text = const Text('Sun', style: style);
      break;
    case 3:
      text = const Text('Mon', style: style);
      break;
    case 6:
      text = const Text('Tue', style: style);
      break;
    case 9:
      text = const Text('Wed', style: style);
      break;
    case 12:
      text = const Text('Tus', style: style);
      break;
    case 15:
      text = const Text('Fri', style: style);
      break;
    case 18:
      text = const Text('Sat', style: style);
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
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Color(0xFF475569),
    fontFamily: "Outfit",
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '0';
      break;
    case 2:
      text = '50';
      break;
    case 3:
      text = '100';
      break;
    case 4:
      text = '150';
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
        FlSpot(0, 1.5),
        FlSpot(3, 1.4),
        FlSpot(6, 1),
        FlSpot(9, 1.6),
        FlSpot(12, 2.5),
        FlSpot(15, 3),
        FlSpot(18, 2),
      ],
    );

LineChartBarData get lineChartBarData_2 => LineChartBarData(
      isCurved: true,
      color: Color(0xFF1dcfe6),
      barWidth: 8,
      spots: const [
        FlSpot(0, 1),
        FlSpot(3, 1.2),
        FlSpot(6, 1.5),
        FlSpot(9, 1.5),
        FlSpot(12, 1.8),
        FlSpot(15, 2),
        FlSpot(18, 1.5),
      ],
    );
