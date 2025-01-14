
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/my_text_field.dart';

class CustomDateRangePicker extends StatefulWidget {
  CustomDateRangePicker({
    super.key,
    required this.dateController,
    required this.dateFormat,
    this.showActionButtons,
    this.selectedStartDate,
    this.selectedEndDate,
    this.labelText,
  });

  final TextEditingController dateController;
  final DateFormat dateFormat;
  final bool? showActionButtons;
  String? selectedStartDate;
  String? selectedEndDate;
  final String? labelText;

  @override
  State<CustomDateRangePicker> createState() => _CustomDateRangePickerState();
}

class _CustomDateRangePickerState extends State<CustomDateRangePicker> {
  late ColorNotifier notifier;

  void _showDateRangePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: notifier.getBgColor,
          content: SizedBox(
            height: 400,
            width: 400,
            child: SfDateRangePicker(
              todayHighlightColor: Color(0xFF0f79f3),
              monthCellStyle: DateRangePickerMonthCellStyle(
                blackoutDateTextStyle: TextStyle(
                  color: notifier.text,
                ),
                textStyle: TextStyle(color: notifier.text),
              ),
              headerStyle: DateRangePickerHeaderStyle(
                backgroundColor: notifier.getBgColor,
                textStyle: TextStyle(
                  color: notifier.text,
                ),
              ),
              backgroundColor: notifier.getBgColor,
              view: DateRangePickerView.month,
              selectionTextStyle: TextStyle(
                backgroundColor: Color(0xFF0f79f3),
              ),
              endRangeSelectionColor: Color(0xFF0f79f3),
              startRangeSelectionColor: Color(0xFF0f79f3),
              selectionMode: DateRangePickerSelectionMode.extendableRange,
              selectionColor: Color(0xFF0f79f3),
              rangeSelectionColor: Color(0xFFd7e3ff),
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                if (args.value is PickerDateRange) {
                  PickerDateRange range = args.value;
                  String startDate = range.startDate != null
                      ? widget.dateFormat.format(range.startDate!)
                      : 'Start Date';
                  String endDate = range.endDate != null
                      ? widget.dateFormat.format(range.endDate!)
                      : 'End Date';
                  setState(() {
                    widget.selectedStartDate = startDate;
                    widget.selectedEndDate = endDate;
                    widget.dateController.text = "$startDate  - $endDate";
                  });
                }
              },
              showActionButtons: widget.showActionButtons ?? false,
              onCancel: () {
                setState(() {
                  widget.dateController.clear();
                  widget.selectedStartDate = "null";
                  widget.selectedEndDate = "null";
                });
                Navigator.pop(context);
              },
              onSubmit: (Object? value) {
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return MyTextFormField(
      textEditingController: widget.dateController,
      labelText: widget.labelText ?? "Enter a date range",
      hintText: "Start date - End date",
      suffixIcon: IconButton(
        icon: Icon(
          Icons.calendar_today,
          color: notifier.text,
        ),
        onPressed: () {
          _showDateRangePicker(context);
        },
      ),
    );
  }
}
