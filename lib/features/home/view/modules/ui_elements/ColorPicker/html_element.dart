// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class HTMLElementView extends StatefulWidget {
  const HTMLElementView({super.key});

  @override
  State<HTMLElementView> createState() => _HTMLElementViewState();
}

class _HTMLElementViewState extends State<HTMLElementView> {
  late ColorNotifier notifier;

  Color currentColor = Color(0xFF4d5569);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => currentColor = color);
  }

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "HTML Element",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  setState(() {
                    showDialog(
                      builder: (context) => AlertDialog
                        (

                        backgroundColor: notifier.getBgColor,
                        title: Text(
                          'Pick a color!',
                          style: TextStyle(color: notifier.text),
                        ),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: currentColor,
                            labelTextStyle: TextStyle(
                              color: notifier.text,
                            ),
                            hexInputBar: true,
                            enableAlpha: true,
                            showLabel: true,
                            onColorChanged: changeColor,
                          ),
                        ),
                      ),
                      context: context,
                    );
                  });
                },
                child: Text(
                  "Chnage me!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: currentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
