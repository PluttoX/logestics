
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';
import '../../../../../widget/custom_button.dart';

class CardAlignmentOption extends StatefulWidget {
  const CardAlignmentOption({
    super.key,
    required this.title,
    required this.alignmentStatus,
    required this.mainAxisAlignment,
     this.subtitle1, this.subtitle2,
  });
  final String title;
  final String alignmentStatus;
  final MainAxisAlignment mainAxisAlignment;
  final String? subtitle1;
  final String? subtitle2;

  @override
  State<CardAlignmentOption> createState() => _CardAlignmentOptionState();
}

class _CardAlignmentOptionState extends State<CardAlignmentOption> {
  
  late ColorNotifier notifier;
  
  @override
  Widget build(BuildContext context) {
    
    notifier = Provider.of(context,listen: true);
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(5, 6),
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color:notifier.text,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.alignmentStatus,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 17,
                  color: notifier.greytext,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              widget.subtitle1 == null
                  ? Container()
                  : Text(
                      widget.subtitle1 ?? "",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        height: 2,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
              widget.subtitle1 == null ? Container() : SizedBox(height: 10),
              widget.subtitle2 == null
                  ? Container()
                  : Text(
                      widget.subtitle2 ?? "",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 16,
                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
              widget.subtitle2 == null ? Container() : SizedBox(height: 10),
              Row(
                mainAxisAlignment: widget.mainAxisAlignment,
                children: [
                  CustomButton(
                    text: "LIKE",
                    onPressed: () {},
                    bgcolor: Color(0xFF0f79f3),
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    text: "SHARE",
                    onPressed: () {},
                    bgcolor: Color(0xFFe74c3c),
                    fonatweidth: FontWeight.normal,
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
