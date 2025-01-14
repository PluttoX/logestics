
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/modules/ui_elements/ButtonToggle/toggle_button.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class ButtonToggleSelectionMode extends StatefulWidget {
  const ButtonToggleSelectionMode({super.key});

  @override
  State<ButtonToggleSelectionMode> createState() =>
      _ButtonToggleSelectionModeState();
}

class _ButtonToggleSelectionModeState extends State<ButtonToggleSelectionMode> {
  List singalText = ["Red", "Green", "Blue"];
  List multipleText = ["Flour", "Eggs", "Sugar"];

  late List<bool> selectedValues;
  late List<bool> selectedValuesMultiple;

  late ColorNotifier notifier;

  @override
  void initState() {
    super.initState();
    selectedValues = List.filled(singalText.length, false);
    selectedValuesMultiple = List.filled(multipleText.length, false);
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
                "Button Toggle Selection Mode",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Single selection",
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
                text: singalText,
              ),
              SizedBox(height: 15),
              Text(
                "Multiple selection",
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
                selectedValues: selectedValuesMultiple,
                text: multipleText,
                multiSelect: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
