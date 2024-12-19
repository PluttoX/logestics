import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';
class AppPrimaryFilledButton extends StatelessWidget {
  const AppPrimaryFilledButton({
    this.size,
    super.key,
    required this.label,
    required this.onPressed,
  });

  final Widget label;
  final VoidCallback? onPressed;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return FilledButton(

      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          size ??
              Size(259 / AdoptiveBreakPoint.dpr, 70 / AdoptiveBreakPoint.dpr),
        ),
      ),
      child: label,

    );
  }
}
