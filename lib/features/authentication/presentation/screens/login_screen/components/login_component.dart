import 'package:flutter/material.dart';
import 'package:logestics/core/router/app_routes.dart';
import 'package:logestics/core/shared_features/theme_management/presentation/controllers/theme_controller.dart';
import 'package:logestics/features/authentication/presentation/controllers/login_component_controller.dart';
import 'package:logestics/features/authentication/presentation/widgets/app_text_form_field.dart';
import '../../../../../../core/utils/app_constants/texts/app__authentication_texts_expended.dart';
import 'package:get/get.dart';

import '../../../widgets/app_error_container.dart';
import '../../../widgets/app_primary_filled_button.dart';
import '../../../widgets/app_secondary_filled_button.dart';

class LoginComponent extends StatelessWidget {
  LoginComponent({super.key});
  final controller = Get.find<LoginComponentController>();
  @override
  Widget build(BuildContext context) {
    var dpr= MediaQuery.of(context).devicePixelRatio;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(left: 437/ dpr),
      child: SizedBox(
        width: 552 /  dpr,
       // height: MediaQuery.sizeOf(context).height,
        child: Form(
          key: controller.loginFormStateKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppAuthenticationTextsExpended.welcomeBack,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(
                height: 28 /  dpr,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppAuthenticationTextsExpended.dontHaveAccount,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onTertiaryFixedVariant),
                  ),
                  TextButton(
                    onPressed: () {
                      //Todo 4 content us use case
                    },
                    child: Text(
                      AppAuthenticationTextsExpended.contactUs,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Get.theme.colorScheme.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 56 / dpr,
              ),
              Obx(
                () => AppTextFormField(
                  controller: controller.emailTextController,
                  hintText: AppAuthenticationTextsExpended.emailHint,
                  labelText: AppAuthenticationTextsExpended.emailLabel,
                  validator: controller.emailValidator,
                  errorMessage: controller.errorMessages['email'] ?? '',
                ),
              ),
              SizedBox(
                height: 31 / dpr,
              ),
              Obx(
                () => AppTextFormField(
                  controller: controller.passwordTextController,
                  hintText: AppAuthenticationTextsExpended.passwordHint,
                  labelText: AppAuthenticationTextsExpended.passwordLabel,
                  isObscure: !controller.isShowPassword.value,
                  obscureCallback: controller.toggleShowPassword,
                  validator: controller.passwordValidator,
                  errorMessage: controller.errorMessages['password'] ?? '',
                ),
              ),
              SizedBox(
                height: 15 /dpr,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: controller.toggleRememberMeMark,
                    child: Obx(
                      () => Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: controller.isRememberMeMark.value
                                ? colorScheme.primary
                                : colorScheme.onTertiaryFixedVariant,
                          ),
                          Text(
                            AppAuthenticationTextsExpended.remeber,
                            style: textTheme.labelSmall?.copyWith(
                              color: controller.isRememberMeMark.value
                                  ? colorScheme.primary
                                  : colorScheme.onTertiaryFixedVariant,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.forgotPassword);
                      },
                      child: Text(AppAuthenticationTextsExpended.forgetPassword))
                ],
              ),
              SizedBox(
                height: 15 /dpr,
              ),
              Obx(() => controller.errorMessages['general'] == null
                  ? SizedBox()
                  : controller.errorMessages['general']!.isEmpty
                      ? SizedBox()
                      : AppErrorContainer(
                          errorMessage:
                              controller.errorMessages['general'] ?? '')),
              SizedBox(
                height: 33 /dpr,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSecondaryFilledButton(
                    labelText: AppAuthenticationTextsExpended.demo,
                    onPressed: () {
                      //Todo demo login logic
                      Get.find<ThemeController>().toggleTheme();
                    },
                  ),
                  Obx(
                    () => AppPrimaryFilledButton(
                      label: controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: colorScheme.onPrimary,
                            )
                          : Text(AppAuthenticationTextsExpended.signeIn),
                      onPressed:
                          controller.isLoading.value ? () {} : controller.login,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

