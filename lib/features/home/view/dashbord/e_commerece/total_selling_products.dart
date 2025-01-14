
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/dashbord_controllers/e_commerece_controllers/invoicecontroller.dart';
import '../../../theme/theme.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

late ColorNotifier notifier;

Widget totalSellingProducts(context) {
  bool button = false;
  notifier = Provider.of(context, listen: true);
  return LayoutBuilder(
    builder: (context, constraints) {
      return StatefulBuilder(
        builder: (context, setState) {
          InvoiceController invoiceController = Get.put(InvoiceController());
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
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
                      "Total Selling Products",
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
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        width:
                            width < 700 ? null : constraints.maxWidth / 1 - 30,
                        child: Table(
                          border: TableBorder(
                            horizontalInside:
                                BorderSide(color: notifier.getfillborder),
                          ),
                          columnWidths: const {
                            0: FixedColumnWidth(50),
                            1: FixedColumnWidth(200),
                            2: FixedColumnWidth(200),
                            3: FixedColumnWidth(200),
                          },
                          children: [
                            for (var a = invoiceController.loadmore;
                                a <
                                    invoiceController.loadmore +
                                        invoiceController.selectindex;
                                a++)
                              TableRow(
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(
                                      "${a.toString()}.",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontFamily: "Outfit",
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: ListTile(
                                      leading: SizedBox(
                                        child: ClipOval(
                                          child: Image.network(
                                            invoiceController
                                                .sellingproductimages[a],
                                            fit: BoxFit.fill,
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        invoiceController
                                            .sellingproducttitle[a],
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: const Color(0xFF475569),
                                        ),
                                      ),
                                      subtitle: Text(
                                        invoiceController
                                            .sellingproductsubtitle[a],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: "Outfit",
                                          color: Colors.grey,
                                        ),
                                      ),
                                      dense: true,
                                      contentPadding: const EdgeInsets.all(0),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: Text(
                                        "Item:#${invoiceController.sellingproductmonths[a]}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Outfit",
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Text(
                                      "\$${invoiceController.sellingproductprice[a]}",
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
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                NextPageButton(
                  number1: "5",
                  number2: "10",
                  number3: "20",
                  numberofpages: "1 - 6 of 12",
                  backbutton: () {
                    if (button == true) {
                      setState(() {
                        button = !button;
                        invoiceController.sellingproductimages.shuffle();
                        invoiceController.sellingproductmonths.shuffle();
                        invoiceController.sellingproductprice.shuffle();
                        invoiceController.sellingproductsubtitle.shuffle();
                        invoiceController.sellingproducttitle.shuffle();
                      });
                      invoiceController
                          .setloadmore(invoiceController.selectpage);
                    }
                  },
                  nextbutton: () {
                    if (button == false) {
                      setState(() {
                        button = !button;
                        invoiceController.sellingproductimages.shuffle();
                        invoiceController.sellingproductmonths.shuffle();
                        invoiceController.sellingproductprice.shuffle();
                        invoiceController.sellingproductsubtitle.shuffle();
                        invoiceController.sellingproducttitle.shuffle();
                      });
                      invoiceController
                          .setloadmore(invoiceController.selectpage);
                    }
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
