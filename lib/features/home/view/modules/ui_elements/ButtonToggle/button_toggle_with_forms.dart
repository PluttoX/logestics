
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/modules/ui_elements/ButtonToggle/toggle_button.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class ButtonToggleWithForms extends StatefulWidget {
  const ButtonToggleWithForms({super.key});

  @override
  State<ButtonToggleWithForms> createState() => _ButtonToggleWithFormsState();
}

class _ButtonToggleWithFormsState extends State<ButtonToggleWithForms> {
  List templatedrivenText = ["Bold", "Italic", "Underline"];
  List reactiveformText = ["Bold", "Italic", "Underline"];

  late List<bool> templateDriven;
  late List<bool> reactiveform;

  late ColorNotifier notifier ;

  @override
  void initState() {
    super.initState();
    templateDriven = List.filled(templatedrivenText.length, false);
    reactiveform = List.filled(reactiveformText.length, false);
  }

  @override
  Widget build(BuildContext context) {

    notifier=Provider.of(context,listen: true);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Button Toggle with Forms",
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
            "Button Toggle inside of a Template-driven form",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          ToggleButton(
            selectedValues: templateDriven,
            text: templatedrivenText,
            subTitle: "Chosen value is ",
            textSelect: templatedrivenText,
          ),
          SizedBox(height: 15),
          Text(
            "Button Toggle inside of a Reactive form",
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
            selectedValues: reactiveform,
            text: reactiveformText,
            subTitle: "Chosen value is ",
            textSelect: reactiveformText,
          ),
        ],
      ),
    );
  }
}
