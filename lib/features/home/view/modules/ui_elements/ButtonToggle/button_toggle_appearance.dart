
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/modules/ui_elements/ButtonToggle/toggle_button.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class ButtonToggleAppearance extends StatefulWidget {
  const ButtonToggleAppearance({super.key});

  @override
  State<ButtonToggleAppearance> createState() => _ButtonToggleAppearanceState();
}

class _ButtonToggleAppearanceState extends State<ButtonToggleAppearance> {
  // For Basic Button Toggle
  final List<bool> _isSelected = [false, false, false];
  final List<bool> _isSelected1 = [false, false, false];

  late ColorNotifier notifier;

  List buttonToggleAppearance = ["Bold", "Italic", "Underline"];
  List appearance = ["Bold", "Italic", "Underline"];

  @override
  Widget build(BuildContext context) {

    notifier = Provider.of(context,listen: true);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color:notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:  [
              Text(
                "Button Toggle Appearance",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Wrap(
            runSpacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Default appearance : ",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 18,
                    color: Color(0xFF919da9),
                  ),
                ),
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(),
                child: ToggleButton(
                  selectedValues: _isSelected,
                  text: buttonToggleAppearance,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Wrap(
            runSpacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Legacy appearance : ",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 18,
                    color: Color(0xFF919da9),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: notifier.getBgColor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.fromDirection(6.5),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.3),
                      // color: notifier.text.withOpacity(0.3),
                    ),
                  ],
                ),
                height: 40,
                child: ToggleButtons(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  fillColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  selectedBorderColor: Colors.transparent,
                  isSelected: _isSelected1,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < _isSelected1.length; i++) {
                        _isSelected1[i] = i == index;
                      }
                    });
                  },
                  children: [
                    for (var i = 0; i < appearance.length; i++)
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            _isSelected1[i] == true
                                ? Icon(Icons.done, color: Colors.grey)
                                : Container(),
                            Text(
                              " ${appearance[i]}",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
