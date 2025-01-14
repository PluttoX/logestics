import 'package:dartz/dartz.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/failure_obj.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/success_obj.dart';
import '../repositories/invoice_repository.dart';

class UpdateInvoiceUseCase {
  final InvoiceRepository _invoiceRepository;

  UpdateInvoiceUseCase(this._invoiceRepository);

  /// Executes the use case to update an invoice.
  Future<Either<FailureObj, SuccessObj>> call({
    required Map<String, dynamic> invoice,
  }) async {
    // Fetch or set the company ID
    var companyId = '1'; // TODO: Fetch the company ID dynamically if needed

    // Validate inputs
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
    return await _invoiceRepository.updateInvoice(
      companyId: companyId,
      invoice: invoice,
    );
  }
}
