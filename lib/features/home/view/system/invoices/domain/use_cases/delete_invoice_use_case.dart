import 'package:dartz/dartz.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/failure_obj.dart';
import 'package:logestics/features/home/view/system/invoices/domain/entities/success_obj.dart';
import '../repositories/invoice_repository.dart';

class DeleteInvoiceUseCase {
  final InvoiceRepository _invoiceRepository;

  DeleteInvoiceUseCase(this._invoiceRepository);

  /// Executes the use case to delete an invoice.
  Future<Either<FailureObj, SuccessObj>> call({
    required String tasNumber,
  }) async {
    var companyId = '1';
    // TODO: Fetch company ID dynamically, if necessary.

    // Validate inputs before calling the repository
    if (companyId.isEmpty) {
      return Left(FailureObj(
        code: 'invalid-company-id',
        message: 'Company ID cannot be empty.',
      ));
    }

    if (tasNumber.isEmpty) {
      return Left(FailureObj(
        code: 'invalid-invoice',
        message: 'Invoice "tasNumber" must not be empty.',
      ));
    }

    // Call the repository
    return await _invoiceRepository.deleteInvoice(
      companyId: companyId,
      tasNumber: tasNumber,
    );
  }
}
