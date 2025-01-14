
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/help_desk_controllers/sla_monitoring_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget sLAMonitoring(context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  SlaMonitoringController slaMonitoringController =
      Get.put(SlaMonitoringController());

  return Container(
    decoration: BoxDecoration(
      color: notifier.getBgColor,
      borderRadius: BorderRadius.circular(10),
    ),
    padding: EdgeInsets.all(15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "SLA Monitoring",
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
        SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            physics:
                width < 550 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(),
              height: 490,
              // height: width < 550 ? height / 1.8 : height / 1.5,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Table(
                    border: TableBorder(
                      horizontalInside:
                          BorderSide(color: notifier.getfillborder),
                    ),
                    columnWidths: const {
                      0: FixedColumnWidth(100),
                      1: FixedColumnWidth(200),
                      2: FixedColumnWidth(250),
                      3: FixedColumnWidth(200),
                      4: FixedColumnWidth(200),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: notifier.tablehader),
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Ticket ID",
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: notifier.text,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Subject",
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: notifier.text,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Requester",
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: notifier.text,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "SLA Due By",
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: notifier.text,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "End Remaining",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: notifier.text,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      for (var a = slaMonitoringController.loadmore;
                          a <
                              slaMonitoringController.loadmore +
                                  slaMonitoringController.selectindex;
                          a++)
                        TableRow(
                          children: [
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "#${slaMonitoringController.ticketID[a]}",
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  slaMonitoringController.subject[a],
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: notifier.text,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  slaMonitoringController.requester[a],
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  slaMonitoringController.slaDueBy[a],
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  slaMonitoringController.endRemaining[a],
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
