
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class CustomMultipulPicker extends StatefulWidget {
  const CustomMultipulPicker({
    super.key,
    required this.title,
    required this.child1,
    required this.child2,
    required this.text1,
    required this.text2,
    this.child3,
    this.text3,
  });

  final String title;
  final Widget child1;
  final Widget child2;
  final String text1;
  final String text2;
  final Widget? child3;
  final String? text3;

  @override
  State<CustomMultipulPicker> createState() => _CustomMultipulPickerState();
}

class _CustomMultipulPickerState extends State<CustomMultipulPicker> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

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
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          width < 800
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.child1,
                    Text(
                      widget.text1,
                      style: TextStyle(color: notifier.text),
                    ),
                    SizedBox(height: 20),
                    widget.child2,
                    Text(
                      widget.text2,
                      style: TextStyle(color: notifier.text),
                    ),
                    SizedBox(height: 20),
                    widget.child3 == null ? Container() : SizedBox(width: 20),
                    widget.child3 == null
                        ? Container()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widget.child3 ?? Container(),
                              Text(
                                widget.text3 ?? "",
                                style: TextStyle(color: notifier.text),
                              ),
                            ],
                          ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.child1,
                          Text(
                            widget.text1,
                            style: TextStyle(color: notifier.text),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.child2,
                          Text(
                            widget.text2,
                            style: TextStyle(color: notifier.text),
                          ),
                        ],
                      ),
                    ),
                    widget.child3 == null ? Container() : SizedBox(width: 20),
                    widget.child3 == null
                        ? Container()
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.child3 ?? Container(),
                                Text(
                                  widget.text3 ?? "",
                                  style: TextStyle(color: notifier.text),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
        ],
      ),
    );
  }
}
