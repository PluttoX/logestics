// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/modules/ui_elements/Chips/chips_drag_and_drop/types.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';
import 'item_panel.dart';
import 'my_drop_region.dart';

class ChipsDragandDrop extends StatefulWidget {
  const ChipsDragandDrop({
    super.key,
    this.columns = 5,
    this.itemSpacing = 4.0,
  });

  final int columns;
  final double itemSpacing;

  @override
  State<ChipsDragandDrop> createState() => _ChipsDragandDropState();
}

class _ChipsDragandDropState extends State<ChipsDragandDrop> {
  
  late ColorNotifier notifier;
  
  Color color = Colors.green;

  final List<String> fruits = [
    'apple',
    'banana',
    'strawberry',
    'kiwi',
    'orange',
    'cherry'
  ];

  final List<String> upper = [];

  PanelLoction? dragStart;
  PanelLoction? dropPreView;
  String? hoveringData;

  void onDargStart(PanelLoction start) {
    final data = switch (start.$2) {
      Panel.lower => fruits[start.$1],
      Panel.upper => upper[start.$1],
    };
    setState(() {
      dragStart = start;
      hoveringData = data;
    });
  }

  void updateDropPreView(PanelLoction update) =>
      setState(() => dropPreView = update);

  @override
  Widget build(BuildContext context) {
    
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
                "Chips Drag & Drop",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(),
                width: constraints.maxWidth,
                child: Container(
                  decoration: BoxDecoration(),
                  width: constraints.maxWidth,
                  child: MyDropRegion(
                    updateDropPreView: updateDropPreView,
                    columns: 5,
                    childSize: Size(200, 10),
                    panel: Panel.lower,
                    child: ItemPanel(
                      crossAxisCount: 4,
                      spacing: 10,
                      dragStart:
                          dragStart?.$2 == Panel.lower ? dragStart : null,
                      items: fruits,
                      dropPreView:
                          dropPreView?.$2 == Panel.lower ? dropPreView : null,
                      hoveringData:
                          dropPreView?.$2 == Panel.lower ? hoveringData : null,
                      onDargStart: onDargStart,
                      panel: Panel.lower,
                    ),
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
