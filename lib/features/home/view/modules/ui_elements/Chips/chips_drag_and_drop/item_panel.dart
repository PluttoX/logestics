import 'dart:math';

import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/modules/ui_elements/Chips/chips_drag_and_drop/types.dart';
import 'package:provider/provider.dart';

import '../../../../../widget/mycontainers.dart';
import 'my_dragble_widget.dart';

class ItemPanel extends StatelessWidget {
  const ItemPanel({
    super.key,
    required this.crossAxisCount,
    required this.dragStart,
    required this.dropPreView,
    required this.hoveringData,
    required this.items,
    required this.onDargStart,
    required this.panel,
    required this.spacing,
  });

  final int crossAxisCount;
  final PanelLoction? dragStart;
  final PanelLoction? dropPreView;
  final String? hoveringData;
  final List<String> items;
  final double spacing;

  final Function(PanelLoction) onDargStart;
  final Panel panel;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    PanelLoction? dragStartCopy;
    PanelLoction? dropPreViewCopy;

    final itemsCopy = List<String>.from(items);

    if (dragStart != null) {
      dragStartCopy = dragStart!.copyWith();
    }

    if (dropPreView != null && hoveringData != null) {
      dropPreViewCopy =
          dropPreView!.copyWith(index: min(items.length, dropPreView!.$1));
      if (dragStartCopy?.$2 == dropPreViewCopy.$2) {
        itemsCopy.removeAt(dragStartCopy!.$1);
        dragStartCopy = null;
      }
      itemsCopy.insert(min(dropPreView!.$1, itemsCopy.length), hoveringData!);
    }

    return GridView.count(
      crossAxisCount: crossAxisCount,
      physics: NeverScrollableScrollPhysics(),
      mainAxisSpacing: spacing,
      crossAxisSpacing: spacing,
      shrinkWrap: true,
      childAspectRatio: (150 / 60),
      children: itemsCopy.asMap().entries.map<Widget>(
        (MapEntry<int, String> entry) {
          Widget child = Center(
            child: Text(
              entry.value,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: notifier.text
              ),
            ),
          );
          if (entry.key == dragStartCopy?.$1) {
            child = Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: notifier.getfillborder,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: child,
            );
          } else if (entry.key == dropPreViewCopy?.$1) {
            child = Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: notifier.getfillborder,
                ),
              ),
              child: child,
            );
          } else {
            child = Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: notifier.getfillborder,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: child,
            );
          }
          return Draggable(
            feedback: child,
            child: MyDraggbleWidget(
              data: entry.value,
              child: child,
              onDargStart: () => onDargStart((entry.key, panel)),
            ),
          );
        },
      ).toList(),
    );
  }
}
