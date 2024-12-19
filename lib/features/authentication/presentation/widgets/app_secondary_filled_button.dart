import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants/configrations/adoptive_break_point.dart';

class AppSecondaryFilledButton extends StatelessWidget {
  const AppSecondaryFilledButton({
    this.size,
    super.key,
    required this.labelText,
    required this.onPressed,
  });

  final String labelText;
  final VoidCallback? onPressed;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(
            size ??
                Size(259 / AdoptiveBreakPoint.dpr, 70 / AdoptiveBreakPoint.dpr),
          ),
          backgroundColor: WidgetStatePropertyAll(colorScheme.tertiary),
          foregroundColor :WidgetStatePropertyAll(colorScheme.onTertiary)
      ),
      child: Text(labelText),
    );
  }
}
