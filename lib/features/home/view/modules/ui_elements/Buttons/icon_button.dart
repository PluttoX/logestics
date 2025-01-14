
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.bgColor,
    required this.buttonWidth,
    required this.buttonHeight,
  });

  final List bgColor;
  final double buttonWidth;
  final double buttonHeight;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {

  late ColorNotifier notifier;

  List buttonText = [
    "unity",
    "Primary",
    "Accent",
    "Warn",
    "Disabled",
    "Link",
  ];

  @override
  Widget build(BuildContext context) {

    notifier= Provider.of(context,listen: true);

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
            "Extended Fab Buttons",
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
            spacing: 15.0,
            runSpacing: 10.0,
            children: [
              for (var i = 0; i < buttonText.length; i++)
                ElevatedButton.icon(
                  onPressed: i == 4 ? null : () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: widget.bgColor[i],
                      minimumSize:
                          Size(widget.buttonWidth, widget.buttonHeight),
                      foregroundColor: Colors.white,
                      overlayColor: Colors.white),
                  icon: SvgPicture.asset(
                    "assets/images/heart.svg",
                    height: 25,
                    color: i == 4 ? Color(0xFF979799) : Colors.white,
                  ),
                  label: Text(
                    buttonText[i],
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 16,
                      color: i == 4 ? Color(0xFF979799) : Colors.white,
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
