
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class FabButtons extends StatefulWidget {
  const FabButtons({super.key});

  @override
  State<FabButtons> createState() => _FabButtonsState();
}

class _FabButtonsState extends State<FabButtons> {

  late ColorNotifier notifier;

  List bgColor = [
    Color(0xFF0f79f3),
    Color(0xFF796df6),
    Color(0xFF343dff),
    Color(0xFFe74c3c),
    Color(0xFFa9adb3),
    Color(0xFF343dff),
  ];

  List suggestionText = [
    "unity",
    "Primary",
    "Accent",
    "Warn",
    "Disabled",
    "Link",
  ];

  @override
  Widget build(BuildContext context) {

    notifier = Provider.of(context,listen: true);

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
            "Fab Buttons",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              for (var i = 0; i < bgColor.length; i++)
                Tooltip(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(top: 10),
                  message: suggestionText[i],
                  textStyle: TextStyle(
                    fontFamily: "Outfit",
                    color: Colors.white,
                    fontSize: 11,
                  ),
                  child: SizedBox(
                    width: 60,
                    child: InkWell(
                      onTap: i == 4 ? null : () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: bgColor[i],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/heart.svg",
                            height: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
