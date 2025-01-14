import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    super.key,
    this.titleText,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.textEditingController,
    this.textInputFormatter,
    this.enabled,
    this.validator,
    this.validatorMode,

  });

  final String? titleText;
  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? textInputFormatter;
  final bool? enabled;
  final  String? Function(String?)? validator;
  final AutovalidateMode? validatorMode;
  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleText == null
            ? Container()
            : Text(
                widget.titleText ?? "",
                style: TextStyle(
                  color: notifier.text,
                ),
                textAlign: TextAlign.start,
              ),
        widget.titleText == null ? Container() : const SizedBox(height: 7),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: notifier.getfillborder,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            enabled: widget.enabled ?? true,
            cursorColor: notifier.text,
            style: TextStyle(
              fontFamily: "Outfit",
              color: notifier.text,
            ),
            controller: widget.textEditingController ?? TextEditingController(),
            inputFormatters: widget.textInputFormatter ?? [],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: notifier.getfillborder,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff0165FC),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: widget.suffixIcon,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: notifier.text,
              ),
              labelText: widget.labelText,
              labelStyle: const TextStyle(
                color: Colors.grey,
              ),
              floatingLabelStyle: const TextStyle(
                color: Color(0xff0165FC),
              ),

            ),
            validator: widget.validator,
            autovalidateMode: widget.validatorMode,
          ),
        ),
      ],
    );
  }
}
