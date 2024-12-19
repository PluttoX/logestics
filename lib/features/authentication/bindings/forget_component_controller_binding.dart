import 'package:get/get.dart';
import 'package:logestics/features/authentication/data/repositories/auth_repository_imp.dart';
import 'package:logestics/features/authentication/domain/useCases/forget_password_use_case.dart';
import 'package:logestics/features/authentication/presentation/controllers/forget_password_component_controller.dart';
class ForgetPasswordComponentControllerBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(()=>AuthRepositoryImpl( Get.find()),fenix: true);
    Get.lazyPut(()=>ForgetPasswordUseCase(authRepository: Get.find<AuthRepositoryImpl>()),fenix: true);
    Get.lazyPut(()=>ForgetPasswordComponentController( forgetPasswordUseCase:Get.find<ForgetPasswordUseCase>()),fenix: true);
  }

}