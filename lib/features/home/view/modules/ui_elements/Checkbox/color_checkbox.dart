
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class ColorCheckbox extends StatefulWidget {
  const ColorCheckbox({super.key});

  @override
  State<ColorCheckbox> createState() => _ColorCheckboxState();
}

class _ColorCheckboxState extends State<ColorCheckbox> {
  
  late ColorNotifier notifier;
  
  List checkboxColor = [
    Color(0xFF0f79f3),
    Color(0xFF796df6),
    Color(0xFF6c757d),
    Color(0xFF2ed47e),
    Color(0xFF00cae3),
    Color(0xFFffb264),
    Color(0xFFe74c3c),
    Color(0xFF6c757d),
    Color(0xFF000000),
  ];

  late List isActive;

  @override
  void initState() {
    isActive = List.filled(checkboxColor.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    notifier = Provider.of(context,listen: true);
    
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
                "Color Checkbox",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                runSpacing: 10,
                spacing: 20,
                children: [
                  for (var i = 0; i < checkboxColor.length; i++)
                    Checkbox(
                      activeColor: checkboxColor[i],
                      side: BorderSide(
                        color: notifier.chakboxborder,
                        width: 2,
                      ),
                      value: isActive[i],
                      onChanged: (value) {
                        setState(() {
                          isActive[i] = value!;
                        });
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
