
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class MyDropdownFormField extends StatelessWidget {
  const MyDropdownFormField({
    super.key,
    required this.titletext,
    // required this.select,
    required this.hinttext,
    required this.items,
    required this.onChanged,
    this.validator,
    this.validatorMode,
    this.initalValue,
  });

  final String titletext;
  final String? initalValue;
  // final String select;
  final String hinttext;
  final List<String> items;
  final ValueChanged? onChanged;
  final  String? Function(String?)? validator;
  final AutovalidateMode? validatorMode;


  @override
  Widget build(BuildContext context) {
  late ColorNotifier notifier;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titletext,
          style: TextStyle(
            color: notifier.text,
            // color: Color(0xFF475569),
            fontFamily: "Outfit",
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 7),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: notifier.getfillborder,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonFormField<String>(
            style: TextStyle(
              color: notifier.text,
              fontFamily: "Outfit",
            ),
            padding: EdgeInsets.zero,
            iconEnabledColor: notifier.text,
            dropdownColor: notifier.getBgColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: notifier.getfillborder),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF0165FC),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            hint: Text(
              hinttext,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: "Outfit",
              ),
            ),
            menuMaxHeight: 300,
            onChanged: onChanged,
            validator: validator,
            autovalidateMode:validatorMode,
             value: initalValue,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
