
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class IndeterminateCheckbox extends StatefulWidget {
  const IndeterminateCheckbox({super.key});

  @override
  State<IndeterminateCheckbox> createState() => _IndeterminateCheckboxState();
}

class _IndeterminateCheckboxState extends State<IndeterminateCheckbox> {
  late ColorNotifier notifier;

  bool isActive = false;

  List text = ["Primary", "Accent", "Warn"];

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
                "Indeterminate Checkbox",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isActive,
                    activeColor: Color(0xFF0f79f3),
                    side: BorderSide(
                      color: notifier.chakboxborder,
                      width: 2,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isActive = value!;
                      });
                    },
                  ),
                  SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isActive=!isActive;
                      });
                    },
                    child: Text(
                      "Indeterminate",
                      style: TextStyle(color: notifier.text),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  for (var i = 0; i < text.length; i++)
                    StatefulBuilder(
                      builder: (context, setState) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 40, bottom: 10),
                          child: Row(
                            children: [
                              Checkbox(
                                activeColor: i == 2
                                    ? Color(0xFFe74c3c)
                                    : Color(0xFF0f79f3),
                                side: BorderSide(
                                  color: notifier.chakboxborder,
                                  width: 2,
                                ),
                                value: isActive,
                                onChanged: (value) {
                                  setState(() {
                                    isActive = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 15),
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    isActive = !isActive;
                                  });
                                },
                                child: Text(
                                  text[i],
                                  style: TextStyle(
                                    color: notifier.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
