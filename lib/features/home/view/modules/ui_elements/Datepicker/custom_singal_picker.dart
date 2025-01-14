
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class CustomSingalPicker extends StatefulWidget {
  const CustomSingalPicker({
    super.key,
    required this.title,
    required this.child,
    required this.text,
  });

  final String title;
  final Widget child;
  final String text;

  @override
  State<CustomSingalPicker> createState() => _CustomSingalPickerState();
}

class _CustomSingalPickerState extends State<CustomSingalPicker> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              widget.child,
              Text(
                widget.text,
                style: TextStyle(color: notifier.text),
              ),
            ],
          ),
        );
      },
    );
  }
}
