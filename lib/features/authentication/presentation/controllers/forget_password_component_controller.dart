import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/core/router/app_routes.dart';
import 'package:logestics/core/utils/app_constants/icons/app_icons_data_expended.dart';
import 'package:logestics/core/utils/app_constants/sizes/app_sizes_expended.dart';
import 'package:logestics/core/utils/app_constants/texts/app__authentication_texts_expended.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/helpers/url_louncher_helper.dart';
import '../../domain/useCases/forget_password_use_case.dart';

class ForgetPasswordComponentController extends GetxController {
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ForgetPasswordComponentController({required ForgetPasswordUseCase forgetPasswordUseCase})
      : _forgetPasswordUseCase = forgetPasswordUseCase;

  final forgetPasswordFormStateKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final errorMessages = <String, String>{}.obs;
  var isLoading = false.obs;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppAuthenticationTextsExpended.emailEmpty;
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return AppAuthenticationTextsExpended.emailInvalid;
    }
    return null;
  }

  Future<void> sendForgetPasswordEmail() async {
    isLoading.value = true;
    errorMessages.clear();
    final email = emailTextController.text.trim();

    if (forgetPasswordFormStateKey.currentState?.validate() ?? false) {
      final result = await _forgetPasswordUseCase.execute(email);

      result.fold(
            (failure) {
              print(failure.message);
                 isLoading.value = false;
              if (failure.field != null) {
                errorMessages[failure.field!] = failure.message;
              } else {

                  errorMessages['general'] = failure.message;
                }
              }
          ,
            (_) {
              errorMessages.clear(); // Clear all errors on success
              isLoading.value = false;
          Get.offNamedUntil(AppRoutes.login, (route) => false);
             showResetEmailSendSnackBar(email);

            },
      );
    } else {
      isLoading.value = false;
    }
  }
  void showResetEmailSendSnackBar(String email) {
    final textTheme = Theme.of(Get.context!).textTheme;
    final colorScheme = Theme.of(Get.context!).colorScheme;
    final String url = 'https://$email'; // Replace with your URL logic

    Get.snackbar(
      boxShadows: [BoxShadow(color: colorScheme.shadow)], // Shadow effect
      '', // Keep the default title empty to use titleText
      '', // Keep the default message empty to use messageText
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true, // Allows manual dismissal
      duration: null, // Keeps the Snackbar displayed until dismissed
      backgroundColor: colorScheme.tertiary, // Set a background color
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Add margin for better alignment
      padding: const EdgeInsets.all(16), // Padding inside the Snackbar
      //maxWidth: Get.width * 0.5, // Reduce width to half of the screen
      borderRadius: 12, // Rounded corners
      mainButton: TextButton(
        onPressed: () => Get.back(), // Dismiss the Snackbar
        child:  Icon(
          Icons.close,
          color: colorScheme.onError,
          size: 24,
        ),
      ),
      titleText: Text(
        AppAuthenticationTextsExpended.resetEmailTitle, // Use static string
        style: textTheme.titleLarge,
      ),
      messageText: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            AppAuthenticationTextsExpended.resetEmailMessage, // Use static string
            style: textTheme.titleMedium,
          ),
          TextButton(
            onPressed: () async {
              final Uri httpUri = Uri.parse(url);
              Get.back();
              try {
                await UrlLauncherHelper.openUrl(url);
              } catch (e) {
                ScaffoldMessenger.of(Get.context!).showSnackBar(
                  SnackBar(
                    content: Text('${AppAuthenticationTextsExpended.errorOpeningLink}: $e'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Text(
              email,
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

}





