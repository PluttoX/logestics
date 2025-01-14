// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class MultipleselectDropdawonField extends StatefulWidget {
  const MultipleselectDropdawonField({
    super.key,
    this.hintText,
    required this.title,
    required this.tags,
    required this.checkbox,
  });

  final String title;
  final String? hintText;
  final List tags;
  final List checkbox;

  @override
  State<MultipleselectDropdawonField> createState() =>
      _MultipleselectDropdawonFieldState();
}

class _MultipleselectDropdawonFieldState
    extends State<MultipleselectDropdawonField> {
  late ColorNotifier notifier;

  List selected = [];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: notifier.text,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 7),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: notifier.getfillborder,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.symmetric(horizontal: 10),
              trailing: Icon(Icons.arrow_drop_down, color: notifier.text),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: selected.isEmpty
                    ? Text(
                        widget.hintText ?? "Select",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    : Row(
                        children: [
                          for (var value = 0; value < selected.length; value++)
                            Text(
                              "${selected[value]}, ",
                              style: TextStyle(
                                color: notifier.text,
                              ),
                            ),
                        ],
                      ),
              ),
              childrenPadding: EdgeInsets.all(10),
              children: [
                for (var i = 0; i < widget.tags.length; i++)
                  InkWell(
                    hoverColor: Color(0xFFf2f2f2),
                    onTap: () {
                      setState(() {
                        widget.checkbox[i] = !widget.checkbox[i];
                        if (widget.checkbox[i] == false) {
                          selected.remove(widget.tags[i]);
                        } else {
                          selected.add(widget.tags[i]);
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Checkbox(
                          value: widget.checkbox[i],
                          activeColor: Color(0xFF0f79f3),
                          side: BorderSide(
                            color: notifier.chakboxborder,
                            width: 2,
                          ),
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          onChanged: (value) {
                            setState(() {
                              widget.checkbox[i] = value;
                              if (widget.checkbox[i] == false) {
                                selected.remove(widget.tags[i]);
                              } else {
                                selected.add(widget.tags[i]);
                              }
                            });
                          },
                        ),
                        SizedBox(width: 10),
                        Text(
                          widget.tags[i],
                          style: TextStyle(color: notifier.text),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
