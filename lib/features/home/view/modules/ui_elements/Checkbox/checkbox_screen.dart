
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import 'checkbox_with_reactive_forms.dart';
import 'color_checkbox.dart';
import 'indeterminate_checkbox.dart';
import 'my_checkbox.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier = Provider.of(context,listen: true);
    

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: width < 650 ? 55 : 40,
            width: width,
            child: width < 650
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Checkbox",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                mainDrawerController.updateSelectedIndex(0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/home.png",
                                  height: 15,
                                  color: Color(0xFF0f7bf4),
                                ),
                                Text(
                                  " Dashboard",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "UI Elements",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "Checkbox",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: notifier.text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Checkbox",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                mainDrawerController.updateSelectedIndex(0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/home.png",
                                  height: 15,
                                  color: Color(0xFF0f7bf4),
                                ),
                                Text(
                                  " Dashboard",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "UI Elements",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "Checkbox",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: notifier.text,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          SizedBox(height: 20),
          width < 850
              ? Column(
                  children: const [
                    MyCheckbox(title: "Basic Checkbox"),
                    SizedBox(height: 20),
                    MyCheckbox(
                      title: "Checkbox with Text",
                      showText: true,
                    ),
                    SizedBox(height: 20),
                    ColorCheckbox(),
                    SizedBox(height: 20),
                    IndeterminateCheckbox(),
                    SizedBox(height: 20),
                    CheckboxWithReactiveForms(),
                  ],
                )
              : width < 950
                  ? Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(
                              child: MyCheckbox(title: "Basic Checkbox"),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MyCheckbox(
                                title: "Checkbox with Text",
                                showText: true,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(child: ColorCheckbox()),
                            SizedBox(width: 20),
                            Expanded(child: IndeterminateCheckbox()),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: CheckboxWithReactiveForms()),
                            SizedBox(width: 20),
                            Expanded(child: Container()),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: const [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: MyCheckbox(
                                title: "Basic Checkbox",
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MyCheckbox(
                                title: "Checkbox with Text",
                                showText: true,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: ColorCheckbox(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: IndeterminateCheckbox()),
                            SizedBox(width: 20),
                            Expanded(child: CheckboxWithReactiveForms()),
                          ],
                        ),
                      ],
                    ),
        ],
      ),
    );
  }
}
