
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/modules/ui_elements/ButtonToggle/toggle_button.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class ExclusiveSelection extends StatefulWidget {
  const ExclusiveSelection({super.key});

  @override
  State<ExclusiveSelection> createState() => _ExclusiveSelectionState();
}

class _ExclusiveSelectionState extends State<ExclusiveSelection> {
  List<IconData> selectedValuesIcon = [
    Icons.format_align_left,
    Icons.format_align_center,
    Icons.format_align_right,
    Icons.format_align_justify,
  ];

  late ColorNotifier notifier;
  
  List selectedValuesText = ["left", "center", "right", "justify"];

  late List<bool> selectedValues;

  @override
  void initState() {
    super.initState();
    selectedValues = List.filled(selectedValuesIcon.length, false);
  }

  @override
  Widget build(BuildContext context) {
    
    notifier = Provider.of(context,listen: true);
    
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Button Toggle",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              ToggleButton(
                selectedValues: selectedValues,
                iconData: selectedValuesIcon,
                subTitle: "Selected value : ",
                textSelect: selectedValuesText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
