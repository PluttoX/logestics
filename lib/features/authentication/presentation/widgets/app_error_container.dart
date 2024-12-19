import 'package:flutter/material.dart';
class AppErrorContainer extends StatelessWidget {
  const AppErrorContainer({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth, // Take max width from parent
          decoration: BoxDecoration(
            color: colorScheme.error,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              errorMessage,
              style: textTheme.labelMedium?.copyWith(color: colorScheme.onError),
            ),
          ),
        );
      },
    );
  }
}
