import 'package:get/get.dart';
import 'package:logestics/features/home/view/system/company/domain/use_cases/listen_to_invoice_use_case.dart';
import 'package:logestics/features/home/view/system/company/presentation/conrollers/company_controller.dart';
import 'package:logestics/features/home/view/system/invoices/data/data_sources/invoice_crud_firebase_api.dart';
import 'package:logestics/features/home/view/system/invoices/data/repositories/invoice_repository_imp.dart';

class CompanyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(InvoiceCrudFirebaseApi());
    Get.put(InvoiceRepositoryImp(Get.find<InvoiceCrudFirebaseApi>()));
    Get.put(ListenToInvoicesUseCase(Get.find<InvoiceRepositoryImp>()));
    Get.put(CompanyController(Get.find<ListenToInvoicesUseCase>()));

  }

}