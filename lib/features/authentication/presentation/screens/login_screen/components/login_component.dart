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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Form(
        key: controller.loginFormStateKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppAuthenticationTextsExpended.welcomeBack,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: screenHeight*0.009*screenHeight*0.009 ),
            ),
            SizedBox(
              height: screenWidth * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    AppAuthenticationTextsExpended.dontHaveAccount,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onTertiaryFixedVariant
                    ,fontSize: screenHeight*0.0057*screenHeight*0.0057
                    ),
                  ),
                ),
                Flexible(
                  child: TextButton(
                    onPressed: () {
                      //Todo 4 content us use case
                    },
                    child: Text(
                      AppAuthenticationTextsExpended.contactUs,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Get.theme.colorScheme.primary,
                          fontSize: screenHeight*0.0057*screenHeight*0.0057
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenWidth * 0.02,
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
              height: screenHeight*.03,
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
              height: screenHeight*.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextButton(
                    onPressed: controller.toggleRememberMeMark,
                    child: Obx(
                      () => Row(
                        children: [
                          Flexible(
                            child: Icon(
                              Icons.check_circle,
                              color: controller.isRememberMeMark.value
                                  ? colorScheme.primary
                                  : colorScheme.onTertiaryFixedVariant,
                              size:  screenHeight * 0.0044 * screenWidth * 0.0044,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              AppAuthenticationTextsExpended.remeber,
                              style: textTheme.labelSmall?.copyWith(
                                color: controller.isRememberMeMark.value
                                    ? colorScheme.primary
                                    : colorScheme.onTertiaryFixedVariant,
                                  fontSize: screenHeight*0.0048*screenHeight*0.0048
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.forgotPassword);
                      },
                      child: Text(AppAuthenticationTextsExpended.forgetPassword,
                      style:textTheme.titleLarge?.copyWith(
                          fontSize: screenHeight*0.0057*screenHeight*0.0057,
                        color: colorScheme.primary
                      ),
                      ),),
                )
              ],
            ),
            SizedBox(
              height: screenHeight*.02,
            ),
            Obx(() => controller.errorMessages['general'] == null
                ? SizedBox()
                : controller.errorMessages['general']!.isEmpty
                    ? SizedBox()
                    : AppErrorContainer(
                        errorMessage:
                            controller.errorMessages['general'] ?? '')),
            SizedBox(
              height: screenHeight*.03,
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
                    size:Size(screenWidth * 0.14 , screenHeight * 0.08),
                    label: controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: colorScheme.onPrimary,
                          )
                        : Text(AppAuthenticationTextsExpended.signeIn,
                     style: textTheme.titleLarge?.copyWith(
                        fontSize:  screenHeight * 0.0046 * screenWidth * 0.0046,
                        color: colorScheme.onPrimary
                    ),
                    ),
                    onPressed:
                        controller.isLoading.value ? () {} : controller.login,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

