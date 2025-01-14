
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';
import '../../../../../widget/custom_button.dart';

class MyCard extends StatefulWidget {
  const MyCard({
    super.key,
    this.title,
    this.containerText,
    this.containerBgColor,
    this.containerBorderColor,
    this.containerTextColor,
    this.images,
    this.buttonText,
    this.buttonTextColor,
    this.buttonColor,
    this.buttonBorderColor,
    this.buttonHoverColor,
    this.showButtonShadow,
    this.child,
  });
  final String? title;
  final List? containerText;
  final List? containerBgColor;
  final List? containerBorderColor;
  final List? containerTextColor;
  final String? images;
  final String? buttonText;
  final Color? buttonTextColor;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final Color? buttonHoverColor;
  final bool? showButtonShadow;
  final Widget? child;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  
  late ColorNotifier notifier;
  
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
          widget.title == null
              ? Container()
              : Text(
                  widget.title ?? "",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: notifier.text,
                  ),
                ),
          widget.title == null ? Container() : SizedBox(height: 15),
          widget.containerText == null
              ? Container()
              : Row(
                  children: [
                    for (int i = 0; i < widget.containerText!.length; i++)
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color:
                              widget.containerBgColor?[i] ?? Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: widget.containerBorderColor?[i] ??
                                Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.containerText![i],
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color:
                                  widget.containerTextColor?[i] ?? Colors.black,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
          widget.images == null
              ? (widget.containerText == null
                  ? Container()
                  : SizedBox(height: 15))
              : SizedBox(height: 15),
          widget.images == null
              ? Container()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.images ?? "assets/images/card1.jpg",
                  ),
                ),
          widget.images == null ? Container() : SizedBox(height: 15),
          Text(
            "Nesta Technologies",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "When you enter into any new area of science, you almost always any new area of science find.",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 16.5,
              color: Colors.grey,
            ),
          ),
          widget.buttonText == null && widget.child == null
              ? Container()
              : SizedBox(height: 15),
          widget.buttonText == null
              ? Container(child: widget.child)
              : CustomButton(
                  text: widget.buttonText ?? " ",
                  onPressed: () {},
                  bgcolor: widget.buttonColor ?? Colors.transparent,
                  showButtonShadow: widget.showButtonShadow ?? false,
                  buttonBorderColor:
                      widget.buttonBorderColor ?? Colors.transparent,
                  hovercolor: widget.buttonHoverColor ?? Colors.white,
                  textcolor: widget.buttonTextColor ?? Colors.white,
                ),
          // ElevatedButton(
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //         side: BorderSide(
          //           color: widget.buttonBorderColor ?? Colors.transparent,
          //         ),
          //         borderRadius: BorderRadius.circular(5),
          //       ),
          //       backgroundColor: widget.buttonColor ?? Colors.transparent,
          //       minimumSize: Size(120, 50),
          //       shadowColor: widget.showButtonShadow == true
          //           ? Colors.black
          //           : Colors.transparent,
          //       foregroundColor: widget.buttonHoverColor ?? Colors.white,
          //       overlayColor: widget.buttonHoverColor ?? Colors.white,
          //     ),
          //     child: Text(
          //       widget.buttonText ?? "",
          //       style: TextStyle(
          //         fontFamily: "Outfit",
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600,
          //         color: widget.buttonTextColor ?? Colors.white,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
