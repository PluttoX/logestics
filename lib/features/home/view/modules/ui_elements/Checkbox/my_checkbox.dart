
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({
    super.key,
    required this.title,
    this.showText,
  });

  final String title;
  final bool? showText;

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  late List<bool> isActive;

  late ColorNotifier notifier;

  @override
  void initState() {
    isActive = List.filled(2, false);
    super.initState();
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
                "Basic Checkbox",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                children: [
                  for (var i = 0; i < isActive.length; i++)
                    SizedBox(
                      width: widget.showText == true ? 130 : 50,
                      child: Row(
                        children: [
                          Checkbox(
                            value: isActive[i],
                            activeColor: Color(0xFF0f79f3),
                            side: BorderSide(
                              color: notifier.chakboxborder,
                              width: 2,
                            ),
                            onChanged: i == 1
                                ? null
                                : (value) {
                                    setState(() {
                                      isActive[i] = value!;
                                    });
                                  },
                          ),
                          widget.showText == true
                              ? SizedBox(width: 10)
                              : Container(),
                          widget.showText == true
                              ? InkWell(
                                  onTap: i == 1
                                      ? null
                                      : () {
                                          setState(() {
                                            isActive[i] = !isActive[i];
                                          });
                                        },
                                  child: Text(
                                    "Check me!",
                                    style: TextStyle(
                                      color:
                                          i == 1 ? Colors.grey : notifier.text,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
