
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.isActive,
  });

  final String number;
  final String title;
  final String description;
  final bool isActive;

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier=Provider.of(context,listen: true);

    if (width < 800) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
              ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: widget.isActive == true
                          ? Color(0xFf0f79f3)
                          : Colors.transparent,
                      border: Border.all(
                        color: Color(0xFf0f79f3),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.number,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Outfit",
                          color: widget.isActive == true
                              ? Colors.white
                              : notifier.text,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 1,
                      // height: 70,
                      color: Color(0xFF0f79f3),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(),
                width: width < 950
                    ? null
                    : width < 1250
                        ? width / 8
                        : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Outfit",
                        color: notifier.text
                      ),
                    ),
                    Text(
                      widget.description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 16,
                        color: Color(0xFF949ba3),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
              // color: Colors.lime,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: widget.isActive == true
                          ? Color(0xFf0f79f3)
                          : Colors.transparent,
                      border: Border.all(
                        color: Color(0xFf0f79f3),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.number,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Outfit",
                          color: widget.isActive == true
                              ? Colors.white
                              : notifier.text,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      // width: 100,
                      color: Color(0xFF0f79f3),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: Colors.indigo.shade200,
                        ),
                    width: width < 950
                        ? null
                        : width < 1300
                            ? width / 8
                            : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Outfit",
                            color: notifier.text,
                          ),
                        ),
                        Text(
                          widget.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            color: Color(0xFF949ba3),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
