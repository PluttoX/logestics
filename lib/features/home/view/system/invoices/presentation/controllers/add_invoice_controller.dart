import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/theme/theme.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/failure_obj.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/success_obj.dart';
import 'package:logestics/features/home/view/system/invoices/domain/use_cases/create_invoice_use_case.dart';

import 'package:provider/provider.dart';

import '../../domain/entities/invoice.dart';
import '../../domain/use_cases/update_invoice_use_case.dart';

class AddInvoiceController extends GetxController {
  var editMode = false;
  final Invoice? currentInvoice;
  final CreateInvoiceUseCase createInvoiceUseCase;
  final UpdateInvoiceUseCase updateInvoiceUseCase;

  AddInvoiceController({this.currentInvoice,required this.createInvoiceUseCase,required this.updateInvoiceUseCase});
  var addInvoiceFormStateKey = GlobalKey<FormState>();
  // TextEditingControllers for each field
  late TextEditingController invoiceNumberController;
  late TextEditingController orderNumberController;
  late TextEditingController orderDateController;
  late TextEditingController productNameController;
  late TextEditingController numberOfBagsController;
  late TextEditingController consignorNameController;
  late TextEditingController consignorPickUpAddressController;
  late TextEditingController customerGstNumberController;
  late TextEditingController customerNameController;
  late TextEditingController customerCNICController;

  late TextEditingController shipmentNumberController;
  late TextEditingController truckNumberController;
  late TextEditingController tasNumberController;
  late TextEditingController conveyNoteNumberController;

  late TextEditingController destinationAddressController;
  late TextEditingController distanceInKilometersController;
  late TextEditingController shipmentDateController;
 // late TextEditingController carrierNameController;


  // Rx data for dropdowns and externally controlled fields
  var invoiceStatusSelected = 'In Progress'.obs;
  var regionSelected = ''.obs;
  var deliveryModeSelected = 'By Road'.obs;




  @override
  void onInit() {

    super.onInit();
    // Initialize TextEditingControllers with currentInvoice values or empty strings
    invoiceNumberController = TextEditingController(
        text: currentInvoice?.invoiceNumber.toString() ?? '');
    invoiceStatusSelected.value = currentInvoice?.invoiceStatus ?? 'In Progress';
    orderNumberController =
        TextEditingController(text: currentInvoice?.orderNumber ?? '');
    orderDateController =
        TextEditingController(text: currentInvoice?.orderDate ?? '');
    productNameController =
        TextEditingController(text: currentInvoice?.productName ?? '');
    numberOfBagsController = TextEditingController(
        text: currentInvoice?.numberOfBags.toString() ?? '');
    consignorNameController =
        TextEditingController(text: currentInvoice?.consignorName ?? '');
    consignorPickUpAddressController =
        TextEditingController(text: currentInvoice?.consignorPickUpAddress ?? '');
    customerGstNumberController =
        TextEditingController(text: currentInvoice?.customerGstNumber ?? '');
    customerNameController =
        TextEditingController(text: currentInvoice?.customerName ?? '');
    customerCNICController =
        TextEditingController(text: currentInvoice?.customerCNIC ?? '');
    deliveryModeSelected.value = currentInvoice?.deliveryMode ?? 'By Road';
    shipmentNumberController =
        TextEditingController(text: currentInvoice?.shipmentNumber ?? '');
    truckNumberController =
        TextEditingController(text: currentInvoice?.truckNumber ?? '');
    tasNumberController =
        TextEditingController(text: currentInvoice?.tasNumber ?? '');
    conveyNoteNumberController =
        TextEditingController(text: currentInvoice?.conveyNoteNumber ?? '');
    regionSelected.value = currentInvoice?.regionNumber ?? '';
    destinationAddressController =
        TextEditingController(text: currentInvoice?.destinationAddress ?? '');
    distanceInKilometersController = TextEditingController(
        text: currentInvoice?.distanceInKilometers.toString() ?? '');
    shipmentDateController =
        TextEditingController(text: currentInvoice?.shipmentDate ?? '');
    // carrierNameController =
    //     TextEditingController(text: currentInvoice?.carrierName ?? '');

    // Initialize Rx values with currentInvoice data if available

 currentInvoice==null? editMode=false:editMode=true;
  }

  set setStatus(String value) {
    invoiceStatusSelected.value = value;
  }

  set setReign(String value) {
    regionSelected.value = value;
  }

  set setDeliveryMode(String value) {
    deliveryModeSelected.value = value;
  }

  selectOrderDate(BuildContext context) async {
    var date = await selectDate(context);
    if (date == null) {
      // orderDateController.text=formatDate(DateTime(0,0,0));
    } else {
      orderDateController.text = formatDate(date);
    }
  }

  selectShipmentDate(BuildContext context) async {
    var date = await selectDate(context);
    if (date == null) {
      // shipmentDateController.text=formatDate(DateTime(0,0,0));
    } else {
      shipmentDateController.text = formatDate(date);
    }
  }

  String formatDate(DateTime date) {
    // Format the day, month, and year with padding for single-digit numbers
    String day = date.day.toString().padLeft(2, '0');
    String month = date.month.toString().padLeft(2, '0');
    String year = date.year.toString();

    // Combine into the desired format
    return '$day/$month/$year';
  }

  @override
  void onClose() {
    // Dispose all TextEditingControllers
    invoiceNumberController.dispose();

    orderNumberController.dispose();
    orderDateController.dispose();
    productNameController.dispose();
    numberOfBagsController.dispose();
    consignorNameController.dispose();
    consignorPickUpAddressController.dispose();
    customerGstNumberController.dispose();
    customerNameController.dispose();
    customerCNICController.dispose();

    shipmentNumberController.dispose();
    truckNumberController.dispose();
    tasNumberController.dispose();
    conveyNoteNumberController.dispose();

    destinationAddressController.dispose();
    distanceInKilometersController.dispose();
    shipmentDateController.dispose();
   // carrierNameController.dispose();
    super.onClose();
  }



  Future<DateTime?> selectDate(BuildContext context) async {
    ColorNotifier notifier = Provider.of(context, listen: false);
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: notifier.getBgColor,
            ),
            colorScheme: ColorScheme.light(
              onSurface: notifier.text,
              surface: notifier.getBgColor,
              primary: const Color(0xFF2B79F3),
            ), // body text color
          ),
          child: child!,
        );
      },
      firstDate: DateTime(
        DateTime.now().year - 1,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
    return date;
  }

  String? validateInvoiceNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invoice number is required.';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'Invoice number must be numeric.';
    }
    return null;
  }

  String? validateShipmentNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Invoice number is required.';
    }
    // if (!RegExp(r'^\d+$').hasMatch(value)) {
    //   return 'Invoice number must be numeric.';
    // }
    return null;
  }

  String? validateInvoiceStatus(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Must select.';
    }
    return null;
  }

  String? validateDeliveryMode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Must select.';
    }
    return null;
  }
  String? validateRegion(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Must select.';
    }
    return null;
  }

  String? validateOrderNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Order number is required.';
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Order number must be alphanumeric.';
    }
    return null;
  }

  // Validator for order date to check if it follows DD/MM/YYYY format
  String? orderDateValidator(String? value) {
    final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (value == null || value.isEmpty) {
      return 'Please enter the order date';
    }

    // Check if the input matches the DD/MM/YYYY pattern
    if (!dateRegex.hasMatch(value)) {
      return 'Invalid date format. Please use DD/MM/YYYY';
    }

    // Further validate the date (e.g., check if the day, month, and year are correct)
    List<String> parts = value.split('/');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    if (month < 1 || month > 12) {
      return 'Invalid month';
    }

    if (day < 1 || day > 31) {
      return 'Invalid day';
    }

    // Handle months with less than 31 days
    if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30) {
      return 'This month has only 30 days';
    }

    // Handle February
    if (month == 2) {
      bool isLeapYear = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
      if (day > (isLeapYear ? 29 : 28)) {
        return 'February has only ${isLeapYear ? 29 : 28} days in this year';
      }
    }

    return null; // No error, valid date
  }

  String? validateProductName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Product name is required.';
    }
    return null;
  }

  String? validateNumberOfBags(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number of bags is required.';
    }
    if (int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Number of bags must be a positive integer.';
    }
    return null;
  }

  String? validateConsignorName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Consignor name is required.';
    }
    return null;
  }

  String? validateConsignorPickUpAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Consignor destination is required.';
    }
    return null;
  }

  String? validateGstFbrTrackingNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'GST/FBR tracking number is required.';
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'GST/FBR tracking number must be alphanumeric.';
    }
    return null;
  }

  String? validateCustomerName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Customer name is required.';
    }
    return null;
  }

  String? validateCustomerCnic(String? value) {
    if (value == null || value.isEmpty) {
      return 'Customer CNIC is required.';
    }
    if (!RegExp(r'^\d{13}$').hasMatch(value)) {
      return 'Customer CNIC must be 13 digits.';
    }
    return null;
  }

  String? validateTruckNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Truck number is required.';
    }
    if (!RegExp(r'^[a-zA-Z0-9\s-]+$').hasMatch(value)) {
      return 'Truck number must be alphanumeric.';
    }
    return null;
  }

  String? validateTasNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'TAS number is required.';
    }
    if (!RegExp(r'^\d+$').hasMatch(value)) {
      return 'TAS number must be numeric.';
    }
    return null;
  }

  String? validateConveyNoteNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Convey note number is required.';
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Convey note number must be alphanumeric.';
    }
    return null;
  }

  String? validateDestinationAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Destination address is required.';
    }
    return null;
  }

  String? validateDistanceInKilometers(String? value) {
    if (value == null || value.isEmpty) {
      return 'Distance in kilometers is required.';
    }
    if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'Distance must be a positive number.';
    }
    return null;
  }

  String? validateCarrierName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Carrier name is required.';
    }
    return null;
  }

  String? validateShipmentDate(String? value) {
    final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (value == null || value.isEmpty) {
      return 'Please enter the shipment date.';
    }

    if (!dateRegex.hasMatch(value)) {
      return 'Invalid date format. Use DD/MM/YYYY.';
    }

    try {
      List<String> parts = value.split('/');
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      if (month < 1 || month > 12) {
        return 'Invalid month.';
      }

      if (day < 1 || day > 31) {
        return 'Invalid day.';
      }

      // Handle months with less than 31 days
      if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30) {
        return 'This month has only 30 days.';
      }

      // Handle February
      if (month == 2) {
        bool isLeapYear =
            (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
        if (day > (isLeapYear ? 29 : 28)) {
          return 'February has only ${isLeapYear ? 29 : 28} days this year.';
        }
      }

      // Check if shipment date is earlier than order date
      if (orderDateController.text != null &&
          dateRegex.hasMatch(orderDateController.text)) {
        List<String> orderParts = orderDateController.text.split('/');
        DateTime order = DateTime(
          int.parse(orderParts[2]),
          int.parse(orderParts[1]),
          int.parse(orderParts[0]),
        );
        DateTime shipment = DateTime(year, month, day);

        if (shipment.isBefore(order)) {
          return 'Shipment date cannot be earlier than order date.';
        }
      }
    } catch (e) {
      return 'Invalid date.';
    }

    return null; // Valid date
  }
  String? validateOrderDate(String? value) {
    final dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (value == null || value.isEmpty) {
      return 'Please enter the order date.';
    }

    if (!dateRegex.hasMatch(value)) {
      return 'Invalid date format. Use DD/MM/YYYY.';
    }

    try {
      List<String> parts = value.split('/');
      int day = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int year = int.parse(parts[2]);

      if (month < 1 || month > 12) {
        return 'Invalid month.';
      }

      if (day < 1 || day > 31) {
        return 'Invalid day.';
      }

      // Handle months with less than 31 days
      if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30) {
        return 'This month has only 30 days.';
      }

      // Handle February
      if (month == 2) {
        bool isLeapYear = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
        if (day > (isLeapYear ? 29 : 28)) {
          return 'February has only ${isLeapYear ? 29 : 28} days this year.';
        }
      }
    } catch (e) {
      return 'Invalid date.';
    }

    return null; // Valid date
  }

// Text formatters for your fields
  final invoiceNumberFormatter = FilteringTextInputFormatter.digitsOnly;
  final orderNumberFormatter = FilteringTextInputFormatter.digitsOnly;
  final numberOfBagsFormatter = FilteringTextInputFormatter.digitsOnly;
  final gstFbrTrackingNumberFormatter =
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'));
  final customerCnicFormatter = FilteringTextInputFormatter.digitsOnly;
  final shipmentNumberFormatter = FilteringTextInputFormatter.digitsOnly;
  final truckNumberFormatter =
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'));
  final tasNumberFormatter =
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'));
  final conveyNoteNumberFormatter =
      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'));
  final distanceInKilometersFormatter =
      FilteringTextInputFormatter.allow(RegExp('[0-9.]'));


saveInvoice()async{
   var invoice= getInvoiceFromInput();
   if(invoice!=null) {
     editMode == false
         ?await createInvoice( invoice: invoice.toJson())
         :await updateInvoice(invoice: invoice.toJson());
   }
}
  Invoice? getInvoiceFromInput() {

    if (!addInvoiceFormStateKey.currentState!.validate()) {
      // If the form is not valid, return null
      showErrorSnackbar('All Fields Must Be Valid Filled: Check Red Fields');
      return null;
    }
    return Invoice(
      invoiceNumber: int.tryParse(invoiceNumberController.text) ?? 0,
      invoiceStatus: invoiceStatusSelected.value,
      orderNumber: orderNumberController.text,
      orderDate: orderDateController.text,
      productName: productNameController.text,
      numberOfBags: int.tryParse(numberOfBagsController.text) ?? 0,
      consignorName: consignorNameController.text,
      consignorPickUpAddress: consignorPickUpAddressController.text,
      customerGstNumber: customerGstNumberController.text,
      customerName: customerNameController.text,
      customerCNIC: customerCNICController.text,
      deliveryMode: deliveryModeSelected.value,
      shipmentNumber: shipmentNumberController.text,
      truckNumber: truckNumberController.text,
      tasNumber: tasNumberController.text,
      conveyNoteNumber: conveyNoteNumberController.text,
      regionNumber: regionSelected.value,
      destinationAddress: destinationAddressController.text,
      distanceInKilometers:
      double.tryParse(distanceInKilometersController.text) ?? 0.0,
      shipmentDate: shipmentDateController.text,
      //  carrierName: carrierNameController.text,
    );
  }
  /// Create an invoice and handle success or error responses.


  /// Updates an invoice in Firestore.
  Future<void> updateInvoice({
    required Map<String, dynamic> invoice,
  }) async {
    // Show loading dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // Call the use case
      final result = await updateInvoiceUseCase.call(invoice: invoice);

      // Close loading dialog
      Get.back();

      // Handle result
      result.fold(
            (failure) => _showErrorDialog(failure),
            (success) => _showSuccessSnackbar(success),
      );
    } catch (e) {
      // Close loading dialog
      Get.back();

      // Show unexpected error dialog
      Get.defaultDialog(
        title: "Unexpected Error",
        middleText: "Something went wrong. Please try again later.",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
    }
  }
  Future<void> createInvoice({

    required Map<String, dynamic> invoice,
  })
  async
  {
    // Show loading dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // Call the use case
      final result = await createInvoiceUseCase.call(

        invoice: invoice,
      );

      // Close loading dialog
      Get.back();

      // Handle result
      result.fold(
            (failure) => _showErrorDialog(failure),
            (success) => _showSuccessSnackbar(success),
      );
    } catch (e) {
      // Close loading dialog
      Get.back();

      // Show unexpected error
      Get.defaultDialog(
        title: "Unexpected Error",
        middleText: "Something went wrong. Please try again later.",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
      );
    }
  }


  /// Show an error popup with details.
  void _showErrorDialog(FailureObj failure) {
    Get.defaultDialog(
      title: "Error",
      middleText: failure.message,
      textConfirm: "OK",
      confirmTextColor: Colors.white,
      onConfirm: () => Get.back(),
    );
  }
  void showErrorSnackbar(String errorMessage) {
    if (errorMessage.isNotEmpty) {
      Get.snackbar(
        "Error", // Title of the snackbar
        errorMessage, // Error message content
        snackPosition: SnackPosition.BOTTOM, // Show at the bottom
        backgroundColor: Colors.red.withOpacity(0.8), // Red background for error
        colorText: Colors.white, // White text color
        icon: const Icon(Icons.error_outline, color: Colors.white), // Error icon
        margin: const EdgeInsets.all(12.0), // Margin for better spacing
        borderRadius: 8.0, // Rounded corners
        duration: const Duration(seconds: 3), // Auto dismiss after 3 seconds
      );
    }
  }

  /// Show a success snackbar.
  void _showSuccessSnackbar(SuccessObj success) {
    Get.back(); // Close any active dialogs
    Get.snackbar(
      "Success",
      success.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}



