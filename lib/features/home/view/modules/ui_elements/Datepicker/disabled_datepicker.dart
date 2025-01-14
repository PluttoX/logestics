
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import 'custom_datepicker.dart';

class DisabledDatepicker extends StatefulWidget {
  const DisabledDatepicker({super.key});

  @override
  State<DisabledDatepicker> createState() => _DisabledDatepickerState();
}

class _DisabledDatepickerState extends State<DisabledDatepicker> {
  // Popup Disabled
  final TextEditingController popupDisabledController = TextEditingController();
  DateTime popupDisabledDate = DateTime.now();

  // Popup Disabled
  final TextEditingController inputDisabledController = TextEditingController();
  DateTime inputDisabledDate = DateTime.now();

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

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
            "Disabled Datepicker",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          CustomDatepicker(
            controller: TextEditingController(),
            selectedDate: DateTime.now(),
            labelText: "Completely disabled",
            enabledButton: false,
            enabledinput: false,
          ),
          Text(
            "MM/DD/YYYY",
            style: TextStyle(color: notifier.text),
          ),
          SizedBox(height: 15),
          CustomDatepicker(
            controller: popupDisabledController,
            selectedDate: popupDisabledDate,
            labelText: "Popup disabled",
            enabledButton: false,
          ),
          Text(
            "MM/DD/YYYY",
            style: TextStyle(color: notifier.text),
          ),
          SizedBox(height: 15),
          CustomDatepicker(
            controller: inputDisabledController,
            selectedDate: inputDisabledDate,
            labelText: "Input disabled",
            enabledinput: false,
          ),
          Text(
            "MM/DD/YYYY",
            style: TextStyle(color: notifier.text),
          ),
        ],
      ),
    );
  }
}
