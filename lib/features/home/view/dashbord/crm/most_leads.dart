import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget mostLeads(context) {
  List mostleadsicons = [
    "assets/images/share.png",
    "assets/images/envelope.png",
    "assets/images/phone.png",
    "assets/images/group.png",
  ];

  List<Color> mostleadsiconscolor = [
    Color(0xFF07cae3),
    Color(0xFF0f79f4),
    Color(0xFF796df6),
    Color(0xFFffb264),
  ];

  final List<ChartData> chartData = [
    ChartData('Email', 55),
    ChartData('Social', 30),
    ChartData('Call', 10),
    ChartData('Others', 5),
  ];

  List mostleadstext = ["Social", "Email", "call", "Others"];

  List mostleadnumber = ["12,232", "17,273", "5,873", "3,432"];

  List mostleadpercent = ["45%", "95%", "25%", "9%"];

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Most Leads",
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
          child: SfCircularChart(
            palette: mostleadsiconscolor,
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
              ),
            ],
          ),
        ),
        ListView.separated(
          itemCount: mostleadsicons.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: notifier.lightbgcolor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    mostleadsicons[index],
                    color: mostleadsiconscolor[index],
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  mostleadstext[index],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: notifier.text,
                    // color: const Color(0xFF475569),
                  ),
                ),
                Spacer(),
                Text(
                  mostleadnumber[index],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  mostleadpercent[index],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: StyledDivider(
                color: notifier.getfillborder,
                lineStyle: DividerLineStyle.dashed,
              ),
            );
          },
        ),
      ],
    ),
  );
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}
