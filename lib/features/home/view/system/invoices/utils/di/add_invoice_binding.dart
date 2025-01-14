import 'package:get/get.dart';
import 'package:logestics/features/home/view/system/invoices/data/data_sources/invoice_crud_firebase_api.dart';
import 'package:logestics/features/home/view/system/invoices/data/repositories/invoice_repository_imp.dart';
import 'package:logestics/features/home/view/system/invoices/domain/use_cases/create_invoice_use_case.dart';
import 'package:logestics/features/home/view/system/invoices/domain/use_cases/update_invoice_use_case.dart';

import '../../presentation/controllers/add_invoice_controller.dart';


class AddInvoiceBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() =>InvoiceCrudFirebaseApi(),fenix: true);
   Get.lazyPut(() =>InvoiceRepositoryImp(Get.find<InvoiceCrudFirebaseApi>()),fenix: true);
   Get.lazyPut(() =>CreateInvoiceUseCase(Get.find<InvoiceRepositoryImp>()),fenix: true);
   Get.lazyPut(()=>UpdateInvoiceUseCase(Get.find<InvoiceRepositoryImp>()));
    Get.lazyPut<AddInvoiceController>(() => AddInvoiceController(
      currentInvoice: Get.arguments?['invoice'], // Pass via named routes
      createInvoiceUseCase: Get.find<CreateInvoiceUseCase>(),
      updateInvoiceUseCase: Get.find<UpdateInvoiceUseCase>(),// Ensure it’s already registered
    ),fenix: true);
  }
}
