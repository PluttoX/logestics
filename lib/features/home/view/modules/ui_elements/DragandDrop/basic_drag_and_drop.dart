
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import 'custom_drag_drop_container.dart';

class BasicDragAndDrop extends StatefulWidget {
  const BasicDragAndDrop({super.key});

  @override
  State<BasicDragAndDrop> createState() => _BasicDragAndDropState();
}

class _BasicDragAndDropState extends State<BasicDragAndDrop> {
  Offset aroundposition = Offset(10, 20);
  
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier= Provider.of(context,listen: true);
    
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
                      left: aroundposition.dx,
                      top: aroundposition.dy,
                      child: Draggable(
                        feedback: Material(
                          color: Colors.transparent,
                          // color:notifier.getBgColor,
                          child: DargAndDropContainer(
                            text: "Darg me around",
                            showShadow: true,
                          ),
                        ),
                        childWhenDragging: Container(),
                        onDragEnd: (details) {
                          setState(() {
                            aroundposition = details.offset;
                          });
                        },
                        child: DargAndDropContainer(text: "Darg me around",),
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
