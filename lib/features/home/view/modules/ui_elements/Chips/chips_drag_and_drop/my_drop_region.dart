
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logestics/features/home/view/modules/ui_elements/Chips/chips_drag_and_drop/types.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class MyDropRegion extends StatefulWidget {
  const MyDropRegion({
    super.key,
    required this.childSize,
    required this.columns,
    required this.panel,
    required this.updateDropPreView,
    required this.child,
  });

  final Size childSize;
  final int columns;
  final Panel panel;
  final void Function(PanelLoction) updateDropPreView;
  final Widget child;

  @override
  State<MyDropRegion> createState() => _MyDropRegionState();
}

class _MyDropRegionState extends State<MyDropRegion> {
  int? dropIndex;

  @override
  Widget build(BuildContext context) {
    return DropRegion(
      formats: Formats.standardFormats,
      onDropOver: (DropOverEvent event) {
        _updatePreview(event.position.local);
        return DropOperation.copy;
      },
      onPerformDrop: (PerformDropEvent event) async {},
      child: widget.child,
    );
  }

  void _updatePreview(Offset hoverPosition) {
    final int row = hoverPosition.dy ~/ widget.childSize.height;
    final int column = (hoverPosition.dx - (widget.childSize.width / 2)) ~/
        widget.childSize.width;

    int newDropIndex = (row * widget.columns) + column;

    if (newDropIndex != dropIndex) {
      dropIndex = newDropIndex;
      widget.updateDropPreView((dropIndex!, widget.panel));
    }
  }
}
