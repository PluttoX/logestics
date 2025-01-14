
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/modules/ui_elements/Buttons/square_button.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import 'block_buttons.dart';
import 'fab_buttons.dart';
import 'icon_button.dart';
import 'icon_buttons.dart';
import 'mini_fab_buttons.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  List extendedFabColor = [
    Color(0xFF0f79f3),
    Color(0xFF796df6),
    Color(0xFF343dff),
    Color(0xFFe74c3c),
    Color(0xFFa9adb3),
    Color(0xFF343dff),
  ];

  late List<Color> bgcolor;

  @override
  void initState() {
    super.initState();
    bgcolor = List.filled(7, Color(0xFFfdfbff));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    List darkColor = [
      Color(0xFF475569),
      Color(0xFF0f79f3),
      Color(0xFF796df6),
      Color(0xFF343dff),
      Color(0xFFe74c3c),
      Color(0xFF475569),
      Color(0xFFa9adb3),
    ];

    List flatFabColor = [
      Color(0xFF0f79f3),
      Color(0xFF796df6),
      Color(0xFF343dff),
      Color(0xFFe74c3c),
      Color(0xFFa9adb3),
      Color(0xFF475569),
    ];

    List blockdarkColor = [
      Color(0xFF475569),
      Color(0xFF0f79f3),
      Color(0xFF796df6),
      Color(0xFF343dff),
      Color(0xFFe74c3c),
      Color(0xFFa9adb3),
      Color(0xFF475569),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
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
                            "Buttons",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
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
                                        fontFamily: "Outfit",
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
                                  fontFamily: "Outfit",
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
                                "Buttons",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
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
                            "Buttons",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
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
                                        fontFamily: "Outfit",
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
                                  fontFamily: "Outfit",
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
                                "Buttons",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
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
              width < 950
                  ? Column(
                      children: [
                        SizedBox(
                          width: width,
                          child: SquareButton(
                            title: "Basic Buttons",
                            hoveredColor: darkColor,
                            textColor: darkColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: SquareButton(
                            title: "RaisedButtons",
                            textColor: darkColor,
                            bgColor: bgcolor,
                            hoveredColor: darkColor,
                            showShadow: true,
                            disabledbgColor: Color(0xFFe3e3e4),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: SquareButton(
                            title: "Stroked Buttons",
                            textColor: darkColor,
                            hoveredColor: darkColor,
                            borderColor: notifier.getfillborder,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: SquareButton(
                            title: "Flat Buttons",
                            bgColor: darkColor,
                            showShadow: true,
                            disabledbgColor: Color(0xFFe3e3e4),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(width: width, child: IconButtons()),
                        SizedBox(height: 20),
                        SizedBox(width: width, child: FabButtons()),
                        SizedBox(height: 20),
                        SizedBox(width: width, child: MiniFabButtons()),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: CustomIconButton(
                            bgColor: extendedFabColor,
                            buttonWidth: 80,
                            buttonHeight: 70,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: CustomIconButton(
                            bgColor: flatFabColor,
                            buttonWidth: 150,
                            buttonHeight: 60,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BlockButtons(
                            title: 'Block Basic Buttons',
                            textColor: blockdarkColor,
                            hoveredColor: blockdarkColor,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BlockButtons(
                            title: "Block Raised Buttons",
                            textColor: blockdarkColor,
                            bgColor: bgcolor,
                            hoveredColor: blockdarkColor,
                            showShadow: true,
                            disabledbgColor: Color(0xFFe3e3e4),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BlockButtons(
                            title: 'Block Stroked Buttons',
                            textColor: blockdarkColor,
                            hoveredColor: blockdarkColor,
                            borderColor: notifier.getfillborder,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: width,
                          child: BlockButtons(
                            title: "Block Flat Buttons",
                            bgColor: blockdarkColor,
                            disabledbgColor: Color(0xFFe3e3e4),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SquareButton(
                                title: "Basic Buttons",
                                hoveredColor: darkColor,
                                textColor: darkColor,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: SquareButton(
                                title: "RaisedButtons",
                                textColor: darkColor,
                                bgColor: bgcolor,
                                hoveredColor: darkColor,
                                showShadow: true,
                                disabledbgColor: Color(0xFFe3e3e4),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SquareButton(
                                title: "Stroked Buttons",
                                textColor: darkColor,
                                hoveredColor: darkColor,
                                borderColor: notifier.getfillborder,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: SquareButton(
                                title: "Flat Buttons",
                                bgColor: darkColor,
                                showShadow: true,
                                disabledbgColor: Color(0xFFe3e3e4),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Expanded(child: IconButtons()),
                            SizedBox(width: 20),
                            Expanded(child: FabButtons()),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: MiniFabButtons()),
                            SizedBox(width: 20),
                            Expanded(
                              child: CustomIconButton(
                                bgColor: extendedFabColor,
                                buttonWidth: 80,
                                buttonHeight: 60,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomIconButton(
                                bgColor: flatFabColor,
                                buttonWidth: 150,
                                buttonHeight: 50,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(child: Container()),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: BlockButtons(
                              title: 'Block Basic Buttons',
                              textColor: blockdarkColor,
                              hoveredColor: blockdarkColor,
                            )),
                            SizedBox(width: 20),
                            Expanded(
                              child: BlockButtons(
                                title: "Block Raised Buttons",
                                textColor: blockdarkColor,
                                bgColor: bgcolor,
                                hoveredColor: blockdarkColor,
                                showShadow: true,
                                disabledbgColor: Color(0xFFe3e3e4),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: BlockButtons(
                              title: 'Block Stroked Buttons',
                              textColor: blockdarkColor,
                              hoveredColor: blockdarkColor,
                              borderColor: notifier.getfillborder,
                            ),),
                            SizedBox(width: 20),
                            Expanded(
                              child: BlockButtons(
                                title: "Block Flat Buttons",
                                bgColor: blockdarkColor,
                                disabledbgColor: Color(0xFFe3e3e4),
                              ),
                            ),
                          ],
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
