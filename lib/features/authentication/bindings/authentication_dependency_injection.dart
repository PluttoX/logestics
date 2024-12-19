import 'package:get/get.dart';
import 'package:logestics/core/shared_services/firebase_auth_service.dart';
class AuthenticationDependencyInjection extends Bindings{
  @override
  void dependencies() {
    Get.put(FirebaseAuthService());

  }
}
