import 'package:flutter/material.dart';


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
    var dpr = MediaQuery.of(context).devicePixelRatio;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(
            Size(screenWidth * 0.14 , screenHeight * 0.08),
          ),

          backgroundColor: WidgetStatePropertyAll(colorScheme.tertiary),
          foregroundColor: WidgetStatePropertyAll(colorScheme.onTertiary)),
      child: Text(
        labelText,
        style: textTheme.labelLarge?.copyWith(
            fontSize: screenHeight * 0.0046 * screenWidth * 0.0046,
            color: colorScheme.onTertiary),
      ),
    );
  }
}
