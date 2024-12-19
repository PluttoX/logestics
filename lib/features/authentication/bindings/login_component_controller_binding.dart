import 'package:get/get.dart';
import 'package:logestics/core/shared_services/firebase_auth_service.dart';
import 'package:logestics/features/authentication/data/repositories/auth_repository_imp.dart';
import 'package:logestics/features/authentication/domain/useCases/login_use_case.dart';
import '../presentation/controllers/login_component_controller.dart';
class LoginComponentControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>AuthRepositoryImpl(Get.find<FirebaseAuthService>()),fenix: true);
    Get.lazyPut(()=>LoginUseCase(authRepository: Get.find<AuthRepositoryImpl>()),fenix: true);
    Get.lazyPut(()=>LoginComponentController( loginUseCase:Get.find<LoginUseCase>()),fenix: true);
  }

}