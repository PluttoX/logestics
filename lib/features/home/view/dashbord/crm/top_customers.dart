
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../../Controllers/dashbord_controllers/crm_controllers/top_customers_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget topCustomers(context) {
  TopCustomersController topCustomersController =
      Get.put(TopCustomersController());

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  return StatefulBuilder(
    builder: (context, setState) {
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
                  "Top Customers",
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
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: topCustomersController.topcustomersimage.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    minVerticalPadding: 0,
                    contentPadding: EdgeInsets.zero,
                    leading: ClipOval(
                      child: Image.asset(
                        topCustomersController.topcustomersimage[index],
                        height: height / 20,
                      ),
                    ),
                    title: Text(
                      topCustomersController.topcustomerstext[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: notifier.text,
                        // color: const Color(0xFF475569),
                      ),
                    ),
                    subtitle: Text(
                      "Customer ID #${topCustomersController.topcustomersid[index]}",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Outfit",
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Text(
                      "View Profile",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Outfit",
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return StyledDivider(
                    color: notifier.getfillborder,
                    lineStyle: DividerLineStyle.dashed,
                    height: 10,
                  );
                },
              ),
            ),
            GetBuilder<TopCustomersController>(
              builder: (topCustomersController) {
                if (width > 950 || width < 550) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Items per Page : ",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontFamily: "Outfit",
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          PopupMenuButton(
                            tooltip: '',
                            color: notifier.getBgColor,
                            offset: const Offset(0, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 1,
                            splashRadius: 1,
                            shadowColor: Colors.grey,
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "6",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      color: notifier.text,
                                      // color: Color(0xFF475569),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                value: 0,
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                value: 0,
                                child: Text(
                                  "12",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                value: 1,
                                child: Text(
                                  "18",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "1 - 6 of 12 ",
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                topCustomersController.topcustomersimage
                                    .shuffle();
                                topCustomersController.topcustomersid.shuffle();
                                topCustomersController.topcustomerstext
                                    .shuffle();
                              });
                              topCustomersController.setloadmore(
                                  topCustomersController.selectpage);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                topCustomersController.topcustomersimage
                                    .shuffle();
                                topCustomersController.topcustomersid.shuffle();
                                topCustomersController.topcustomerstext
                                    .shuffle();
                              });
                              topCustomersController.setloadmore(
                                  topCustomersController.selectpage);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Items per Page : ",
                            style: TextStyle(
                              letterSpacing: 1,
                              fontFamily: "Outfit",
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          PopupMenuButton(
                            tooltip: '',
                            color: Colors.white,
                            offset: const Offset(0, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.zero,
                            elevation: 1,
                            splashRadius: 1,
                            shadowColor: Colors.grey,
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "6",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      color: notifier.text,
                                      // color: Color(0xFF475569),
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                value: 0,
                                child: Text(
                                  "6",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                value: 1,
                                child: Text(
                                  "12",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                value: 2,
                                child: Text(
                                  "18",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "1 - 6 of 12 ",
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                topCustomersController.topcustomersimage
                                    .shuffle();
                                topCustomersController.topcustomersid.shuffle();
                                topCustomersController.topcustomerstext
                                    .shuffle();
                              });
                              topCustomersController.setloadmore(
                                  topCustomersController.selectpage);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                topCustomersController.topcustomersimage
                                    .shuffle();
                                topCustomersController.topcustomersid.shuffle();
                                topCustomersController.topcustomerstext
                                    .shuffle();
                              });
                              topCustomersController.setloadmore(
                                  topCustomersController.selectpage);
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      );
    },
  );
}
