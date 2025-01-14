
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';

late List<_ChartData> data;
late TooltipBehavior tooltip;

late ColorNotifier notifier;

Widget topContainerData(context) {
  final List<FlSpot> newusers = [
    FlSpot(0, 198),
    FlSpot(1, 212),
    FlSpot(2, 200),
    FlSpot(3, 230),
  ];

  final List<FlSpot> activeusers = [
    FlSpot(0, 2300),
    FlSpot(1, 2000),
    FlSpot(2, 2122),
    FlSpot(3, 1988),
  ];

  final List<FlSpot> leadconversation = [
    FlSpot(0, 5),
    FlSpot(1, 5),
    FlSpot(1, 2.5),
    FlSpot(2, 2.5),
    FlSpot(2, 3.5),
    FlSpot(3, 3.5),
    FlSpot(3, 1),
  ];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  if (width < 650) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 100,
            width: width,
            child: newUserData(
              context,
              title: "New Users",
              number: "837",
              image: "assets/images/trend-up.png",
              conttext: "4.32%",
              chart: SizedBox(
                width: width < 450 ? 100 : 150,
                height: 70,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: newusers,
                        isCurved: true,
                        color: Color(0xFFF9B264),
                        belowBarData: BarAreaData(
                          show: true,
                          color: notifier.isDark
                              ? Color(0xFF665A4E)
                              : Color(0xFFFCE7CF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              lasttext: "This Week",
              color: Colors.green,
              bgcolor: notifier.ligreenColor,
            ),
          ),
          Divider(color: notifier.getfillborder),
          SizedBox(
            height: 100,
            width: width,
            child: newUserData(
              context,
              title: "Active Users",
              number: "67,324",
              image: "assets/images/trend-up.png",
              conttext: "9.62%",
              chart: SizedBox(
                width: width < 450 ? 100 : 150,
                height: 70,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: activeusers,
                        isCurved: true,
                        color: Color(0xFF2B79F1),
                        belowBarData: BarAreaData(
                          show: true,
                          color: notifier.isDark
                              ? Color(0xFF264B70)
                              : Color(0xFFA1CFFA),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              lasttext: "This Month",
              color: Colors.green,
              bgcolor: notifier.ligreenColor,
            ),
          ),
          Divider(color: notifier.getfillborder),
          SizedBox(
            height: 100,
            width: width,
            child: newUserData(
              context,
              title: "Lead Conversation",
              number: "12.66%",
              image: "assets/images/trend-down.png",
              conttext: "1.23%",
              chart: SizedBox(
                width: width < 450 ? 100 : 150,
                height: 70,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: leadconversation,
                        isCurved: false,
                        color: Color(0xFF796df6),
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          color: notifier.isDark
                              ? Color(0xFF45467A)
                              : Color(0xFFcfcbfc),
                        ),
                      ),
                    ],
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                    lineTouchData: LineTouchData(enabled: false),
                  ),
                ),
              ),
              lasttext: "Last Week",
              color: Colors.red,
              bgcolor: notifier.liredColor,
            ),
          ),
          Divider(color: notifier.getfillborder),
          SizedBox(
            height: 100,
            width: width,
            child: newUserData(
              context,
              title: "Revenue Growth",
              number: "\$2,342",
              image: "assets/images/trend-up.png",
              conttext: "22.64%",
              chart: SizedBox(
                width: width < 450 ? 100 : 150,
                height: 70,
                child: SfCartesianChart(
                  primaryXAxis: NumericAxis(isVisible: false),
                  primaryYAxis: NumericAxis(isVisible: false),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries>[
                    ColumnSeries<_ChartData, num>(
                      dataSource: [
                        _ChartData(0, 21),
                        _ChartData(1, 22),
                        _ChartData(2, 10),
                        _ChartData(3, 28),
                        _ChartData(4, 16),
                        _ChartData(5, 21),
                        _ChartData(6, 30),
                      ],
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      color: const Color(0xFF25d1e7),
                    ),
                  ],
                ),
              ),
              lasttext: "Weekly Growth",
              color: Colors.green,
              bgcolor: notifier.ligreenColor,
            ),
          ),
        ],
      ),
    );
  } else {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: newUserData(
                      context,
                      title: "New Users",
                      number: "837",
                      image: "assets/images/trend-up.png",
                      conttext: "4.32%",
                      chart: SizedBox(
                        width: width / 10,
                        height: height / 10,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: newusers,
                                isCurved: true,
                                color: Color(0xFFF9B264),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: notifier.isDark
                                      ? Color(0xFF665A4E)
                                      : Color(0xFFFCE7CF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      lasttext: "This Week",
                      color: Colors.green,
                      bgcolor: notifier.ligreenColor,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: Container(
                    child: newUserData(
                      context,
                      title: "Lead Conversation",
                      number: "12.66%",
                      image: "assets/images/trend-down.png",
                      conttext: "1.23%",
                      chart: SizedBox(
                        width: width / 10,
                        height: height / 10,
                        child: LineChart(
                          LineChartData(
                            lineBarsData: [
                              LineChartBarData(
                                spots: leadconversation,
                                isCurved: false,
                                color: Color(0xFF796df6),
                                barWidth: 3,
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: notifier.isDark
                                      ? Color(0xFF45467A)
                                      : Color(0xFFcfcbfc),
                                ),
                              ),
                            ],
                            titlesData: FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                            lineTouchData: LineTouchData(enabled: false),
                          ),
                        ),
                      ),
                      lasttext: "Last Week",
                      color: Colors.red,
                      bgcolor: notifier.liredColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height,
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 25),
            color: notifier.getfillborder,
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: newUserData(
                      context,
                      title: "Active Users",
                      number: "67,324",
                      image: "assets/images/trend-up.png",
                      conttext: "9.62%",
                      chart: SizedBox(
                        width: width / 10,
                        height: height / 10,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),
                            lineBarsData: [
                              LineChartBarData(
                                spots: activeusers,
                                isCurved: true,
                                color: Color(0xFF127bf1),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: notifier.isDark
                                      ? Color(0xFF264B70)
                                      : Color(0xFFA1CFFA),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      lasttext: "This Month",
                      color: Colors.green,
                      bgcolor: notifier.ligreenColor,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Expanded(
                  child: Container(
                    child: newUserData(
                      context,
                      title: "Revenue Growth",
                      number: "\$2,342",
                      image: "assets/images/trend-up.png",
                      conttext: "22.64%",
                      chart: SizedBox(
                        width: width / 9,
                        height: height / 10,
                        child: SfCartesianChart(
                          primaryXAxis: NumericAxis(isVisible: false),
                          primaryYAxis: NumericAxis(isVisible: false),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <CartesianSeries>[
                            ColumnSeries<_ChartData, num>(
                              dataSource: [
                                _ChartData(0, 21),
                                _ChartData(1, 22),
                                _ChartData(2, 10),
                                _ChartData(3, 28),
                                _ChartData(4, 16),
                                _ChartData(5, 21),
                                _ChartData(6, 30),
                              ],
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              color: const Color(0xFF25d1e7),
                            ),
                          ],
                        ),
                      ),
                      lasttext: "Weekly Growth",
                      color: Colors.green,
                      bgcolor: notifier.ligreenColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final double x;
  final double y;
}

Widget newUserData(
  context, {
  required String title,
  required String number,
  required String image,
  required String conttext,
  required Widget chart,
  required String lasttext,
  required Color color,
  required Color bgcolor,
}) {
  notifier = Provider.of(context, listen: true);

  return Container(
    decoration: BoxDecoration(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                fontFamily: "Outfit",
                letterSpacing: 1,
                color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
            Text(
              number,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Outfit",
                color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: bgcolor,
                border: Border.all(
                  color: color,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      image,
                      color: color,
                    ),
                    Text(
                      conttext,
                      style: TextStyle(
                        color: color,
                        fontFamily: "Outfit",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              child: chart,
            ),
            Text(
              lasttext,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: "Outfit",
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
