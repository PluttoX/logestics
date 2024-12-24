import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logestics/core/utils/app_constants/texts/app__authentication_texts_expended.dart';

import '../../domain/useCases/login_use_case.dart';

class LoginComponentController extends GetxController {
  final LoginUseCase _loginUseCase;

  LoginComponentController({required LoginUseCase loginUseCase})
      : _loginUseCase = loginUseCase;
  var loginFormStateKey = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final errorMessages = <String, String>{}.obs;
  var isShowPassword = false.obs;
  var isRememberMeMark = false.obs;
  var isLoading = false.obs;
  var loginAttempts = 0.obs; // Track login attempts
  void toggleShowPassword() {
    isShowPassword.value = !isShowPassword.value;
  }

  void toggleRememberMeMark() {
    isRememberMeMark.value = !isRememberMeMark.value;
  }


  String? emailValidator(String? value) {
    // Check if the input is empty
    if (value == null || value.isEmpty) {
      return AppAuthenticationTextsExpended.emailEmpty;
    }

    // Define a regular expression for validating email
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    // Check if the input matches the regex
    if (!emailRegex.hasMatch(value)) {
      return AppAuthenticationTextsExpended.emailInvalid;
    }

    // If everything is valid, return null
    return null;
  }

  String? passwordValidator(String? value) {
    // Check if the input is empty
    if (value == null || value.isEmpty) {
      return AppAuthenticationTextsExpended.passwordEmpty;
    }

    // If everything is valid, return null
    return null;
  }

  Future<void> login() async {

    isLoading.value = true;
    errorMessages.clear();
    final email = emailTextController.text.trim();
    final password = passwordTextController.text.trim();

    if (loginFormStateKey.currentState?.validate() ?? false) {
      // Perform login using the LoginUseCase
      final result =
          await _loginUseCase.execute(email, password, isRememberMeMark.value);

      result.fold(
        (failure) {
          if (failure.message.contains(AppAuthenticationTextsExpended.invalidCredential)) {
            loginAttempts.value++;
          } // Increment login attempts on failure
          if (failure.field != null) {
            errorMessages[failure.field!] = failure.message;
          } else {
            if (loginAttempts.value > 2 &&
                failure.message.contains(AppAuthenticationTextsExpended.invalidCredential)) {
              // Append the additional suggestion
              errorMessages['general'] =
                  "${failure.message}:\n${AppAuthenticationTextsExpended.resetTip}";
            } else {
              errorMessages['general'] = failure.message;
            }
          }
          isLoading.value = false;
        },
        (user) {
          errorMessages.clear(); // Clear all errors on success
          isLoading.value = false;
        },
      );
    } else {
      isLoading.value = false;
    }
  }
}
