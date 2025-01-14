
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class IconButtons extends StatefulWidget {
  const IconButtons({super.key});

  @override
  State<IconButtons> createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {

  late ColorNotifier notifier;

  List iconColor = [
    Color(0xFF475569),
    Color(0xFF0f79f3),
    Color(0xFF796df6),
    Color(0xFF343dff),
    Color(0xFFe74c3c),
    Color(0xFFa9adb3),
    Color(0xFF475569),
  ];

  List suggestionText = [
    "Basic",
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
        color:notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Icon Buttons",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
              for (var i = 0; i < iconColor.length; i++)
                Tooltip(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.only(top: 3),
                  message: suggestionText[i],
                  textStyle: TextStyle(
                    fontFamily: "Outfit",
                    color: Colors.white,
                    fontSize: 11,
                  ),
                  child: IconButton(
                    onPressed: i == 5 ? null : () {},
                    icon: SvgPicture.asset(
                      "assets/images/heart.svg",
                      height: 25,
                      color: iconColor[i],
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
