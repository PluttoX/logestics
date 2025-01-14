
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/my_text_field.dart';

class DatepickerWithDifferentLocale extends StatefulWidget {
  const DatepickerWithDifferentLocale({super.key});

  @override
  State<DatepickerWithDifferentLocale> createState() =>
      _DatepickerWithDifferentLocaleState();
}

class _DatepickerWithDifferentLocaleState
    extends State<DatepickerWithDifferentLocale> {
  late ColorNotifier notifier;

  TextEditingController differentLocaleController = TextEditingController();
  DateTime differentLocaleDate = DateTime.now();

  bool switchtoFrench = false;

  DateTime? picked;

  Future<void> _selectDate(BuildContext context) async {
    picked = await showDatePicker(
      context: context,
      initialDate: differentLocaleDate,
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
    if (picked != null && picked != differentLocaleDate) {
      setState(() {
        differentLocaleDate = picked!;
        switchtoFrench == true
            ? differentLocaleController.text =
                "${picked?.day}/${picked?.month}/${picked?.year}"
            : differentLocaleController.text =
                "${picked?.year}/${picked?.month}/${picked?.day}";
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
            "Datepicker with Different Locale",
            // overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          MyTextFormField(
            textEditingController: differentLocaleController,
            labelText: "Different Locale",
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
            switchtoFrench == true ? "DD/MM/YYYY" : "YYYY/MM/DD",
            style: TextStyle(color: notifier.text),
          ),
          CustomButton(
            text: "Switch to French",
            textcolor: notifier.text,
            hovercolor: Color(0xFF0f79f3),
            onPressed: () {
              setState(() {
                switchtoFrench = !switchtoFrench;
                switchtoFrench == true
                    ? differentLocaleController.text =
                        "${picked?.day}/${picked?.month}/${picked?.year}"
                    : differentLocaleController.text =
                        "${picked?.year}/${picked?.month}/${picked?.day}";
              });
            },
          ),
        ],
      ),
    );
  }
}
