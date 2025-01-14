
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../theme/theme.dart';

class DatepickerInlineCalendar extends StatefulWidget {
  const DatepickerInlineCalendar({super.key});

  @override
  State<DatepickerInlineCalendar> createState() =>
      _DatepickerInlineCalendarState();
}

class _DatepickerInlineCalendarState extends State<DatepickerInlineCalendar> {
  // final TextEditingController dateController =
  //   TextEditingController();
  DateTime selectedDate = DateTime.now();

  late ColorNotifier notifier;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
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
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
            "Datepicker Inline Calendar",
            // overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 400,
            child: SfDateRangePicker(
              headerStyle: DateRangePickerHeaderStyle(
                  backgroundColor: notifier.getBgColor,
                  textStyle: TextStyle(
                    color: notifier.text,
                  )),
              monthCellStyle: DateRangePickerMonthCellStyle(
                blackoutDateTextStyle: TextStyle(
                  color: notifier.text,
                ),
                textStyle: TextStyle(color: notifier.text),
              ),
              selectionColor: Color(0xFF0f79f3),
              backgroundColor: notifier.getBgColor,
              allowViewNavigation: true,
            ),
          ),
        ],
      ),
    );
  }
}
