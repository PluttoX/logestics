
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class DargAndDropContainer extends StatefulWidget {
  const DargAndDropContainer({
    super.key,
    required this.text,
    this.showShadow,
    this.height,
    this.width,
  });

  final String text;
  final bool? showShadow;
  final double? height;
  final double? width;

  @override
  State<DargAndDropContainer> createState() => _DargAndDropContainerState();
}

class _DargAndDropContainerState extends State<DargAndDropContainer> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return Container(
      height: widget.height ?? 200,
      width: widget.width ?? 200,
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: notifier.getfillborder),
        boxShadow: [
          widget.showShadow == true
              ? BoxShadow(
                  offset: const Offset(5, 6),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                )
              : BoxShadow(),
        ],
      ),
      child: Center(
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(color: notifier.text),
        ),
      ),
    );
  }
}
