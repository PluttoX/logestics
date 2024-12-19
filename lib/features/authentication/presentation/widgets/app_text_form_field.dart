import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';

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
  }):errorMessage=errorMessage==null?errorMessage:errorMessage.isEmpty?null:errorMessage;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Focus(
      child: Builder(
        builder: (context) => Stack(
          children: [
            Container(
              height: 70/AdoptiveBreakPoint.dpr,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26 / AdoptiveBreakPoint.dpr),
                // Optional: Rounded corners
                boxShadow: Focus.of(context).hasFocus
                    ? [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    // Shadow color
                    offset: Offset(10 / AdoptiveBreakPoint.dpr,
                        10 / AdoptiveBreakPoint.dpr),
                    // Shadow offset
                    blurRadius:
                    10 / AdoptiveBreakPoint.dpr, // Shadow blur effect
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
                         isObscure==false? Icons.visibility:Icons.visibility_off//
                          ,color: colorScheme.primary,
                        ),
                      ),
                labelText: labelText,
                labelStyle: textTheme.labelLarge,
                floatingLabelStyle: textTheme.labelMedium,
                hoverColor: errorMessage == null
                    ? colorScheme.secondaryContainer
                    : colorScheme.error,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 47.21 / AdoptiveBreakPoint.dpr,
                      vertical:isObscure!=null? 15/AdoptiveBreakPoint.dpr: 21.5 / AdoptiveBreakPoint.dpr),
                hintText: hintText,
                hintStyle: textTheme.labelMedium,
                filled: true,
                fillColor: controller.text.isNotEmpty
                    ? colorScheme.surface
                    : Focus.of(context).hasFocus
                        ? colorScheme.surface
                        : colorScheme.tertiary,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: colorScheme.tertiary,
                      width: 3 / AdoptiveBreakPoint.dpr),
                  borderRadius:
                      BorderRadius.circular(30 / AdoptiveBreakPoint.dpr),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.primary,
                    width: 2 / AdoptiveBreakPoint.dpr,
                  ),
                  borderRadius:
                      BorderRadius.circular(30 / AdoptiveBreakPoint.dpr),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorScheme.onError,
                    width: 2 / AdoptiveBreakPoint.dpr,
                  ),
                  borderRadius:
                      BorderRadius.circular(30 / AdoptiveBreakPoint.dpr),
                ),
                errorText: errorMessage,
                errorStyle:
                    textTheme.bodyLarge?.copyWith(color: colorScheme.onError),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Get.theme.colorScheme.onError),
                  borderRadius:
                      BorderRadius.circular(30 / AdoptiveBreakPoint.dpr),
                ),
              ),
              style: controller.text.isNotEmpty
                  ? textTheme.labelMedium?.copyWith(color: colorScheme.onTertiary)
                  : Focus.of(context).hasFocus
                      ? textTheme.labelMedium
                          ?.copyWith(color: colorScheme.onTertiary)
                      : textTheme.labelMedium,
            ),
        ]),
      ),
    );
  }
}
