import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../invoices/domain/repositories/invoice_repository.dart';

class ListenToInvoicesUseCase {
  final InvoiceRepository _repository;

  ListenToInvoicesUseCase(this._repository);

  Stream<List<DocumentChange>> execute() {
    return _repository.listenToInvoices();
  }
}
