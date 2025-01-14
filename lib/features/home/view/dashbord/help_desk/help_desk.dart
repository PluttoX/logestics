
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/dashbord/help_desk/performance_of_agents.dart';
import 'package:logestics/features/home/view/dashbord/help_desk/recent_customer_rating.dart';
import 'package:logestics/features/home/view/dashbord/help_desk/sla_monitoring.dart';
import 'package:logestics/features/home/view/dashbord/help_desk/tickets_by_channel.dart';
import 'package:logestics/features/home/view/dashbord/help_desk/tickets_by_type.dart';
import 'package:logestics/features/home/view/dashbord/help_desk/tickets_solved_and_cleated.dart';
import 'package:logestics/features/home/view/dashbord/help_desk/top_containers.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import 'ave_resolution_time.dart';
import 'customer_satisfaction.dart';
import 'first_response_time.dart';
import 'new_tickets_created.dart';

class HelpDeskView extends StatefulWidget {
  const HelpDeskView({super.key});

  @override
  State<HelpDeskView> createState() => _HelpDeskViewState();
}

class _HelpDeskViewState extends State<HelpDeskView> {
  late ColorNotifier notifier;

  final List<FlSpot> ticketsOpen = [
    FlSpot(0, 15),
    FlSpot(1, 75),
    FlSpot(2, 47),
    FlSpot(3, 65),
    FlSpot(4, 14),
    FlSpot(5, 32),
    FlSpot(6, 19),
    FlSpot(7, 54),
    FlSpot(8, 44),
    FlSpot(9, 61),
  ];

  final List<FlSpot> ticketsInProgress = [
    FlSpot(0, 47),
    FlSpot(1, 45),
    FlSpot(2, 74),
    FlSpot(3, 32),
    FlSpot(4, 56),
    FlSpot(5, 31),
    FlSpot(6, 44),
    FlSpot(7, 33),
    FlSpot(8, 45),
    FlSpot(9, 19),
  ];

  final List<FlSpot> ticketsResolved = [
    FlSpot(0, 25),
    FlSpot(1, 66),
    FlSpot(2, 41),
    FlSpot(3, 59),
    FlSpot(4, 25),
    FlSpot(5, 44),
    FlSpot(6, 12),
    FlSpot(7, 36),
    FlSpot(8, 9),
    FlSpot(9, 21),
  ];

  final List<FlSpot> ticketsClosed = [
    FlSpot(0, 12),
    FlSpot(1, 14),
    FlSpot(2, 2),
    FlSpot(3, 47),
    FlSpot(4, 32),
    FlSpot(5, 44),
    FlSpot(6, 14),
    FlSpot(7, 55),
    FlSpot(8, 41),
    FlSpot(9, 69),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 950) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                width < 770
                    ? Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: topContainers(
                              context,
                              title: "Tickets Open",
                              value: "3.64%",
                              image: "assets/images/trend-up.png",
                              colortext: "23.53%",
                              greytext: "This Week",
                              color: Colors.green,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  titlesData: FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: ticketsOpen,
                                      color: Color(0xFF8175f6),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: notifier.lipurpleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 150,
                            child: topContainers(
                              context,
                              title: "Tickets In Progress",
                              value: "2.65K",
                              image: "assets/images/trend-up.png",
                              colortext: "8.53%",
                              greytext: "This Week",
                              color: Colors.green,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  titlesData: FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: ticketsInProgress,
                                      color: Color(0xFF08cce4),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: notifier.litealAccentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 150,
                            child: topContainers(
                              context,
                              title: "Tickets Resolved",
                              value: "564",
                              image: "assets/images/trend-down.png",
                              colortext: "3.74%",
                              greytext: "This Week",
                              color: Colors.red,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  titlesData: FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: ticketsResolved,
                                      color: Color(0xFF157df3),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: notifier.liblueColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 150,
                            child: topContainers(
                              context,
                              title: "Tickets Closed",
                              value: "634",
                              image: "assets/images/trend-down.png",
                              colortext: "6.04%",
                              greytext: "This Week",
                              color: Colors.red,
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(
                                    show: false,
                                  ),
                                  titlesData: FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: ticketsClosed,
                                      color: Color(0xFFffb468),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        color: notifier.liyellowColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: topContainers(
                                      context,
                                      title: "Tickets Open",
                                      value: "3.64%",
                                      image: "assets/images/trend-up.png",
                                      colortext: "23.53%",
                                      greytext: "This Week",
                                      color: Colors.green,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(
                                            show: false,
                                          ),
                                          titlesData: FlTitlesData(show: false),
                                          borderData: FlBorderData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: ticketsOpen,
                                              color: Color(0xFF8175f6),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color: notifier.lipurpleColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Container(
                                    child: topContainers(
                                      context,
                                      title: "Tickets In Progress",
                                      value: "2.65K",
                                      image: "assets/images/trend-up.png",
                                      colortext: "8.53%",
                                      greytext: "This Week",
                                      color: Colors.green,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(
                                            show: false,
                                          ),
                                          titlesData: FlTitlesData(show: false),
                                          borderData: FlBorderData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: ticketsInProgress,
                                              color: Color(0xFF08cce4),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color: notifier.litealAccentColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 150,
                            width: width,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: topContainers(
                                      context,
                                      title: "Tickets Resolved",
                                      value: "564",
                                      image: "assets/images/trend-down.png",
                                      colortext: "3.74%",
                                      greytext: "This Week",
                                      color: Colors.red,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(
                                            show: false,
                                          ),
                                          titlesData: FlTitlesData(show: false),
                                          borderData: FlBorderData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: ticketsResolved,
                                              color: Color(0xFF157df3),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color: notifier.liblueColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Container(
                                    child: topContainers(
                                      context,
                                      title: "Tickets Closed",
                                      value: "634",
                                      image: "assets/images/trend-down.png",
                                      colortext: "6.04%",
                                      greytext: "This Week",
                                      color: Colors.red,
                                      child: LineChart(
                                        LineChartData(
                                          gridData: FlGridData(
                                            show: false,
                                          ),
                                          titlesData: FlTitlesData(show: false),
                                          borderData: FlBorderData(show: false),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: ticketsClosed,
                                              color: Color(0xFFffb468),
                                              belowBarData: BarAreaData(
                                                show: true,
                                                color: notifier.liyellowColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 20),
                SizedBox(
                  height: 350,
                  child: NewTicketsCreated(),
                ),
                SizedBox(height: 20),
                width < 770
                    ? Column(
                        children: [
                          SizedBox(
                            height: 250,
                            child: firstResponseTime(context),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 250,
                            child: aveResolutionTime(context),
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 250,
                        child: Row(
                          children: [
                            Expanded(child: firstResponseTime(context)),
                            SizedBox(width: 20),
                            Expanded(child: aveResolutionTime(context)),
                          ],
                        ),
                      ),
                SizedBox(height: 20),
                SizedBox(
                  height: 350,
                  child: customerSatisfaction(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 500,
                  child: sLAMonitoring(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 350,
                  child: ticketsSolvedandCleated(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 550,
                  width: width,
                  child: performanceofAgents(context),
                ),
                SizedBox(height: 20),
                width < 770
                    ? Column(
                        children: [
                          SizedBox(
                            height: 350,
                            child: ticketsbyChannel(context),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 350,
                            child: ticketsbyType(context),
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 350,
                        width: width,
                        child: Row(
                          children: [
                            Expanded(child: ticketsbyChannel(context)),
                            SizedBox(width: 20),
                            Expanded(child: ticketsbyType(context)),
                          ],
                        ),
                      ),
                SizedBox(height: 20),
                SizedBox(
                  height: 500,
                  width: width,
                  child: recentCustomerRating(context),
                ),
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: topContainers(
                            context,
                            title: "Tickets Open",
                            value: "3.64%",
                            image: "assets/images/trend-up.png",
                            colortext: "23.53%",
                            greytext: "This Week",
                            color: Colors.green,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: false,
                                ),
                                titlesData: FlTitlesData(show: false),
                                borderData: FlBorderData(show: false),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: ticketsOpen,
                                    color: Color(0xFF8175f6),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color: notifier.lipurpleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: topContainers(
                            context,
                            title: "Tickets In Progress",
                            value: "2.65K",
                            image: "assets/images/trend-up.png",
                            colortext: "8.53%",
                            greytext: "This Week",
                            color: Colors.green,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: false,
                                ),
                                titlesData: FlTitlesData(show: false),
                                borderData: FlBorderData(show: false),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: ticketsInProgress,
                                    color: Color(0xFF08cce4),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color: notifier.litealAccentColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 150,
                  width: width,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: topContainers(
                            context,
                            title: "Tickets Resolved",
                            value: "564",
                            image: "assets/images/trend-down.png",
                            colortext: "3.74%",
                            greytext: "This Week",
                            color: Colors.red,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: false,
                                ),
                                titlesData: FlTitlesData(show: false),
                                borderData: FlBorderData(show: false),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: ticketsResolved,
                                    color: Color(0xFF157df3),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color: notifier.liblueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: topContainers(
                            context,
                            title: "Tickets Closed",
                            value: "634",
                            image: "assets/images/trend-down.png",
                            colortext: "6.04%",
                            greytext: "This Week",
                            color: Colors.red,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: false,
                                ),
                                titlesData: FlTitlesData(show: false),
                                borderData: FlBorderData(show: false),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: ticketsClosed,
                                    color: Color(0xFFffb468),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      color: notifier.liyellowColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 500,
                  child: NewTicketsCreated(),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 500,
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  child: firstResponseTime(context),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: Container(
                                  child: aveResolutionTime(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: customerSatisfaction(context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 330,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 2.2,
                        child: sLAMonitoring(context),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: ticketsSolvedandCleated(context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 550,
                  width: width,
                  child: performanceofAgents(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 350,
                  width: width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: ticketsbyChannel(context),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: ticketsbyType(context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: width < 1600 ? 500 : 500,
                  width: width,
                  child: recentCustomerRating(context),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        }
      },
    );
  }
}
