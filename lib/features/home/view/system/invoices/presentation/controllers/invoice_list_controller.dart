

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/system/invoices/domain/use_cases/delete_invoice_use_case.dart';

import '../../../../../theme/theme.dart';
import '../../../company/presentation/conrollers/company_controller.dart';
import '../../domain/entities/failure_obj.dart';
import '../../domain/entities/success_obj.dart';

class InvoiceListController extends GetxController  {
  final DeleteInvoiceUseCase deleteInvoiceUseCase;
  InvoiceListController( {required this.deleteInvoiceUseCase});
  bool isActive = false;
                    var companyController= Get.find<CompanyController>();

  int selectpage = 0;
  int loadmore = 0;

  ScrollController scrollController = ScrollController();
 @override
  void onInit() {
     print(companyController.company.invoices);
    super.onInit();
  }
  setloadmore(value) {
    loadmore = value;
    update();
  }

  setpage(value) {
    selectpage = value;
    update();
  }

  int selectindex = 6;

  setindexforitem(value) {
    selectindex = value;
    update();
  }

  List invoiceTasId = [
    "3000709833",
    "3000709834",
    "3000709836",
    "3000709837",
    "3000709838",
    "3000709833",
  ];

  List   customerNames = [
    "Nisar Fertilizer Agency",
    "Ali Fertilizer Agency",
    "Zaheer Fertilizer Agency",
    "Sameer to APR Ltd",
    "Row Noman Asgher Fertilizer Agency",
    "Tariq kha  Fertilizer Agency and trades",
  ];

  List addresses= [
    "Mehrabpur",
    "lahore",
    "Dera Ghazi khan",
    "peshawar",
    "dera ismayel khan",
    "Muzafara bad",
  ];

  List shipmentDate = [
    "12 Oct,2025",
    "17 Oct,2025",
    "08 Oct,2025",
    "22 Oct,2025",
    "28 Oct,2025",
    "14 Oct,2025",
  ];

  List kms = [
    "19090",
    "900",
    "1800",
    "2000",
    "29000",
    "1879",
  ];
  List districts = [
    "Okara",
    "Sahiwal",
    "Dera ghazi khan",
    "Toba taxing",
    "khanjrab",
    "merpor khas",
  ];


  List status = [
    "In Progress",
    "Pending",
    "Completed",
    "Not Started",
    "Not Started",
  ];

  Map<String,Color> statusColor = {
    'In Progress': const Color(0xFFffb269),
  "Completed": const Color(0xFF34d47f),
    "Not Started": const Color(0xFF0f7bf4),
    "Pending": const Color(0xFFe85542),
   // Color(0xFFffb269),
    //Color(0xFFe85542),
  };

  Future<void> deleteInvoice({
    required String tasNumber,
  })
  async {

    // Show confirmation dialog
    Get.defaultDialog(
      title: "Are you sure?",
      middleText: "Deleting this invoice will affect the voucher and payment. Do you want to continue?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        // Call the deleteInvoice method if the user confirms

        Get.back();  // Close the dialog after confirmation

        // Show loading dialog
        Get.dialog(
          const Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );

        try {
          // Call the use case
          final result = await deleteInvoiceUseCase.call(
            tasNumber: tasNumber,
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
      },
      cancelTextColor: Colors.black,
      onCancel: () {
        Get.back();  // Close the dialog without doing anything
      },
    );

/*
    // Show loading dialog
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // Call the use case
      final result = await deleteInvoiceUseCase.call(
        tasNumber: tasNumber,
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
    }*/
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
