import 'package:dartz/dartz.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/failure_obj.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/success_obj.dart';
import '../repositories/invoice_repository.dart';

class CreateInvoiceUseCase {
  final InvoiceRepository _invoiceRepository;

  CreateInvoiceUseCase(this._invoiceRepository);

  /// Executes the use case to create an invoice.
  Future<Either<FailureObj, SuccessObj>> call({
    required Map<String, dynamic> invoice,
  }) async {
    var companyId='1';
    //todo fetch company id
    // Validate inputs before calling the repository (optional)
    if (companyId.isEmpty) {
      return Left(FailureObj(
        code: 'invalid-company-id',
        message: 'Company ID cannot be empty.',
      ));
    }

    if (invoice['tasNumber'] == null || (invoice['tasNumber'] as String).isEmpty) {
      return Left(FailureObj(
        code: 'invalid-invoice',
        message: 'Invoice "tasNumber" must not be empty or null.',
      ));
    }

    // Call the repository
    return await _invoiceRepository.createInvoice(
      companyId: companyId,
      invoice: invoice,
    );
  }
}
