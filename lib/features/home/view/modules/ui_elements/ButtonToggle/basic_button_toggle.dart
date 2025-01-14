
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/modules/ui_elements/ButtonToggle/toggle_button.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class BasicButtonToggle extends StatefulWidget {
  const BasicButtonToggle({super.key});

  @override
  State<BasicButtonToggle> createState() => _BasicButtonToggleState();
}

class _BasicButtonToggleState extends State<BasicButtonToggle> {
  
  late ColorNotifier notifier;
  
  final List<bool> _isSelected = [false, false, false];

  List basicButtonToggle = ["Bold", "Italic", "Underline"];

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
                selectedValues: _isSelected,
                text: basicButtonToggle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
