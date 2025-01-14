import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../invoices/domain/entities/invoice.dart';

class Company {
  RxList<Invoice> invoices = <Invoice>[].obs;

  void updateInvoice(Invoice updatedInvoice) {
    int index = invoices.indexWhere((invoice) => invoice.tasNumber == updatedInvoice.tasNumber);
    if (index != -1) {
      invoices[index] = updatedInvoice; // Update the specific invoice
    }
  }

  void removeInvoice(String tasNumber) {
    invoices.removeWhere((invoice) => invoice.tasNumber == tasNumber); // Remove an invoice
  }

  void addInvoice(Invoice newInvoice) {
    invoices.add(newInvoice); // Add a new invoice
  }
}