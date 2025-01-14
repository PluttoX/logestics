
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/my_text_field.dart';

class YearMonthPicker extends StatefulWidget {
  const YearMonthPicker({super.key});

  @override
  State<YearMonthPicker> createState() => _YearMonthPickerState();
}

class _YearMonthPickerState extends State<YearMonthPicker> {
  late ColorNotifier notifier;

  TextEditingController monthandYearController = TextEditingController();
  DateTime monthandYearDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: monthandYearDate,
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
    if (picked != null && picked != monthandYearDate) {
      setState(() {
        monthandYearDate = picked;
        monthandYearController.text = "${picked.month}/${picked.year}";
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
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Datepicker Emulating a Year & Month Picker",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          MyTextFormField(
            textEditingController: monthandYearController,
            labelText: "Month and Year",
            hintText: "",
            suffixIcon: IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: notifier.text,
              ),
              onPressed: () => _selectDate(context),
            ),
          ),
          Text(
            "MM/YYYY",
            style: TextStyle(color: notifier.text),
          ),
        ],
      ),
    );
  }
}
