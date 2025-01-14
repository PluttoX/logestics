// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class CustomColorPicker extends StatefulWidget {
  CustomColorPicker({
    super.key,
    required this.title,
    this.selectedColor,
    this.child,
  });

  final String title;
  Color? selectedColor;

  final Widget? child;

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  late ColorNotifier notifier;

  // create some values
  Color currentColor = Color(0xff443a49);

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => widget.selectedColor = color);
  }

  TextEditingController textEditingController = TextEditingController();

  // Function to convert hex string to Color
  Color colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
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
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                style: TextStyle(color: notifier.text),
                cursorColor: notifier.text,
                controller: textEditingController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: widget.selectedColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 0.3,
                      color: notifier.getfillborder,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 0.3,
                      color: notifier.getfillborder,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: notifier.getfillborder,
                      width: 0.3,
                    ),
                  ),
                ),
                onTap: () {
                  showDialog(
                    builder: (context) => AlertDialog(
                      backgroundColor: notifier.getBgColor,
                      title: Text(
                        'Pick a color!',
                        style: TextStyle(
                          color: notifier.text,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: ColorPicker(
                          labelTextStyle: TextStyle(
                            color: notifier.text,
                          ),
                          pickerColor:
                              widget.selectedColor ?? notifier.getBgColor,
                          hexInputBar: true,
                          enableAlpha: true,
                          showLabel: true,
                          onColorChanged: changeColor,
                        ),
                      ),
                      actions: <Widget>[
                        Container(child: widget.child),
                      ],
                    ),
                    context: context,
                  );
                },
                onSubmitted: (value) {
                  setState(() {
                    try {
                      widget.selectedColor =
                          colorFromHex(textEditingController.text);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Invalid color code!')),
                      );
                    }
                  });
                },
              ),
              SizedBox(height: 15),
              Text(
                "Click in the input field.",
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
