import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../invoices/domain/entities/invoice.dart';
import '../../domain/entities/company.dart';
import '../../domain/use_cases/listen_to_invoice_use_case.dart';

class CompanyController extends GetxController  {
  final ListenToInvoicesUseCase _listenToInvoicesUseCase;
  final Company company = Company();

  CompanyController(this._listenToInvoicesUseCase);

  @override
  void onInit() {
    super.onInit();
    _listenToInvoices();
  }

  void _listenToInvoices() {
    _listenToInvoicesUseCase.execute().listen((docChanges) {
      try{


      for (var change in docChanges) {

        if (change.type == DocumentChangeType.added) {
          company.addInvoice(Invoice.fromJson(change.doc.data() as Map<String,dynamic>));
        } else if (change.type == DocumentChangeType.modified) {
          company.updateInvoice(Invoice.fromJson(change.doc.data()as Map<String,dynamic>));
        } else if (change.type == DocumentChangeType.removed) {
          company.removeInvoice(change.doc.id);
        }
      }
      update();}catch (e){
        debugPrint(e.toString());
      } // Update UI (GetX method)
    }
    //todo error
    );
  }
}
