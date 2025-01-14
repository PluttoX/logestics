
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import 'custom_drag_drop_container.dart';

class WithAHandle extends StatefulWidget {
  const WithAHandle({super.key});

  @override
  State<WithAHandle> createState() => _WithAHandleState();
}

class _WithAHandleState extends State<WithAHandle> {
  Offset aroundposition = Offset(10, 20);

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: 300,
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
                "Drag & Drop With a Handle",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Positioned(
                      left: aroundposition.dx,
                      top: aroundposition.dy,
                      child: Draggable(
                        feedback: Material(
                          color: Colors.transparent,
                          child: DargAndDropContainer(
                            text: "I can only be dragged\nusing the handle",
                            showShadow: true,
                          ),
                        ),
                        childWhenDragging: Container(),
                        onDragEnd: (details) {
                          setState(() {
                            aroundposition = details.offset;
                          });
                        },
                        child: DargAndDropContainer(
                          text: "I can only be dragged\nusing the handle",
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
