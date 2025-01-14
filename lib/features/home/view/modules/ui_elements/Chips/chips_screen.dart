
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import 'basic_avatar.dart';
import 'chips_autocomplete.dart';
import 'chips_drag_and_drop/chips_drag_and_drop.dart';
import 'custom_clips.dart';

class ChipsScreen extends StatefulWidget {
  const ChipsScreen({super.key});

  @override
  State<ChipsScreen> createState() => _ChipsScreenState();
}

class _ChipsScreenState extends State<ChipsScreen> {
  
  late ColorNotifier notifier;
  
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  List basicChlips = ["One fish", "Two fish", "Accent fish", "Warn fish"];

  List stackedChips = ["none", "Primary", "Accent", "Warn"];

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
                        "Chips",
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
                            "Chips",
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
                        "Chips",
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
                            "Chips",
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
          width < 800
              ? Column(
                  children: [
                    CustomClips(
                      title: "Basic Clips",
                      text: basicChlips,
                    ),
                    SizedBox(height: 20),
                    ChipsDragandDrop(),
                    SizedBox(height: 20),
                    CustomClips(
                      title: "Stacked Chips",
                      text: stackedChips,
                      showBlock: true,
                    ),
                    SizedBox(height: 20),
                    ChipsAutocomplete(
                      title: "Chips Autocomplete",
                      hintText: "New Fruit...",
                      labelText: "Favorite Fruits",
                      items: const ['Lemon'],
                    ),
                    SizedBox(height: 20),
                    ChipsAutocomplete(
                      title: "Chips with Form Control",
                      hintText: "New keyword...",
                      labelText: "Video keywords",
                      items: const [
                        "flutter",
                        "angular",
                        "how-to",
                        "tutorial",
                        "accessibility",
                      ],
                      showControl: true,
                    ),
                    SizedBox(height: 20),
                    BasicAvatar(),
                    SizedBox(height: 20),
                    ChipsAutocomplete(
                      title: "Chips with Input",
                      hintText: "New fruit..",
                      labelText: "Favorite Fruits",
                      items: const ["Lemon", "Lime", "Apple"],
                    ),
                  ],
                )
              : width < 1050
                  ? Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomClips(
                                    title: "Basic Clips",
                                    text: basicChlips,
                                  ),
                                  SizedBox(height: 20),
                                  ChipsDragandDrop(),
                                  SizedBox(height: 20),
                                  CustomClips(
                                    title: "Stacked Chips",
                                    text: stackedChips,
                                    showBlock: true,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: const [
                                  ChipsAutocomplete(
                                    title: "Chips Autocomplete",
                                    hintText: "New Fruit...",
                                    labelText: "Favorite Fruits",
                                    items: ['Lemon'],
                                  ),
                                  SizedBox(height: 20),
                                  ChipsAutocomplete(
                                    title: "Chips with Form Control",
                                    hintText: "New keyword...",
                                    labelText: "Video keywords",
                                    items: [
                                      "flutter",
                                      "angular",
                                      "how-to",
                                      "tutorial",
                                      "accessibility",
                                    ],
                                    showControl: true,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: const [
                                  BasicAvatar(),
                                  SizedBox(height: 20),
                                  ChipsAutocomplete(
                                    title: "Chips with Input",
                                    hintText: "New fruit..",
                                    labelText: "Favorite Fruits",
                                    items: ["Lemon", "Lime", "Apple"],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(child: Container()),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomClips(
                                title: "Basic Clips",
                                text: basicChlips,
                              ),
                              SizedBox(height: 20),
                              ChipsDragandDrop(),
                              SizedBox(height: 20),
                              CustomClips(
                                title: "Stacked Chips",
                                text: stackedChips,
                                showBlock: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: const [
                              ChipsAutocomplete(
                                title: "Chips Autocomplete",
                                hintText: "New Fruit...",
                                labelText: "Favorite Fruits",
                                items: ['Lemon'],
                              ),
                              SizedBox(height: 20),
                              ChipsAutocomplete(
                                title: "Chips with Form Control",
                                hintText: "New keyword...",
                                labelText: "Video keywords",
                                items: [
                                  "flutter",
                                  "angular",
                                  "how-to",
                                  "tutorial",
                                  "accessibility",
                                ],
                                showControl: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: const [
                              BasicAvatar(),
                              SizedBox(height: 20),
                              ChipsAutocomplete(
                                title: "Chips with Input",
                                hintText: "New fruit..",
                                labelText: "Favorite Fruits",
                                items: ["Lemon", "Lime", "Apple"],
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
