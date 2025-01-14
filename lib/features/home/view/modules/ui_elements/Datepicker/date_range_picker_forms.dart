
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/my_text_field.dart';

final today = DateUtils.dateOnly(DateTime.now());

class DateRangePickerForms extends StatefulWidget {
  const DateRangePickerForms({super.key});

  @override
  State<DateRangePickerForms> createState() => _DateRangePickerFormsState();
}

class _DateRangePickerFormsState extends State<DateRangePickerForms> {
  late ColorNotifier notifier;

  final TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('MM/dd/yyyy');

  String? selectedDateRangestart;
  String? selectedDateRangeend;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
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
                "Date Range Picker Forms Integration",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              MyTextFormField(
                textEditingController: _dateController,
                labelText: "Enter a date range",
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
              ),
              Text(
                "MM/DD/YYYY - MM/DD/YYYY",
                style: TextStyle(color: notifier.text),
              ),
              SizedBox(height: 10),
              Text(
                'Selected range: { "start": "${selectedDateRangestart ?? "null"}", "end": "${selectedDateRangeend ?? "null"}" }',
                maxLines: 4,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDateRangePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        notifier = Provider.of(context, listen: true);

        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: notifier.getBgColor,
          content: SizedBox(
            height: 300,
            width: 400,
            child: SfDateRangePicker(
              monthCellStyle: DateRangePickerMonthCellStyle(
                blackoutDateTextStyle: TextStyle(
                  color: notifier.text,
                ),
                textStyle: TextStyle(color: notifier.text),

              ),
              headerStyle: DateRangePickerHeaderStyle(
                backgroundColor: notifier.getBgColor,
                textStyle: TextStyle(color: notifier.text),
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
                      ? _dateFormat.format(range.startDate!)
                      : 'Start Date';
                  String endDate = range.endDate != null
                      ? _dateFormat.format(range.endDate!)
                      : 'End Date';
                  setState(() {
                    selectedDateRangestart = startDate;
                    selectedDateRangeend = endDate;
                    _dateController.text =
                        "$selectedDateRangestart - $selectedDateRangeend";
                  });
                }
              },
              showActionButtons: false,
              onCancel: () {
                setState(() {
                  _dateController.clear();
                  selectedDateRangestart = "null";
                  selectedDateRangeend = "null";
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
}
