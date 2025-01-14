import 'package:get/get.dart';
import 'package:logestics/features/authentication/domain/useCases/sign_out_use_case.dart';

import '../../../../core/shared_services/firebase_auth_service.dart';
import '../../../authentication/data/repositories/auth_repository_imp.dart';


class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthRepositoryImpl(Get.find<FirebaseAuthService>()),fenix: true);
    Get.lazyPut(()=>SignOutUseCase(Get.find<AuthRepositoryImpl>()),fenix: true);

  }

}