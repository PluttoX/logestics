
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget projectsAnalysis(context) {
  final List<ProjectData> data = [
    ProjectData('Mon', 44, 76, 35),
    ProjectData('Tue', 55, 85, 41),
    ProjectData('Wed', 57, 101, 36),
    ProjectData('Thu', 56, 98, 26),
    ProjectData('Fri', 61, 87, 45),
    ProjectData('Sat', 58, 105, 48),
    ProjectData('Sun', 63, 91, 52),
  ];

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              "Projects Analysis",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: notifier.text,
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
            legend: Legend(
              isVisible: true,
              position: LegendPosition.top,
              textStyle: TextStyle(
                color: Colors.grey,
                fontFamily: "Outfit",
              ),
            ),
            primaryXAxis: CategoryAxis(
              majorGridLines: MajorGridLines(width: 0),
            ),
            primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 120,
              interval: 20,
            ),
            series: [
              ColumnSeries<ProjectData, String>(
                dataSource: data,
                xValueMapper: (ProjectData data, _) => data.day,
                yValueMapper: (ProjectData data, _) => data.project,
                name: 'Project',
                color: Color(0xFF00cae3),
              ),
              ColumnSeries<ProjectData, String>(
                dataSource: data,
                xValueMapper: (ProjectData data, _) => data.day,
                yValueMapper: (ProjectData data, _) => data.task,
                name: 'Task',
                color: Color(0xFF0f79f3),
              ),
              ColumnSeries<ProjectData, String>(
                dataSource: data,
                xValueMapper: (ProjectData data, _) => data.day,
                yValueMapper: (ProjectData data, _) => data.revenue,
                name: 'Revenue',
                color: Color(0xFF796df6),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class ProjectData {
  final String day;
  final double project;
  final double task;
  final double revenue;

  ProjectData(this.day, this.project, this.task, this.revenue);
}
