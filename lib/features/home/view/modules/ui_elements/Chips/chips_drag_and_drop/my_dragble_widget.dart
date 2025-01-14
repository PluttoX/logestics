import 'package:flutter/material.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class MyDraggbleWidget extends StatelessWidget {
  const MyDraggbleWidget({
    super.key,
    required this.data,
    required this.child,
    required this.onDargStart,
  });

  final String data;
  final Widget child;
  final Function() onDargStart;

  @override
  Widget build(BuildContext context) {
    return DragItemWidget(
      dragItemProvider: (DragItemRequest request) {
        onDargStart();
        final item = DragItem(
          localData: data,
        );

        item.add(Formats.plainText(data));

        return item;
      },
      dragBuilder: (context, child) => Opacity(opacity: 0.8, child: child),
      allowedOperations: () => [DropOperation.copy],
      child: DraggableWidget(child: child),
    );
  }
}
