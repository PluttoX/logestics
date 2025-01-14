
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/modules/ui_elements/DragandDrop/with_a_handle.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import 'basic_drag_and_drop.dart';
import 'custom_group_drop.dart';
import 'custom_placeholder.dart';
import 'delayed_dragging.dart';
import 'drag_and_drop_boundary.dart';
import 'drag_and_drop_position_locking.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({super.key});

  @override
  State<DragAndDropScreen> createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  
  late ColorNotifier notifier;

  List<String> availableItems = [
    "Carrots",
    "Tomatoes",
    "Onions",
    "Apples",
    "Avocados",
  ];

  List<String> shoppingBasket = ["Oranges", "Bananas", "Cucumbers"];

  List<String> todo = [
    'Get to work',
    'Pick up groceries',
    'Go home',
    'Fall asleep',
  ];

  List<String> done = [
    'Get up',
    'Brush teeth',
    'Take a shower',
    'Check e-mail',
    'Walk dog',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context,listen: true);
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
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
                                "Drag & Drop",
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
                                    onTap: () => mainDrawerController
                                        .updateSelectedIndex(0),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    "Drag & Drop",
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
                                "Drag & Drop",
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
                                    onTap: () => mainDrawerController
                                        .updateSelectedIndex(0),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    height: 5,
                                    width: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    "Drag & Drop",
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
                  BasicDragAndDrop(),
                  SizedBox(height: 20),
                  DragAndDropPositionLocking(),
                  SizedBox(height: 20),
                  DragAndDropBoundary(),
                  SizedBox(height: 20),
                  CustomKanBen(
                    titleh: "Drag & Drop Connected Sorting",
                    subtitle1: "To do",
                    subtitle2: "Done",
                    list1: todo,
                    list2: done,
                  ),
                  SizedBox(height: 20),
                  CustomPlaceholder(),
                  SizedBox(height: 20),
                  DelayedDragging(),
                  SizedBox(height: 20),
                  CustomKanBen(
                    titleh: "Drag & Drop Disabled Sorting",
                    subtitle1: "Available items",
                    subtitle2: "Shopping basket",
                    list1: availableItems,
                    list2: shoppingBasket,
                  ),
                  SizedBox(height: 20),
                  WithAHandle(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
