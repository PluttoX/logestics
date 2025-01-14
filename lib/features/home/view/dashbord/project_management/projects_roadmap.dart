
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget projectsRoadmap(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  final List<ProjectStage> data = [
    ProjectStage('Project Planning', 45),
    ProjectStage('Requirement', 40),
    ProjectStage('Design', 52),
    ProjectStage('Development', 63),
    ProjectStage('Testing and QA', 80),
    ProjectStage('Post-Launch', 88),
  ];

  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
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
              "Projects Roadmap",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                color: notifier.text,
                // color: const Color(0xFF475569),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Popupbutton(
              title: "Week",
              items: const [
                "Day",
                "Week",
                "Month",
                "Year",
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Expanded(
          child: SfCartesianChart(
            primaryXAxis: NumericAxis(
              minimum: 0,
              maximum: 90,
              interval: 10,
            ),
            primaryYAxis: CategoryAxis(
              labelPlacement: LabelPlacement.onTicks,
            ),
            series: [
              BarSeries<ProjectStage, double>(
                dataSource: data,
                xValueMapper: (ProjectStage stage, _) => stage.weeks,
                yValueMapper: (ProjectStage stage, _) =>
                    data.indexOf(stage).toDouble(),
                dataLabelSettings: DataLabelSettings(isVisible: false),
                color: Color(0xFF8c82f7),
              )
            ],
            annotations: data.map((stage) {
              return CartesianChartAnnotation(
                widget: Text(
                  stage.stage,
                  style: TextStyle(
                    fontSize: 12,
                    color: notifier.text,
                  ),
                ),
                coordinateUnit: CoordinateUnit.point,
                region: AnnotationRegion.chart,
                x: 5,
                y: data.indexOf(stage).toDouble(),
              );
            }).toList(),
          ),
        ),
      ],
    ),
  );
}

class ProjectStage {
  final String stage;
  final double weeks;

  ProjectStage(this.stage, this.weeks);
}
