import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorMessage;
  final String? labelText;
  final bool? isObscure;
  final TextEditingController controller;
  final AutovalidateMode? autoValidateMode;
  final Function()? obscureCallback;
  final String? Function(String?)? validator;

  AppTextFormField({
    super.key,
    this.hintText,
    this.obscureCallback,
    this.isObscure,
    String? errorMessage,
    this.validator,
    this.autoValidateMode,
    required this.controller,
    this.labelText,
  }) : errorMessage = errorMessage == null
            ? errorMessage
            : errorMessage.isEmpty
                ? null
                : errorMessage;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var dpr = MediaQuery.of(context).devicePixelRatio;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Focus(
      child: Builder(
        builder: (context) => Center(
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    screenHeight * 004 * screenHeight * 004),
                // Optional: Rounded corners
                boxShadow: Focus.of(context).hasFocus
                    ? [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.shadow,
                          // Shadow color
                          offset: Offset(10 / dpr, 10 / dpr),
                          // Shadow offset
                          blurRadius: 10 / dpr, // Shadow blur effect
                        ),
                      ]
                    : null,
              ),
            ),
            TextFormField(
              controller: controller,
              obscureText: isObscure ?? false,
              obscuringCharacter: '*',
              validator: validator,
              autovalidateMode: autoValidateMode,
              decoration: InputDecoration(
                suffix: isObscure == null
                    ? null
                    : IconButton(
                        onPressed: obscureCallback,
                        icon: Icon(
                          isObscure == false
                              ? Icons.visibility
                              : Icons.visibility_off //
                          ,
                          color: colorScheme.primary,
                          size: screenHeight * 0.004 * screenWidth * 0.004,
                        ),
                      ),
                labelText: labelText,
                labelStyle: textTheme.labelLarge?.copyWith(
                    fontSize: screenHeight * 0.0046 * screenWidth * 0.0046),
                floatingLabelStyle: textTheme.labelMedium?.copyWith(
                    fontSize: screenHeight * 0.0046 * screenWidth * 0.0046),
                hoverColor: errorMessage == null
                    ? colorScheme.secondaryContainer
                    : colorScheme.error,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: isObscure != null
                        ? screenHeight * 0.02
                        : screenHeight * 0.02),
                hintText: hintText,
                hintStyle: textTheme.labelMedium?.copyWith(
                    fontSize: screenHeight * 0.004 * screenWidth * 0.004),
                filled: true,
                fillColor: controller.text.isNotEmpty
                    ? colorScheme.surface
                    : Focus.of(context).hasFocus
                        ? colorScheme.surface
                        : colorScheme.tertiary,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorScheme.tertiary, width: 3),
                  borderRadius: BorderRadius.circular(
                      screenHeight * 004 * screenHeight * 004),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                      screenHeight * 004 * screenHeight * 004),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.onError,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                      screenHeight * 004 * screenHeight * 004),
                ),
                errorText: errorMessage,
                errorStyle: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onError,
                    fontSize: screenHeight * 0.004 * screenWidth * 0.004),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Get.theme.colorScheme.onError),
                  borderRadius: BorderRadius.circular(
                      screenHeight * 004 * screenHeight * 004),
                ),
              ),
              style: controller.text.isNotEmpty
                  ? textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: screenHeight * 0.004 * screenWidth * 0.004)
                  : Focus.of(context).hasFocus
                      ? textTheme.labelMedium?.copyWith(
                          color:  Theme.of(context).colorScheme.secondary,
                          fontSize: screenHeight * 0.004 * screenWidth * 0.004)
                      : textTheme.labelMedium?.copyWith(
                          fontSize: screenHeight * 0.004 * screenWidth * 0.004,
                          color:  Theme.of(context).colorScheme.secondary,
                        ),
            ),
          ]),
        ),
      ),
    );
  }
}
