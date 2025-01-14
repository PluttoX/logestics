
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/my_text_field.dart';

class DatepickerOpenMethod extends StatefulWidget {
  const DatepickerOpenMethod({super.key});

  @override
  State<DatepickerOpenMethod> createState() => _DatepickerOpenMethodState();
}

class _DatepickerOpenMethodState extends State<DatepickerOpenMethod> {
  late ColorNotifier notifier;

  final TextEditingController datepickerOpenMethodController =
      TextEditingController();
  DateTime datepickerOpenMethodDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: datepickerOpenMethodDate,
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
    if (picked != null && picked != datepickerOpenMethodDate) {
      setState(() {
        datepickerOpenMethodDate = picked;
        datepickerOpenMethodController.text =
            "${picked.month}/${picked.day}/${picked.year}";
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
            "Datepicker Open Method",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: MyTextFormField(
                  textEditingController: datepickerOpenMethodController,
                  labelText: "Choose a data",
                  hintText: "",
                ),
              ),
              SizedBox(width: 10),
              CustomButton(
                text: "Open",
                textcolor: notifier.text,
                bgcolor: notifier.isDark ? Colors.black : Color(0xFFfdfbff),
                showButtonShadow: true,
                hovercolor: Color(0xFF0f79f3),
                height: 50,
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
