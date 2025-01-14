
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/dashbord/crm/tasks_stats.dart';
import 'package:logestics/features/home/view/dashbord/crm/to_do_list.dart';
import 'package:logestics/features/home/view/dashbord/crm/top_container_data.dart';
import 'package:logestics/features/home/view/dashbord/crm/total_leads.dart';

import 'client_payment_status.dart';
import 'country_stats.dart';
import 'earning_reports.dart';
import 'most_leads.dart';
import 'recent_leads.dart';
import 'top_customers.dart';

class CRMPageView extends StatefulWidget {
  const CRMPageView({super.key});

  @override
  State<CRMPageView> createState() => _CRMPageViewState();
}

class _CRMPageViewState extends State<CRMPageView> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

   return LayoutBuilder(
      builder: (context, constraints) {
        if (width < 850) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  height: width < 650 ? 550 : 300,
                  width: width,
                  child: topContainerData(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 500,
                  width: width,
                  child: mostLeads(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 500,
                  width: width,
                  child: countryStats(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  width: width,
                  child: tasksStats(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  width: width,
                  child: earningReports(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: width,
                  height: width < 550 ? 620 : 540,
                  child: topCustomers(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: width,
                  height: width < 550 ? 650 : 550,
                  child: recentLeads(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 540,
                  child: toDoList(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: width,
                  height: 300,
                  child: clientPaymentStatus(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: width,
                  height: 300,
                  child: totalLeads(context),
                ),
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  width: width,
                  child: topContainerData(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 600,
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: mostLeads(context),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          child: countryStats(context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: tasksStats(context),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          child: earningReports(context),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: width < 950 ? 550 : 580,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: topCustomers(context),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: width / 2,
                        height: 550,
                        child: recentLeads(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 530,
                  child: toDoList(context),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: clientPaymentStatus(context),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(child: totalLeads(context)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
