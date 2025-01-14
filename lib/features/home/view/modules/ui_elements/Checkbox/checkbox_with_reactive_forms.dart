
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class CheckboxWithReactiveForms extends StatefulWidget {
  const CheckboxWithReactiveForms({super.key});

  @override
  State<CheckboxWithReactiveForms> createState() =>
      _CheckboxWithReactiveFormsState();
}

class _CheckboxWithReactiveFormsState extends State<CheckboxWithReactiveForms> {
  List text = ["Pepperoni", "Extra Cheese", "Mushroom"];

  late List isActive;

  late ColorNotifier notifier;

  @override
  void initState() {
    isActive = List.filled(text.length, false);
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
                "Checkboxes with Reactive Forms",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Select your toppings : ",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Wrap(
                children: [
                  for (var i = 0; i < text.length; i++)
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isActive[i],
                            activeColor: Color(0xFF0f79f3),
                            side: BorderSide(
                              color: notifier.chakboxborder,
                              width: 2,
                            ),
                            onChanged: (value) {
                              setState(() {
                                isActive[i] = value!;
                              });
                            },
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isActive[i] = !isActive[i];
                              });
                            },
                            child: Text(
                              text[i],
                              style: TextStyle(color: notifier.text),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "You chose : ",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Text(
                '{"pepperoni" : ${isActive[0]}, "extracheese" : ${isActive[1]}, "mushroom" : ${isActive[2]}}',
                maxLines: 3,
                style: TextStyle(color: notifier.text),
              ),
            ],
          ),
        );
      },
    );
  }
}
