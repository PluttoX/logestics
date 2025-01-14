
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/failure_obj.dart';
import '../../domain/entities/success_obj.dart';

abstract class InvoiceRepository {


  /// Creates an invoice and returns either a success or error object.
  Future<Either<FailureObj, SuccessObj>> createInvoice({
    required String companyId,
    required Map<String, dynamic> invoice,
  });
  Future<Either<FailureObj, SuccessObj>> updateInvoice({
    required String companyId,
    required Map<String, dynamic> invoice,
  });
  Stream<List<DocumentChange>> listenToInvoices();

  Future<Either<FailureObj, SuccessObj>> deleteInvoice({
    required String companyId,
    required String tasNumber,
  });
}