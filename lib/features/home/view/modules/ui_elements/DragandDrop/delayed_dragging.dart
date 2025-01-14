
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import 'custom_drag_drop_container.dart';

class DelayedDragging extends StatefulWidget {
  const DelayedDragging({super.key});

  @override
  State<DelayedDragging> createState() => _DelayedDraggingState();
}

class _DelayedDraggingState extends State<DelayedDragging> {
  bool delayedDragging = false;
  
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier = Provider.of(context,listen: true);
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delayed Dragging",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    delayedDragging = !delayedDragging;
                  });
                },
                child: DargAndDropContainer(
                  text: "Dragging Starts after\none second",
                  showShadow: delayedDragging,
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
