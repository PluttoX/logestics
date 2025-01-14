
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class Popupbutton extends StatefulWidget {
  const Popupbutton({
    super.key,
    required this.items,
    this.title,
    this.child,
    this.textColor,
  });

  final List items;
  final String? title;
  final Widget? child;
  final Color? textColor;

  @override
  State<Popupbutton> createState() => _PopupbuttonState();
}

class _PopupbuttonState extends State<Popupbutton> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);
    return PopupMenuButton(
      tooltip: '',
      color: notifier.getBgColor,
      offset: const Offset(5, 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.zero,
      elevation: 1,
      splashRadius: 1,
      shadowColor: Colors.grey,
      constraints: BoxConstraints(
        maxWidth: 150,
        minWidth: 150,
      ),
      child: SizedBox(
        child: Row(
          children: [
            widget.title == null
                ? Container(child: widget.child ?? Container())
                : Text(
                    widget.title ?? "",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      color: widget.textColor ?? notifier.text,
                    ),
                  ),
            widget.title == null
                ? Container()
                : Icon(
                    Icons.keyboard_arrow_down,
                    color: widget.textColor ?? notifier.text,
                  ),
          ],
        ),
      ),
      itemBuilder: (context) => [
        for (var i = 0; i < widget.items.length; i++)
          PopupMenuItem(
            value: i,
            child: Text(
              widget.items[i],
              style: TextStyle(
                fontFamily: "Outfit",
                color: notifier.text,
              ),
            ),
          ),
      ],
    );
  }
}
