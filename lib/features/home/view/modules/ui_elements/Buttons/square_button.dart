
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';

class SquareButton extends StatefulWidget {
  const SquareButton({
    super.key,
    required this.title,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.showShadow,
    this.disabledbgColor,
    this.hoveredColor,
  });

  final String title;
  final List? textColor;
  final Color? borderColor;
  final List? bgColor;
  final bool? showShadow;
  final Color? disabledbgColor;
  final List? hoveredColor;

  @override
  State<SquareButton> createState() => _SquareButtonState();
}

class _SquareButtonState extends State<SquareButton> {

  late ColorNotifier notifier;

  List buttonText = [
    "Basic",
    "unity",
    "Primary",
    "Accent",
    "Warn",
    "Link",
    "Disabled",
  ];

  @override
  Widget build(BuildContext context) {

    notifier=Provider.of(context,listen: true);

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
            widget.title,
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
              for (var i = 0; i < buttonText.length; i++)
                CustomButton(
                  text: buttonText[i],
                  onPressed: i == 6 ? null : () {},
                  bgcolor: widget.bgColor?[i] ?? Colors.transparent,
                  buttonBorderColor: widget.borderColor ?? Colors.transparent,
                  hovercolor: widget.hoveredColor?[i] ?? Colors.white,
                  height: 50,
                  width: 120,
                  showButtonShadow: widget.showShadow,
                  textcolor: widget.textColor?[i] ??
                      (i == 6 ? Color(0xFFa9adb3) : Colors.white),
                  fonatweidth: FontWeight.normal,
                ),
                // ElevatedButton(
                //   onPressed: i == 6 ? null : () {},
                //   style: ElevatedButton.styleFrom(
                //     shape: RoundedRectangleBorder(
                //       side: BorderSide(
                //         color: widget.borderColor ?? Colors.transparent,
                //       ),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     backgroundColor: widget.bgColor == null
                //         ? Colors.transparent
                //         : widget.bgColor?[i],
                //     // elevation: 0,
                //     disabledBackgroundColor:
                //         widget.disabledbgColor ?? Colors.transparent,
                //     minimumSize: Size(120, 50),
                //     shadowColor: widget.showShadow == true
                //         ? Colors.black
                //         : Colors.transparent,
                //     foregroundColor: widget.hoveredColor == null
                //         ? Colors.white
                //         : widget.hoveredColor?[i],
                //     overlayColor: widget.hoveredColor == null
                //         ? Colors.white
                //         : widget.hoveredColor?[i],
                //   ),
                //   child: Text(
                //     buttonText[i],
                //     style: TextStyle(
                //       fontFamily: "Outfit",
                //       fontSize: 16,
                //       color: widget.textColor == null
                //           ? (i == 6 ? Color(0xFFa9adb3) : Colors.white)
                //           : widget.textColor?[i],
                //     ),
                //   ),
                // ),
            ],
          ),
        ],
      ),
    );
  }
}
