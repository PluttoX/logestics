
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget ticketsSolvedandCleated(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier=Provider.of(context,listen: true);
  
  List<ChartData> ticketsSolvedandCleated = [
    ChartData('Jan', 300, 200),
    ChartData('Feb', 810, 600),
    ChartData('Mar', 650, 500),
    ChartData('Apr', 1280, 840),
    ChartData('May', 590, 350),
    ChartData('Jun', 1000, 650),
    ChartData('Jul', 550, 250),
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Tickets Solved and Cleated",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  notifier.text,
                ),
              ),
            ),
            Popupbutton(
              title: "Last Week",
              items: const [
                "Last Day",
                "Last Week",
                "Last Month",
                "Last Year",
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
              maximum: 2500,
              minimum: 0,
              interval: 500,
            ),
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
              SplineAreaSeries<ChartData, String>(
                dataSource: ticketsSolvedandCleated,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.ticketsCreated,
                name: 'Tickets Created',
                borderColor: Color(0xFF03cbe3),
                color: notifier.litealAccentColor,
              ),
              SplineAreaSeries<ChartData, String>(
                dataSource: ticketsSolvedandCleated,
                xValueMapper: (ChartData data, _) => data.month,
                yValueMapper: (ChartData data, _) => data.ticketsSolved,
                name: 'Tickets Solved',
                borderColor: Color(0xff796df6),
                color: notifier.lipurpleColor,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class ChartData {
  ChartData(this.month, this.ticketsCreated, this.ticketsSolved);
  final String month;
  final int ticketsCreated;
  final int ticketsSolved;
}
