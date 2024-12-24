// File: home_controller.dart
import 'package:get/get.dart';
import 'package:logestics/core/router/app_routes.dart';

import '../../../authentication/domain/useCases/sign_out_use_case.dart';

class DashboardScreenController extends GetxController {
  // Reactive index to track the selected tab
  var selectedIndex = 0.obs;

  // Method to change the selected index
  void updateIndex(int index) {
    selectedIndex.value = index;
  }

  final SignOutUseCase signOutUseCase;

  DashboardScreenController({required this.signOutUseCase});

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> signOut() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await signOutUseCase.execute();

    result.fold(
          (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
          (_) {
        isLoading.value = false;
        // Navigate to login screen or perform other post-logout actions this hapepd by firebase_auth_service

      },
    );
  }
}
