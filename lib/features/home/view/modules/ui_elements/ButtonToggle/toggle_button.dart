
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    required this.selectedValues,
    this.text,
    this.multiSelect,
    this.subTitle,
    this.textSelect,
    this.iconData,
  });

  final List<bool> selectedValues;
  final List? text;
  final bool? multiSelect;
  final String? subTitle;
  final List? textSelect;
  final List<IconData>? iconData;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late ColorNotifier notifier;

  int? bottomtext;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: ToggleButtons(
                splashColor: notifier.lightbgcolor,
                color: notifier.text,
                fillColor: notifier.lightbgcolor,
                borderRadius: BorderRadius.circular(30),
                borderColor: notifier.getfillborder,
                selectedBorderColor: notifier.getfillborder,
                isSelected: widget.selectedValues,
                onPressed: (int index) {
                  setState(() {
                    if (widget.multiSelect == true) {
                      widget.selectedValues[index] =
                          !widget.selectedValues[index];
                    } else {
                      for (int i = 0; i < widget.selectedValues.length; i++) {
                        widget.selectedValues[i] = i == index;
                      }
                      bottomtext = index;
                    }
                  });
                },
                children: [
                  for (var i = 0; i < widget.selectedValues.length; i++)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          widget.selectedValues[i] == true
                              ? Icon(Icons.done, color: notifier.text)
                              : Container(),
                          widget.text == null
                              ? Icon(
                                  widget.iconData?[i],
                                  color: notifier.text,
                                )
                              : Text(
                                  " ${widget.text![i]}",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontWeight: FontWeight.w600,
                                    color: notifier.text,
                                  ),
                                ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            widget.subTitle != null ? SizedBox(height: 15) : Container(),
            widget.subTitle != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.subTitle ?? "title : ",
                        style: TextStyle(
                          color: Color(0xFF9da6a7),
                          fontFamily: "Outfit",
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        bottomtext == null
                            ? ""
                            : "${widget.textSelect?[bottomtext!]}",
                        style: TextStyle(color: notifier.text),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
