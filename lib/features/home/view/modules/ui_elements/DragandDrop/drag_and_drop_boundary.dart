
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import 'custom_drag_drop_container.dart';

class DragAndDropBoundary extends StatefulWidget {
  const DragAndDropBoundary({super.key});

  @override
  State<DragAndDropBoundary> createState() => _DragAndDropBoundaryState();
}

class _DragAndDropBoundaryState extends State<DragAndDropBoundary> {
  Offset boundaryposition = Offset(0, 0);

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: 400,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Drag & Drop Boundary",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: notifier.getfillborder),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: boundaryposition.dx,
                        top: boundaryposition.dy,
                        child: GestureDetector(
                          onPanUpdate: (details) {
                            setState(() {
                              double newX =
                                  boundaryposition.dx + details.delta.dx;
                              double newY =
                                  boundaryposition.dy + details.delta.dy;
                              if (newX >= 0 &&
                                  newX <= constraints.maxWidth - 150) {
                                boundaryposition =
                                    Offset(newX, boundaryposition.dy);
                              }
                              if (newY >= 0 &&
                                  newY <= constraints.maxHeight - 150) {
                                boundaryposition =
                                    Offset(boundaryposition.dx, newY);
                              }
                            });
                          },
                          child: DargAndDropContainer(
                            text:
                                "I can only be dragged\nwithin the dotted\ncontainer",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
