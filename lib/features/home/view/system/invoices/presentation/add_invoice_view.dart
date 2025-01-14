import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logestics/features/home/view/system/invoices/presentation/controllers/add_invoice_controller.dart';
import 'package:provider/provider.dart';

import '../../../../widget/my_dropdown_field.dart';
import '../../../../widget/my_text_field.dart';
import '../../../../widget/mycontainers.dart';
import '../domain/entities/invoice.dart';
import '../utils/constants/invoice_constants.dart';

class AddNewInvoiceForm extends StatelessWidget {
   AddNewInvoiceForm({super.key });


  late AddInvoiceController controller = Get.find<AddInvoiceController>();

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      key: controller.addInvoiceFormStateKey,
      child: Scaffold(
        backgroundColor: notifier.getBgColor,
        body: width < 850
            ? AlertDialog(
                backgroundColor: notifier.getBgColor,
                insetPadding: const EdgeInsets.symmetric(horizontal: 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add New Task",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: notifier.text,
                        // color: Color(0xFF475569),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close, color: notifier.text,
                        // color: Color(0xFF475569),
                      ),
                    ),
                  ],
                ),
                content: SizedBox(
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Invoice  No",
                          labelText: "Invoice  No",
                          hintText: "e.g 79330000708797",
                          textEditingController:
                          controller.invoiceNumberController,
                          textInputFormatter: [
                            controller.invoiceNumberFormatter
                          ],
                          validator: controller.validateInvoiceNumber,
                          validatorMode: AutovalidateMode.onUnfocus,
                        ),
                        const SizedBox(height: 10),
                        MyDropdownFormField(
                          titletext: "Invoice Status",
                          hinttext: "Select",
                          items: invoiceStatusList,
                          initalValue:  controller.invoiceStatusSelected.value,
                          onChanged: (value) {
                            controller.setStatus = value;
                          },
                          validator: controller.validateInvoiceStatus,
                          validatorMode:
                          AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "order  No",
                          labelText: "order  No",
                          hintText: "e.g 350000705",
                          textEditingController:
                          controller.orderNumberController,
                          validator: controller.validateOrderNumber,
                          validatorMode: AutovalidateMode.onUnfocus,
                          textInputFormatter: [
                            controller.orderNumberFormatter
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "order Date",
                          hintText: "select",
                          labelText: "order Date",
                          textEditingController:
                          controller.orderDateController,
                          validatorMode: AutovalidateMode.onUnfocus,
                          validator: controller.validateOrderDate,
                          suffixIcon: IconButton(
                            onPressed: () {
                              // showDatePickers();
                              controller.selectOrderDate(context);
                            },
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: notifier.text,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Product Name",
                          labelText: "P Name",
                          hintText: "e.g Sona Urea",
                          textEditingController:
                          controller.productNameController,
                          validator: controller.validateProductName,
                          validatorMode: AutovalidateMode.onUnfocus,
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Number of Bags",
                          labelText: "Invoice Tas No",
                          hintText: "e.g 800",
                          validatorMode: AutovalidateMode.onUnfocus,
                          textEditingController:
                          controller.numberOfBagsController,
                          textInputFormatter: [
                            controller.numberOfBagsFormatter
                          ],
                          validator: controller.validateNumberOfBags,
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Consignor Name",
                          labelText: "Con Name",
                          hintText: "e.g FFBL",
                          textEditingController:
                          controller.consignorNameController,
                          validator: controller.validateConsignorName,
                          validatorMode: AutovalidateMode.onUnfocus,
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Consignor PickUp address",
                          labelText: "PickUp address",
                          hintText: "e.g Karachi Port",
                          textEditingController: controller
                              .consignorPickUpAddressController,
                          validator:
                          controller.validateConsignorPickUpAddress,
                          validatorMode: AutovalidateMode.onUnfocus,
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Invoice GST Tracking Number",
                          labelText: "GST No",
                          hintText: "e.g 232406451192",
                          textEditingController:
                          controller.customerGstNumberController,
                          validatorMode: AutovalidateMode.onUnfocus,
                          validator:
                          controller.validateGstFbrTrackingNumber,
                          textInputFormatter: [
                            controller.gstFbrTrackingNumberFormatter
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Customer/Agency Name",
                          labelText: "Cus/Age Name",
                          hintText: "e.g Nisar fertilizer",
                          textEditingController:
                          controller.customerNameController,
                          validatorMode: AutovalidateMode.onUnfocus,
                          validator: controller.validateCustomerName,
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Customer CNIC",
                          labelText: "Cus ID No",
                          hintText: "e.g 3530445565645",
                          textEditingController:
                          controller.customerCNICController,
                          validatorMode: AutovalidateMode.onUnfocus,
                          validator: controller.validateCustomerCnic,
                          textInputFormatter: [
                            controller.customerCnicFormatter
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyDropdownFormField(
                          titletext: "DeliveryMode",
                          hinttext: "Select",
                          validatorMode: AutovalidateMode.onUnfocus,
                          items: deliveryModeList,
                          onChanged: (value) {
                            controller.setDeliveryMode = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Shipment Number",
                          labelText: "Shipment No",
                          hintText: "e.g 11138246",
                          textEditingController:
                          controller.shipmentNumberController,
                          textInputFormatter: [
                            controller.customerCnicFormatter
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Truck/Wagon Number",
                          labelText: "Truck/wagon Number",
                          hintText: "e.g TlX076",
                          textEditingController:
                          controller.truckNumberController,
                          validator: controller.validateTruckNumber,
                          validatorMode: AutovalidateMode.onUnfocus,
                          textInputFormatter: [
                            controller.truckNumberFormatter
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "TAS Number ",
                          labelText: "TAS Number important",
                          hintText: "e.g 3000709833 ",
                          textEditingController:
                          controller.truckNumberController,
                          validator: controller.validateTruckNumber,
                          validatorMode: AutovalidateMode.onUnfocus,
                          textInputFormatter: [
                            controller.truckNumberFormatter
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Convey Note Number ",
                          labelText: "Convey Note Number important",
                          hintText: "e.g 3000709833 ",
                          textEditingController:
                          controller.conveyNoteNumberController,
                          validator:
                          controller.validateConveyNoteNumber,
                          validatorMode: AutovalidateMode.onUnfocus,
                          textInputFormatter: [
                            controller.conveyNoteNumberFormatter
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyDropdownFormField(
                          titletext: "Region",
                          hinttext: "Select",
                          items: selectRegionOptionList,
                          onChanged: (value) {
                            controller.setReign = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Destination Address ",
                          labelText: "Address",
                          hintText: "e.g Okara",
                          textEditingController:
                          controller.destinationAddressController,
                          validator:
                          controller.validateDestinationAddress,
                          validatorMode: AutovalidateMode.onUnfocus,
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Distance in Kms ",
                          labelText: "Distance",
                          hintText: "e.g 970",
                          textEditingController:
                          controller.distanceInKilometersController,
                          validator:
                          controller.validateDistanceInKilometers,
                          validatorMode: AutovalidateMode.onUnfocus,
                          textInputFormatter: [
                            controller.distanceInKilometersFormatter
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyTextFormField(
                          titleText: "Shipment Date",
                          hintText: "select",
                          labelText: "Shipment Date",
                          textEditingController:
                          controller.shipmentDateController,
                          validator: controller.validateShipmentDate,
                          validatorMode: AutovalidateMode.onUnfocus,
                          suffixIcon: IconButton(
                            onPressed: () {
                              // showDatePickers();
                              controller.selectShipmentDate(context);
                            },
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: notifier.text,
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back;
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: const Color(0xFFe74c3c),
                          minimumSize: const Size(100, 50),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Outfit",
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: const Color(0xFF0f79f3),
                          minimumSize: const Size(100, 50),
                        ),
                        child: const Text(
                          "Create",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Outfit",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : AlertDialog(
                backgroundColor: notifier.getBgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add New Invoice",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 20,
                        fontWeight: FontWeight.bold, color: notifier.text,
                        // color: Color(0xFF475569),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close, color: notifier.text,
                        // color: Color(0xFF475569),
                      ),
                    ),
                  ],
                ),
                content: SizedBox(
                  height: height,
                  width: width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    titleText: "Invoice  Number",
                                    labelText: "Invoice  Number",
                                    hintText: "e.g 79330000708797",

                                    textEditingController:
                                        controller.invoiceNumberController,
                                    textInputFormatter: [
                                      controller.invoiceNumberFormatter
                                    ],
                                    validator: controller.validateInvoiceNumber,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                  ),
                                  const SizedBox(height: 20),
                                  MyDropdownFormField(
                                    titletext: "Invoice Status",
                                    hinttext: "Select",
                                    items: invoiceStatusList,
                                    initalValue:  controller.invoiceStatusSelected.value.isNotEmpty?
                                    invoiceStatusList.contains(controller.invoiceStatusSelected.value)?controller.invoiceStatusSelected.value:null
                                        :null,
                                      // Ensure value is valid
                                    onChanged: (value) {
                                      controller.setStatus = value;
                                    },
                                    validator: controller.validateInvoiceStatus,
                                    validatorMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextFormField(
                                    titleText: "Order  Number",
                                    labelText: "Order  No",
                                    hintText: "e.g 350000705",
                                    textEditingController:
                                        controller.orderNumberController,
                                    validator: controller.validateOrderNumber,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    textInputFormatter: [
                                      controller.orderNumberFormatter
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Order Date",
                                    hintText: "select",
                                    labelText: "Order Date",
                                    textEditingController:
                                        controller.orderDateController,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    validator: controller.validateOrderDate,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        // showDatePickers();
                                        controller.selectOrderDate(context);
                                      },
                                      icon: Icon(
                                        Icons.calendar_today_rounded,
                                        color: notifier.text,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    titleText: "Product Name",
                                    labelText: "P Name",
                                    hintText: "e.g Sona Urea",
                                    textEditingController:
                                        controller.productNameController,
                                    validator: controller.validateProductName,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                  ),
                                  const SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Number of Bags",
                                    labelText: "Quantity",
                                    hintText: "e.g 800",
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    textEditingController:
                                        controller.numberOfBagsController,
                                    textInputFormatter: [
                                      controller.numberOfBagsFormatter
                                    ],
                                    validator: controller.validateNumberOfBags,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextFormField(
                                    titleText: "Consignor Name",
                                    labelText: "Con Name",
                                    hintText: "e.g FFBL",
                                    textEditingController:
                                        controller.consignorNameController,
                                    validator: controller.validateConsignorName,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                  ),
                                  const SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Consignor PickUp address",
                                    labelText: "PickUp address",
                                    hintText: "e.g Karachi Port",
                                    textEditingController: controller
                                        .consignorPickUpAddressController,
                                    validator:
                                        controller.validateConsignorPickUpAddress,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    titleText: "Customer GST  Number",
                                    labelText: "GST No",
                                    hintText: "e.g 232406451192",
                                    textEditingController:
                                        controller.customerGstNumberController,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    validator:
                                        controller.validateGstFbrTrackingNumber,
                                    textInputFormatter: [
                                      controller.gstFbrTrackingNumberFormatter
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Customer/Agency Name",
                                    labelText: "Cus/Age Name",
                                    hintText: "e.g Nisar fertilizer",
                                    textEditingController:
                                        controller.customerNameController,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    validator: controller.validateCustomerName,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextFormField(
                                    titleText: "Customer CNIC",
                                    labelText: "Cus ID No",
                                    hintText: "e.g 3530445565645",
                                    textEditingController:
                                        controller.customerCNICController,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    validator: controller.validateCustomerCnic,
                                    textInputFormatter: [
                                      controller.customerCnicFormatter
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  MyDropdownFormField(
                                    titletext: "DeliveryMode",
                                    hinttext: "Select",
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    items: deliveryModeList,
                                    initalValue: controller.deliveryModeSelected.value.isNotEmpty?
                                    deliveryModeList.contains(controller.deliveryModeSelected.value)?controller.deliveryModeSelected.value:null
                                        :null,
                                    validator: controller.validateDeliveryMode,
                                    onChanged: (value) {
                                      controller.setDeliveryMode = value;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    titleText: "Shipment Number",
                                    labelText: "Shipment No",
                                    hintText: "e.g 11138246",
                                    textEditingController:
                                        controller.shipmentNumberController,
                                    validator: controller.validateShipmentNumber,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    textInputFormatter: [
                                      controller.customerCnicFormatter
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Truck/Wagon Number",
                                    labelText: "Truck/wagon Number",
                                    hintText: "e.g TlX076",
                                    textEditingController:
                                        controller.truckNumberController,
                                    validator: controller.validateTruckNumber,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    textInputFormatter: [
                                      controller.truckNumberFormatter
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextFormField(
                                    titleText: "TAS Number ",
                                    labelText: "TAS Number important",
                                    hintText: "e.g 3000709833 ",
                                    textEditingController:
                                        controller.tasNumberController,
                                    validator: controller.validateTasNumber,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    textInputFormatter: [
                                      controller.tasNumberFormatter
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Convey Note Number ",
                                    labelText: "Convey Note Number important",
                                    hintText: "e.g 3000709833 ",
                                    textEditingController:
                                        controller.conveyNoteNumberController,
                                    validator:
                                        controller.validateConveyNoteNumber,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    textInputFormatter: [
                                      controller.conveyNoteNumberFormatter
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                children: [
                                  MyDropdownFormField(
                                    titletext: "Region",
                                    hinttext: "Select",
                                    items: selectRegionOptionList,
                                    validatorMode: AutovalidateMode.onUserInteraction,
                                    validator: controller.validateRegion,
                                    initalValue:  controller.regionSelected.value.isNotEmpty?
                                    selectRegionOptionList.contains(controller.regionSelected.value)?controller.regionSelected.value:null
                                    :null,
                                    onChanged: (value) {
                                      controller.setReign = value;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Destination Address ",
                                    labelText: "Address",
                                    hintText: "e.g Okara",
                                    textEditingController:
                                        controller.destinationAddressController,
                                    validator:
                                        controller.validateDestinationAddress,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: width / 2.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyTextFormField(
                                    titleText: "Distance in Kms ",
                                    labelText: "Distance",
                                    hintText: "e.g 970",
                                    textEditingController:
                                        controller.distanceInKilometersController,
                                    validator:
                                        controller.validateDistanceInKilometers,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    textInputFormatter: [
                                      controller.distanceInKilometersFormatter
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Shipment Date",
                                    hintText: "select",
                                    labelText: "Shipment Date",
                                    textEditingController:
                                        controller.shipmentDateController,
                                    validator: controller.validateShipmentDate,
                                    validatorMode: AutovalidateMode.onUnfocus,
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        // showDatePickers();
                                        controller.selectShipmentDate(context);
                                      },
                                      icon: Icon(
                                        Icons.calendar_today_rounded,
                                        color: notifier.text,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: const Color(0xFFe74c3c),
                      minimumSize: const Size(130, 60),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Outfit",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.saveInvoice();

                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: const Color(0xFF0f79f3),
                      minimumSize: const Size(130, 60),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Outfit",
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

