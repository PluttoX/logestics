
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';
import 'custom_color_picker.dart';
import 'html_element.dart';

class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({super.key});

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  
  late ColorNotifier notifier;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context,listen: true);

    Color cancelbutton = notifier.getBgColor;

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
                        "Color Picker",
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
                            "Color Picker",
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
                        "Color Picker",
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
                            "Color Picker",
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
          width < 650
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomColorPicker(
                      title: "Basic Picker",
                      selectedColor: notifier.getBgColor,
                    ),
                    SizedBox(height: 20),
                    CustomColorPicker(
                      title: "Grayscale Color Mode",
                      selectedColor: notifier.getBgColor,
                    ),
                    SizedBox(height: 20),
                    CustomColorPicker(
                      title: "Color Code Input Field",
                      selectedColor: notifier.getBgColor,
                    ),
                    SizedBox(height: 20),
                    CustomColorPicker(
                      title: "RGB Color Input Field",
                      selectedColor: notifier.getBgColor,
                    ),
                    SizedBox(height: 20),
                    CustomColorPicker(
                      title: "Changing Dialog Position",
                      selectedColor: notifier.getBgColor,
                    ),
                    SizedBox(height: 20),
                    CustomColorPicker(
                      title: "Show OK Button",
                      selectedColor: notifier.getBgColor,
                      child: CustomButton(
                        text: "OK",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        bgcolor: Color(0xFF0f79f3),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomColorPicker(
                      title: "Show Cancel Button",
                      selectedColor: cancelbutton,
                      child: CustomButton(
                        text: "Cancel",
                        onPressed: () {
                          setState(() {
                            cancelbutton = notifier.getBgColor;
                            Navigator.pop(context);
                          });
                        },
                        bgcolor: Color(0xFF0f79f3),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomColorPicker(
                      title: "Enable Eye Dropper",
                      selectedColor: notifier.getBgColor,
                    ),
                    SizedBox(height: 20),
                    CustomColorPicker(
                      title: "With Preset Colors",
                      selectedColor: notifier.getBgColor,
                    ),
                    SizedBox(height: 20),
                    HTMLElementView(),
                  ],
                )
              : width < 900
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CustomColorPicker(
                                title: "Basic Picker",
                                selectedColor: notifier.getBgColor,
                              ),
                              SizedBox(height: 20),
                              CustomColorPicker(
                                title: "Color Code Input Field",
                                selectedColor: notifier.getBgColor,
                              ),
                              SizedBox(height: 20),
                              CustomColorPicker(
                                title: "Changing Dialog Position",
                                selectedColor: notifier.getBgColor,
                              ),
                              SizedBox(height: 20),
                              CustomColorPicker(
                                title: "Show Cancel Button",
                                selectedColor: cancelbutton,
                                child: CustomButton(
                                  text: "Cancel",
                                  onPressed: () {
                                    setState(() {
                                      cancelbutton = notifier.getBgColor;
                                      Navigator.pop(context);
                                    });
                                  },
                                  bgcolor: Color(0xFF0f79f3),
                                ),
                              ),
                              SizedBox(height: 20),
                              CustomColorPicker(
                                title: "With Preset Colors",
                                selectedColor: notifier.getBgColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              CustomColorPicker(
                                title: "Grayscale Color Mode",
                                selectedColor: notifier.getBgColor,
                              ),
                              SizedBox(height: 20),
                              CustomColorPicker(
                                title: "RGB Color Input Field",
                                selectedColor: notifier.getBgColor,
                              ),
                              SizedBox(height: 20),
                              CustomColorPicker(
                                title: "Show OK Button",
                                selectedColor: notifier.getBgColor,
                                child: CustomButton(
                                  text: "OK",
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  bgcolor: Color(0xFF0f79f3),
                                ),
                              ),
                              SizedBox(height: 20),
                              CustomColorPicker(
                                title: "Enable Eye Dropper",
                                selectedColor: notifier.getBgColor,
                              ),
                              SizedBox(height: 20),
                              HTMLElementView(),
                            ],
                          ),
                        ),
                      ],
                    )
                  : width < 1050
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  CustomColorPicker(
                                    title: "Basic Picker",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "RGB Color Input Field",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "Show Cancel Button",
                                    selectedColor: cancelbutton,
                                    child: CustomButton(
                                      text: "Cancel",
                                      onPressed: () {
                                        setState(() {
                                          cancelbutton = notifier.getBgColor;
                                          Navigator.pop(context);
                                        });
                                      },
                                      bgcolor: Color(0xFF0f79f3),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  HTMLElementView(),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  CustomColorPicker(
                                    title: "Grayscale Color Mode",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "Changing Dialog Position",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "Enable Eye Dropper",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  CustomColorPicker(
                                    title: "Color Code Input Field",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "Show OK Button",
                                    selectedColor: notifier.getBgColor,
                                    child: CustomButton(
                                      text: "OK",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      bgcolor: Color(0xFF0f79f3),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "With Preset Colors",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  CustomColorPicker(
                                    title: "Basic Picker",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "Changing Dialog Position",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "With Preset Colors",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  CustomColorPicker(
                                    title: "Grayscale Color Mode",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "Show OK Button",
                                    selectedColor: notifier.getBgColor,
                                    child: CustomButton(
                                      text: "OK",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      bgcolor: Color(0xFF0f79f3),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  HTMLElementView(),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  CustomColorPicker(
                                    title: "Color Code Input Field",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "Show Cancel Button",
                                    selectedColor: cancelbutton,
                                    child: CustomButton(
                                      text: "Cancel",
                                      onPressed: () {
                                        setState(() {
                                          cancelbutton = notifier.getBgColor;
                                          Navigator.pop(context);
                                        });
                                      },
                                      bgcolor: Color(0xFF0f79f3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  CustomColorPicker(
                                    title: "RGB Color Input Field",
                                    selectedColor: notifier.getBgColor,
                                  ),
                                  SizedBox(height: 20),
                                  CustomColorPicker(
                                    title: "Enable Eye Dropper",
                                    selectedColor: notifier.getBgColor,
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
