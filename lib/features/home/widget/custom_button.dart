import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.bgcolor,
    this.textcolor,
    this.hovercolor,
    this.buttonBorderColor,
    this.showButtonShadow,
    this.width,
    this.height,
    this.fonatweidth,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? bgcolor;
  final Color? textcolor;
  final Color? hovercolor;
  final Color? buttonBorderColor;
  final bool? showButtonShadow;
  final double? width;
  final double? height;
  final FontWeight? fonatweidth;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: widget.buttonBorderColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: widget.bgcolor ?? Colors.transparent,
        minimumSize: Size(widget.width ?? 120, widget.height ?? 55),
        shadowColor:
            widget.showButtonShadow == true ? Colors.black : Colors.transparent,
        foregroundColor: widget.hovercolor ?? Colors.white,
        overlayColor: widget.hovercolor ?? Colors.white,
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          fontFamily: "Outfit",
          fontSize: 16,
          fontWeight: widget.fonatweidth ?? FontWeight.normal,
          color: widget.textcolor ?? Colors.white,
        ),
      ),
    );
  }
}
