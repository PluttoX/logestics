import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logestics/core/shared_features/theme_management/presentation/controllers/theme_controller.dart';

import '../../../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';
import '../../../../../../core/utils/app_constants/icons/app_icons_data_expended.dart';
import '../../../../../../core/utils/app_constants/sizes/app_sizes_expended.dart';
import '../../../../../../core/utils/app_constants/texts/app__authentication_texts_expended.dart';
import '../../../controllers/forget_password_component_controller.dart';
import '../../../widgets/app_error_container.dart';
import '../../../widgets/app_primary_filled_button.dart';
import '../../../widgets/app_secondary_filled_button.dart';
import '../../../widgets/app_text_form_field.dart';
class ForgetPasswordComponent extends StatelessWidget {
   ForgetPasswordComponent({super.key});

  final controller = Get.find<ForgetPasswordComponentController>();

  @override
  Widget build(BuildContext context) {
    var dpr=MediaQuery.of(context).devicePixelRatio;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: 620 / dpr,
      //height: MediaQuery.sizeOf(context).height,
      child: Form(
        key: controller.forgetPasswordFormStateKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                   Get.back();
                  },
                  child: Icon(
                    AppIconsDataExpended.navigationBackIcon,
                    size: AppSizesExpended.navigationIconSize,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 7 / dpr,
            ),
            Text(
              AppAuthenticationTextsExpended.forgetPasswordTitle,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: 55 / dpr,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 493/dpr,
                  child:
                    Text(AppAuthenticationTextsExpended.subHeading,style: textTheme.titleMedium,),

                ),
              ],
            ),
            SizedBox(
              height: 10 / dpr,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppAuthenticationTextsExpended.dontKnowEmail,
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
              height: 55 / dpr,
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
            Obx(() => controller.errorMessages['general'] == null
                ? SizedBox()
                : controller.errorMessages['general']!.isEmpty
                ? SizedBox()
                : AppErrorContainer(
                errorMessage:
                controller.errorMessages['general'] ?? '')),
            SizedBox(
              height: 64 / dpr,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSecondaryFilledButton(
                  labelText: AppAuthenticationTextsExpended.usePhone,
                  onPressed: () {
                    //Todo  use phone  logic
                     Get.find<ThemeController>().toggleTheme();
                  },
                ),
                Obx(
                      () => AppPrimaryFilledButton(
                        size:  Size(screenWidth * 0.14 , screenHeight * 0.08),
                    label: controller.isLoading.value
                        ? CircularProgressIndicator(
                      color: colorScheme.onPrimary,
                    )
                        : Text(AppAuthenticationTextsExpended.continueLabel),
                    onPressed:
                    controller.isLoading.value ? () {} : controller.sendForgetPasswordEmail,
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
