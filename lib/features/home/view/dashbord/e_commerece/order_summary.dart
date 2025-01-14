
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget orderSummary(context) {
  Map<String, double> dataMap = {
    "Completed": 60,
    "New Order": 30,
    "Pending": 10,
  };

  List<Color> chartcolor = [
    const Color(0xFF00cae3),
    const Color(0xFF0e7aee),
    const Color(0xFF796df6),
  ];

  List charttext = [
    "Completed",
    "New Order",
    "Pending",
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order Summary",
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
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Completed 60%",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15, color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
            Text(
              "New Order 30%",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15, color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
            Text(
              "Pending 10%",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15, color: notifier.text,
                // color: Color(0xFF475569),
              ),
            ),
          ],
        ),
        SizedBox(height: width / 50),
        Expanded(
          child: PieChart(
            dataMap: dataMap,
            animationDuration: const Duration(seconds: 3),
            chartType: ChartType.ring,
            legendOptions: const LegendOptions(
              showLegends: false,
            ),
            colorList: chartcolor,
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: false,
              showChartValuesInPercentage: true,
              showChartValuesOutside: true,
              decimalPlaces: 1,
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ListView.separated(
            itemCount: chartcolor.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    color: chartcolor[index],
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${charttext[index]}",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Outfit",
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 25);
            },
          ),
        ),
      ],
    ),
  );
}
