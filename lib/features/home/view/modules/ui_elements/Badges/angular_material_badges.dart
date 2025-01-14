
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';

class AngularMaterialBadges extends StatefulWidget {
  const AngularMaterialBadges({super.key});

  @override
  State<AngularMaterialBadges> createState() => _AngularMaterialBadgesState();
}

class _AngularMaterialBadgesState extends State<AngularMaterialBadges> {
  late ColorNotifier notifier;

  List angularMaterial = [
    "Text with a badge",
    "Text with large badge",
    "Button with a badge on the left",
    "Button toggles badge visibility",
    "Icon with a badge",
  ];

  bool buttonHide = false;

  List numbers = [4, 1, 8, 7, 15];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Accordion",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 20),
          ListView.separated(
            itemCount: angularMaterial.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return width < 450
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topRight,
                              children: [
                                Text(
                                  angularMaterial[index],
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 18,
                                    color: notifier.text,
                                  ),
                                ),
                                index < 2
                                    ? Positioned(
                                        top: -3,
                                        left: index == 0 ? 145 : 165,
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0f7bf4),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${numbers[index]}",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: "Outfit",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            index == 4
                                ? Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: notifier.text,
                                      ),
                                      Positioned(
                                        top: -8,
                                        right: -5,
                                        child: Container(
                                          height: 18,
                                          width: 18,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0f7bf4),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${numbers[index]}",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: "Outfit",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                        index == 2 || index == 3
                            ? Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  CustomButton(
                                    text: index == 2 ? "Action" : "Hide",
                                    bgcolor: notifier.isDark
                                        ? (index == 2
                                            ? Color(0xFF2B79F3)
                                            : Colors.black)
                                        : Color(0xFFfdfbff),
                                    hovercolor: Color(0xFF0f7bf4),
                                    width: 130,
                                    height: 50,
                                    onPressed: () {
                                      if (index == 3) {
                                        setState(() {
                                          buttonHide = !buttonHide;
                                        });
                                      }
                                    },
                                  ),
                                  index == 3 && buttonHide == true
                                      ? Container()
                                      : Positioned(
                                          top: -4,
                                          left: index == 3 ? 113 : -7,
                                          child: Container(
                                            height: 18,
                                            width: 18,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF0f7bf4),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${numbers[index]}",
                                                style: TextStyle(
                                                  // fontSize: 10,
                                                  fontFamily: "Outfit",
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              )
                            : Container(),
                      ],
                    )
                  : Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              angularMaterial[index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 18,
                                color: notifier.text,
                              ),
                            ),
                            index < 2
                                ? Positioned(
                                    top: -3,
                                    left: index == 0 ? 145 : 165,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0f7bf4),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${numbers[index]}",
                                          style: TextStyle(
                                            // fontSize: 10,
                                            fontFamily: "Outfit",
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(width: 10),
                        index == 2 || index == 3
                            ? Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CustomButton(textcolor: notifier.text,
                              text: index == 2 ? "Action" : "Hide",

                              bgcolor: notifier.isDark
                                  ? (index == 2
                                  ? Color(0xFF2B79F3)
                                  : Colors.black)
                                  : Color(0xFFfdfbff),
                              hovercolor: Color(0xFF0f7bf4),
                              width: 130,showButtonShadow: true,
                              height: 50,

                              onPressed: () {
                                if (index == 3) {
                                  setState(() {
                                    buttonHide = !buttonHide;
                                  });
                                }
                              },
                            ),
                            index == 3 && buttonHide == true
                                ? Container()
                                : Positioned(
                              top: -4,
                              left: index == 3 ? 113 : -7,
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0f7bf4),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    "${numbers[index]}",
                                    style: TextStyle(
                                      // fontSize: 10,
                                      fontFamily: "Outfit",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                            : Container(),
                       index == 4
                            ? Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: notifier.text,
                                  ),
                                  Positioned(
                                    top: -8,
                                    right: -5,
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0f7bf4),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${numbers[index]}",
                                          style: TextStyle(
                                            // fontSize: 10,
                                            fontFamily: "Outfit",
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);
            },
          ),
        ],
      ),
    );
  }
}
