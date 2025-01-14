import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/system/company/presentation/conrollers/company_controller.dart';
import 'package:logestics/features/home/view/system/invoices/data/data_sources/invoice_crud_firebase_api.dart';
import 'package:logestics/features/home/view/system/invoices/data/repositories/invoice_repository_imp.dart';
import 'package:logestics/features/home/view/system/invoices/domain/use_cases/delete_invoice_use_case.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/Searchfield.dart';

import 'add_invoice_view.dart';
import 'controllers/invoice_list_controller.dart';

late ColorNotifier notifier;

Widget invoiceList(context, {bool? titleShow}) {
  bool isActive = false;

  InvoiceListController invoiceListController = Get.put(
    InvoiceListController(
      deleteInvoiceUseCase: Get.put(
        DeleteInvoiceUseCase(
          Get.put(
            InvoiceRepositoryImp(
              Get.put(
                InvoiceCrudFirebaseApi(),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  Map<String, Color> statusBgColor = {
    'In Progress': notifier.liyellowColor,
    "Completed": notifier.ligreenColor,
    "Not Started": notifier.liblueColor,
    "Pending": notifier.liredColor,
    //notifier.liyellowColor,
    //notifier.liredColor,
  };

  return GetBuilder<CompanyController>(
    init: invoiceListController.companyController,
    builder: (companyController) => LayoutBuilder(
      builder: (context, constraints) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                color: notifier.getBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: width < 650
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              titleShow == false
                                  ? InkWell(
                                      onTap: () {
                                        //showAddNewInvoice(context);
                                        Get.toNamed('/add-invoice', arguments: {
                                          //'invoice': invoice object, // Pass currentInvoice here
                                        });
                                      },
                                      child: const Text(
                                        "+ Add New Invoice",
                                        style: TextStyle(
                                          color: Color(0xFF0f7bf4),
                                          fontFamily: "Outfit",
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Invoice",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: const Color(0xFF475569),
                                      ),
                                    ),
                              const SizedBox(height: 5),
                              TextField(
                                cursorColor: notifier.text,
                                style: TextStyle(color: notifier.text),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: notifier.textFileColor,
                                  hintText: 'Search here...',
                                  prefixIcon: Image.asset(
                                    'assets/images/search.png',
                                    scale: 1.2,
                                    color: notifier.text,
                                  ),
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              titleShow == false
                                  ? InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          '/add-invoice', /*arguments: {
                                          'invoice': Invoice(
                                              consignorName: 'sdf',
                                              consignorPickUpAddress: 'sdf',
                                              conveyNoteNumber: 'sdfd',
                                              customerCNIC: '34534534534534',
                                          customerGstNumber: 'gsdf',
                                            deliveryMode: 'By Road',
                                            destinationAddress: 'ssdf',
                                            customerName: 'ali',
                                            distanceInKilometers: 324,
                                            invoiceNumber: 34,
                                            invoiceStatus: 'pending',
                                            numberOfBags: 343,
                                            orderDate: '12/12/1223',
                                            orderNumber: '123',
                                            productName: 'sona',
                                            regionNumber: 'shahid',
                                            shipmentDate: '12/12/1212',
                                             shipmentNumber: '234',
                                            tasNumber: '343',
                                            truckNumber: '343'
                                          ),
                                          // Pass currentInvoice here
                                        }*/
                                        );
                                        //Get.toNamed('/addInvoice');
                                      },
                                      child: const Text(
                                        "+ Add New Invoices",
                                        style: TextStyle(
                                          color: Color(0xFF0f7bf4),
                                          fontFamily: "Outfit",
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "Add New Invoices",
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: notifier.text,
                                        // color: const Color(0xFF475569),
                                      ),
                                    ),
                              SizedBox(
                                width: width < 850 ? width / 2 : width / 3.5,
                                child: const Searchfield(),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          // width: width < 1410 ? null : constraints.maxWidth,
                          child: Table(
                            border: TableBorder(
                              horizontalInside: BorderSide(
                                color: notifier.getfillborder,
                              ),
                            ),
                            columnWidths: const {
                              0: FixedColumnWidth(50),
                              1: FixedColumnWidth(140),
                              2: FixedColumnWidth(220),
                              3: FixedColumnWidth(170),
                              4: FixedColumnWidth(70),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(120),
                              7: FixedColumnWidth(130),
                              8: FixedColumnWidth(170),
                              //9: FixedColumnWidth(170),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                    color: notifier.getHoverColor),
                                children: [
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Transform.scale(
                                        scale: 1,
                                        child: Checkbox(
                                          overlayColor:
                                              WidgetStateProperty.all<Color>(
                                            Colors.transparent,
                                          ),
                                          activeColor: const Color(0xff0f79f3),
                                          side: BorderSide(
                                            width: 2,
                                            color: notifier.chakboxborder,
                                          ),
                                          value: isActive,
                                          onChanged: (val) {
                                            setState(() {
                                              isActive = val!;
                                            });
                                          },
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
                                        "Invoice TAS No",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
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
                                        "Customer Name",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
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
                                        "Destination Address",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
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
                                        "Kms",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
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
                                        "Regin",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
                                        ),
                                      ),
                                    ),
                                  ),
                                  /*TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "District",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
                                        ),
                                      ),
                                    ),
                                  ),*/
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Shipment Date",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
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
                                        "status",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
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
                                        "Action",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                          // color: Color(0xFF475569),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              for (var invoice
                                  in companyController.company.invoices)
                                TableRow(
                                  children: [
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: StatefulBuilder(
                                          builder:
                                              (BuildContext context, setState) {
                                            return Transform.scale(
                                              scale: 1,
                                              child: Checkbox(
                                                overlayColor:
                                                    WidgetStateProperty.all<
                                                        Color>(
                                                  Colors.transparent,
                                                ),
                                                activeColor:
                                                    const Color(0xff0f79f3),
                                                side: BorderSide(
                                                  width: 2,
                                                  color: notifier.chakboxborder,
                                                ),
                                                value: isActive,
                                                onChanged: (val) {
                                                  setState(() {
                                                    isActive = val!;
                                                  });
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          invoice.tasNumber,
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            color: notifier.text,
                                            // color: const Color(0xFF475569),
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
                                          invoice.customerName,
                                          style: const TextStyle(
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
                                          invoice.customerName,
                                          style: const TextStyle(
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
                                          invoice.distanceInKilometers
                                              .toString(),
                                          style: const TextStyle(
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
                                          invoice.regionNumber,
                                          style: const TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          invoice.regionNumber,
                                          style: const TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ),*/
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          invoice.shipmentDate,
                                          style: const TextStyle(
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
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: statusBgColor[
                                              invoice.invoiceStatus],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text(
                                            invoice.invoiceStatus,
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: invoiceListController
                                                      .statusColor[
                                                  invoice.invoiceStatus],
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/eye.png",
                                              height: 20,
                                              color: const Color(0xFF2a8ef6),
                                            ),
                                            const SizedBox(width: 10),
                                            TextButton(
                                              onPressed: () => Get.toNamed(
                                                  '/add-invoice',
                                                  arguments: {
                                                    'invoice': invoice
                                                  }),
                                              child: Image.asset(
                                                "assets/images/pen.png",
                                                height: 20,
                                                color: notifier.text,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            TextButton(
                                              onPressed: ()=>invoiceListController.deleteInvoice(tasNumber: invoice.tasNumber),
                                              child: Image.asset(
                                                "assets/images/trash.png",
                                                height: 20,
                                                color: notifier.text,
                                              ),
                                            ),
                                          ],
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
                  titleShow == false
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => AddNewInvoiceForm());
                                },
                                child: const Text(
                                  "+ Add New invoice",
                                  style: TextStyle(
                                    color: Color(0xFF0f7bf4),
                                    fontFamily: "Outfit",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        );
      },
    ),
  );
}
