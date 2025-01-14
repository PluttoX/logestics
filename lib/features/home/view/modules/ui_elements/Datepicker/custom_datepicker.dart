
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/my_text_field.dart';

class CustomDatepicker extends StatefulWidget {
  CustomDatepicker({
    super.key,
    required this.controller,
    required this.selectedDate,
    this.labelText,
    this.showDownArrow,
    this.firstDate,
    this.enabledinput,
    this.enabledButton,
  });

  final TextEditingController controller;
  DateTime selectedDate;
  final String? labelText;
  final bool? showDownArrow;
  final DateTime? firstDate;
  final bool? enabledinput;
  final bool? enabledButton;

  @override
  State<CustomDatepicker> createState() => _CustomDatepickerState();
}

class _CustomDatepickerState extends State<CustomDatepicker> {
  late ColorNotifier notifier;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: notifier.getBgColor,
            ),
            colorScheme: ColorScheme.light(
              onSurface: notifier.text,
              surface: notifier.getBgColor,
              primary: Color(0xFF2B79F3),
            ), // body text color
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != widget.selectedDate) {
      setState(() {
        widget.selectedDate = picked;
        widget.controller.text = "${picked.month}/${picked.day}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return Stack(
      children: [
        MyTextFormField(
          textEditingController: widget.controller,
          labelText: widget.labelText ?? "Choose a data",
          hintText: "",
          enabled: widget.enabledinput ?? true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                widget.showDownArrow == true
                    ? Icons.keyboard_arrow_down_outlined
                    : Icons.calendar_today,
                color:
                    widget.enabledButton == false ? Colors.grey : notifier.text,
              ),
              onPressed: widget.enabledButton == false
                  ? null
                  : () => _selectDate(context),
            ),
          ],
        ),
      ],
    );
  }
}
