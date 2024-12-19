import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logestics/core/shared_services/firebase_auth_service.dart';
class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<FirebaseAuthService>();

    // If user is not logged in, redirect to Login page
    if (authService.currentUser == null) {
      return const RouteSettings(name: '/login');
    }
    return null; // Allow access
  }
}
