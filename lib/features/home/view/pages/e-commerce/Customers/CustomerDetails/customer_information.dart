
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../../../../theme/theme.dart';
import '../../../../../widget/stringfile.dart';

class CustomerInformation extends StatefulWidget {
  const CustomerInformation({super.key});

  @override
  State<CustomerInformation> createState() => _CustomerInformationState();
}

class _CustomerInformationState extends State<CustomerInformation> {
  late ColorNotifier notifier;

  List detailsTitle = [
    "Account ID",
    "Billing Email",
    "Delivery Address",
    "Language",
    "Latest Transaction",
  ];

  List detailsinfo = [
    "ID-12174123",
    "hello@luca.com",
    "715 Maple St, Hamletville, England",
    "English, Spanish",
    "#ARP-1217"
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Container(
      height: width < 1000 ? 650 : 610,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipOval(
              child: Image.asset(
                "assets/images/avatar-7 1.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              AllString.user4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: notifier.text,
              ),
            ),
          ),
          // SizedBox(height: 10),
          Center(
            child: Text(
              "hello@${AllString.user4}.com",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 16,
                color: Color(0xFF949ba3),
              ),
            ),
          ),
          Text(
            "Details",
            style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: notifier.text
                // color: Color(0xFF475972),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: StyledDivider(
              color: notifier.getfillborder,
              lineStyle: DividerLineStyle.dashed,
            ),
          ),

          ListView.separated(
            itemCount: detailsTitle.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailsTitle[index],
                    style: TextStyle(
                      // fontFamily: "Outfit",
                      // fontSize: 16,
                      // fontWeight: FontWeight.w500,
                      color: notifier.text,
                    ),
                  ),
                  Text(
                    detailsinfo[index],
                    style: TextStyle(
                      // fontFamily: "Outfit",
                      // fontSize: 16,
                      color: Color(0xFF949ba3),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 15);
            },
          ),
        ],
      ),
    );
  }
}
