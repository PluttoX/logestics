
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

class NewTicketsCreated extends StatefulWidget {
  const NewTicketsCreated({super.key, this.revenue});

  final bool? revenue;

  @override
  State<NewTicketsCreated> createState() => _NewTicketsCreatedState();
}

class _NewTicketsCreatedState extends State<NewTicketsCreated> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    final List<ProjectData> data = [
      ProjectData('Mon', 320, 220, 150, 98),
      ProjectData('Tue', 332, 182, 232, 77),
      ProjectData('Wed', 301, 191, 201, 101),
      ProjectData('Thu', 334, 234, 154, 99),
      ProjectData('Fri', 390, 290, 190, 40),
      ProjectData('Sat', 300, 200, 140, 88),
      ProjectData('Sun', 280, 180, 120, 62),
    ];
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      width: width,
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
                  widget.revenue == true
                      ? "Revenue: \$5,999.50"
                      : "New Tickets Created",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                  ),
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
          Expanded(
            child: SfCartesianChart(
              legend: Legend(
                isVisible: true,
                position: LegendPosition.top,
                textStyle: TextStyle(
                  color: notifier.text,
                  fontFamily: "Outfit",
                ),
              ),
              primaryXAxis: CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 400,
                interval: 50,
              ),
              series: [
                ColumnSeries<ProjectData, String>(
                  dataSource: data,
                  xValueMapper: (ProjectData data, _) => data.day,
                  yValueMapper: (ProjectData data, _) => data.low,
                  name: widget.revenue == true ? 'Orders' : 'Low',
                  color: Color(0xFF00cae3),
                ),
                ColumnSeries<ProjectData, String>(
                  dataSource: data,
                  xValueMapper: (ProjectData data, _) => data.day,
                  yValueMapper: (ProjectData data, _) => data.medium,
                  name: widget.revenue == true ? "Earnings" : 'Medium',
                  color: Color(0xFF0f79f3),
                ),
                ColumnSeries<ProjectData, String>(
                  dataSource: data,
                  xValueMapper: (ProjectData data, _) => data.day,
                  yValueMapper: (ProjectData data, _) => data.high,
                  name: widget.revenue == true ? "Refunds" : 'High',
                  color: Color(0xFFffb264),
                ),
                ColumnSeries<ProjectData, String>(
                  dataSource: data,
                  xValueMapper: (ProjectData data, _) => data.day,
                  yValueMapper: (ProjectData data, _) => data.urgent,
                  name: widget.revenue == true ? "Conversion Rate" : 'Urgent',
                  color: Color(0xFFee6666),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectData {
  final String day;
  final double low;
  final double medium;
  final double high;
  final double urgent;

  ProjectData(this.day, this.low, this.medium, this.high, this.urgent);
}
