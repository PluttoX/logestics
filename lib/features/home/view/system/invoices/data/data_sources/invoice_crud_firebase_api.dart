import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class InvoiceCrudFirebaseApi {
  /// Creates an invoice in Firestore under the specified company's collection.

  /// Creates an invoice in Firestore under the specified company's collection.
  Future<void> createInvoiceToFirebase({
    required String companyId,
    required Map<String, dynamic> invoice,
  })
  async {
    try {
      // Create a reference to the Firestore document
      final invoiceRef = FirebaseFirestore.instance
          .collection('companies')
          .doc(companyId)
          .collection('invoices')
          .doc(invoice['tasNumber']);

      // Save the document with a timeout of 10 seconds
      await invoiceRef.set(invoice).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("The operation timed out. Please try again.");
        },
      );

      debugPrint(
        "Invoice ${invoice['tasNumber']} saved successfully under company $companyId.",
      );
    } on SocketException {
      debugPrint("No internet connection. Please check your network.");
      rethrow; // Rethrow to let the caller handle this error
    } on TimeoutException catch (e) {
      debugPrint("Timeout now You are on Offline mode");
      rethrow;
    } on FirebaseException catch (e) {
      if (e.code == 'company-not-found') {
        debugPrint("Company not found: ${e.message}");
      } else {
        debugPrint("Firebase error: ${e.message}");
      }
      rethrow;
    } catch (e) {
      debugPrint("Unexpected error: $e");
      rethrow;
    }
  }

  Stream<List<DocumentChange>> listenToInvoices() {
    return FirebaseFirestore.instance
        .collection('companies/1/invoices')
        .snapshots()
        .map(
          (snapshot) => snapshot.docChanges,
        );
  }

  /// Updates an existing invoice in Firestore under the specified company's collection.
  Future<void> updateInvoiceToFirebase({
    required String companyId,
    required Map<String, dynamic> invoice,
  })
  async {
    try {
      // Ensure the `tasNumber` field exists in the invoice data
      if (invoice['tasNumber'] == null ||
          (invoice['tasNumber'] as String).isEmpty) {
        throw ArgumentError('The "tasNumber" field must not be null or empty.');
      }

      // Reference to the invoice document
      final invoiceRef = FirebaseFirestore.instance
          .collection('companies')
          .doc(companyId)
          .collection('invoices')
          .doc(invoice['tasNumber']);

      // Update the invoice with a timeout of 10 seconds
      await invoiceRef.update(invoice).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("Now you are on offline Mode");
        },
      );

      debugPrint(
        "Invoice ${invoice['tasNumber']} updated successfully under company $companyId.",
      );
    } on SocketException {
      debugPrint("No internet connection. Please check your network.");
      rethrow; // Rethrow to let the caller handle this error
    } on TimeoutException catch (e) {
      debugPrint("Timeout error: ${e.message}");
      rethrow;
    } on FirebaseException catch (e) {
      if (e.code == 'invoice-not-found') {
        debugPrint("Invoice not found: ${e.message}");
      } else {
        debugPrint("Firebase error: ${e.message}");
      }
      rethrow;
    } on ArgumentError catch (e) {
      debugPrint("Argument error: ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("Unexpected error: $e");
      rethrow;
    }
  }

  /// Deletes an existing invoice in Firestore under the specified company's collection.
  Future<void> deleteInvoiceFromFirebase({
    required String companyId,
    required String tasNumber,
  })
  async {
    try {
      // Ensure the `tasNumber` is not null or empty
      if (tasNumber.isEmpty) {
        throw ArgumentError('The "tasNumber" field must not be null or empty.');
      }

      // Reference to the invoice document
      final invoiceRef = FirebaseFirestore.instance
          .collection('companies')
          .doc(companyId)
          .collection('invoices')
          .doc(tasNumber);

      // Delete the invoice with a timeout of 10 seconds
      await invoiceRef.delete().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("The operation timed out. Please try again.");
        },
      );

      debugPrint(
        "Invoice $tasNumber deleted successfully under company $companyId.",
      );
    } on SocketException {
      debugPrint("No internet connection. Please check your network.");
      rethrow; // Rethrow to let the caller handle this error
    } on TimeoutException catch (e) {
      debugPrint("Timeout error: ${e.message}");
      throw Exception('TimeOut you are on offline mode ');
    } on FirebaseException catch (e) {
      if (e.code == 'not-found') {
        debugPrint("Invoice not found: ${e.message}");
      } else {
        debugPrint("Firebase error: ${e.message}");
      }
      rethrow;
    } on ArgumentError catch (e) {
      debugPrint("Argument error: ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("Unexpected error: $e");
      rethrow;
    }
  }
}
