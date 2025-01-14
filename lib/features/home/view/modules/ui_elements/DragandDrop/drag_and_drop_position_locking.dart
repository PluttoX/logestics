
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import 'custom_drag_drop_container.dart';

class DragAndDropPositionLocking extends StatefulWidget {
  const DragAndDropPositionLocking({super.key});

  @override
  State<DragAndDropPositionLocking> createState() =>
      _DragAndDropPositionLockingState();
}

class _DragAndDropPositionLockingState
    extends State<DragAndDropPositionLocking> {
  late ColorNotifier notifier;

  Offset verticalPosition = Offset(0, 20);
  Offset horizontalPosition = Offset(220, 20);

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: 280,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Drag & Drop",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: verticalPosition.dx,
                      top: verticalPosition.dy,
                      child: Draggable(
                        axis: Axis.vertical,
                        feedback: Material(
                          color: Colors.transparent,
                          child: DargAndDropContainer(
                            text: "I can only be dragged\nup/down",
                            showShadow: true,
                          ),
                        ),
                        childWhenDragging: Container(),
                        onDraggableCanceled: (velocity, offset) {
                          setState(() {
                            verticalPosition =
                                Offset(verticalPosition.dx, offset.dy);
                          });
                        },
                        child: DargAndDropContainer(
                          text: "I can only be dragged\nup/down",
                        ),
                      ),
                    ),
                    Positioned(
                      left: horizontalPosition.dx,
                      top: horizontalPosition.dy,
                      child: Draggable(
                        axis: Axis.horizontal,
                        feedback: Material(
                          color: Colors.transparent,
                          child: DargAndDropContainer(
                            text: "I can only be dragged\nleft/right",
                            showShadow: true,
                          ),
                        ),
                        childWhenDragging: Container(),
                        onDraggableCanceled: (velocity, offset) {
                          setState(() {
                            horizontalPosition =
                                Offset(offset.dx, horizontalPosition.dy);
                          });
                        },
                        child: DargAndDropContainer(
                          text: "I can only be dragged\nleft/right",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
