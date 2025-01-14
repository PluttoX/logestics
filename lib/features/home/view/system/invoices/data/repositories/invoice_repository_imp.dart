import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/failure_obj.dart';
import 'package:logestics/features/home/view/system/invoices/domain/repositories/invoice_repository.dart';
import '../../../../../../../core/error_handling/failer.dart';
import '../../domain/entities/success_obj.dart';
import '../data_sources/invoice_crud_firebase_api.dart';
class InvoiceRepositoryImp implements InvoiceRepository {
  final InvoiceCrudFirebaseApi _invoiceCrudFirebaseApi;

  InvoiceRepositoryImp(this._invoiceCrudFirebaseApi);

  /// Creates an invoice and returns either a success or error object.
  @override
  Future<Either<FailureObj, SuccessObj>> createInvoice({
    required String companyId,
    required Map<String, dynamic> invoice,
  })
  async
  {
    try {
      await _invoiceCrudFirebaseApi.createInvoiceToFirebase(
        companyId: companyId,
        invoice: invoice,
      );
      return Right(SuccessObj(message: 'Invoice created successfully.'));
    }on SocketException {
      return Left(FailureObj(
        code: 'no-internet',
        message: 'No internet connection. Please check your network.',
      ));
    } on ArgumentError catch (e) {
      return Left(FailureObj(
        code: 'invalid-argument',
        message: e.message ?? 'Invalid argument provided.',
      ));
    } on FirebaseException

    catch (e) {
      return Left(FailureObj(
        code: e.code,
        message: e.message ?? 'Firebase error occurred.',
      ));
    }

    catch (e) {
      return Left(FailureObj(
        code: 'unexpected-error',
        message: 'An unexpected error occurred: $e',
      ));
    }


  }
  @override
  Future<Either<FailureObj, SuccessObj>> updateInvoice({
    required String companyId,
    required Map<String, dynamic> invoice,
  })
  async
  {
    try {
      await _invoiceCrudFirebaseApi.updateInvoiceToFirebase(
        companyId: companyId,
        invoice: invoice,
      );
      return Right(SuccessObj(message: 'Invoice updated successfully.'));
    } on SocketException {
      return Left(FailureObj(
        code: 'no-internet',
        message: 'No internet connection. Please check your network.',
      ));
    } on ArgumentError catch (e) {
      return Left(FailureObj(
        code: 'invalid-argument',
        message: e.message ?? 'Invalid argument provided.',
      ));
    } on FirebaseException catch (e) {
      return Left(FailureObj(
        code: e.code,
        message: e.message ?? 'Firebase error occurred.',
      ));
    } catch (e) {
      return Left(FailureObj(
        code: 'unexpected-error',
        message: 'An unexpected error occurred: $e',
      ));
    }
  }


  @override
  Stream<List<DocumentChange>> listenToInvoices() {
    return _invoiceCrudFirebaseApi.listenToInvoices();
  }

  @override
  Future<Either<FailureObj, SuccessObj>> deleteInvoice({
    required String companyId,
    required String tasNumber,
  }) async {
    try {
      await _invoiceCrudFirebaseApi.deleteInvoiceFromFirebase(
        companyId: companyId,
        tasNumber: tasNumber,
      );
      return Right(SuccessObj(message: 'Invoice deleted successfully.'));
    } on SocketException {
      return Left(FailureObj(
        code: 'no-internet',
        message: 'No internet connection. Please check your network.',
      ));
    } on ArgumentError catch (e) {
      return Left(FailureObj(
        code: 'invalid-argument',
        message: e.message ?? 'Invalid argument provided.',
      ));
    } on FirebaseException catch (e) {
      return Left(FailureObj(
        code: e.code,
        message: e.message ?? 'Firebase error occurred.',
      ));
    } catch (e) {
      return Left(FailureObj(
        code: 'unexpected-error',
        message: 'An unexpected error occurred: $e',
      ));
    }
  }



}

