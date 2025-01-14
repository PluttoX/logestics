
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class NextPageButton extends StatefulWidget {
  const NextPageButton({
    super.key,
    required this.number1,
    required this.number2,
    required this.number3,
    required this.numberofpages,
    required this.backbutton,
    required this.nextbutton,
  });

  final String number1;
  final String number2;
  final String number3;
  final String numberofpages;
  final VoidCallback backbutton;
  final VoidCallback nextbutton;

  @override
  State<NextPageButton> createState() => _NextPageButtonState();
}

class _NextPageButtonState extends State<NextPageButton> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    if (width < 550) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Items per page : ",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 15,
                  fontFamily: "Outfit",
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              PopupMenuButton(
                tooltip: '',
                color: notifier.getBgColor,
                offset: const Offset(0, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.zero,
                elevation: 1,
                splashRadius: 1,
                shadowColor: Colors.grey,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.number1,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          color: notifier.text,
                          // color: Color(0xFF475569),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    value: 0,
                    child: Text(
                      widget.number1,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: notifier.text,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    value: 1,
                    child: Text(
                      widget.number2,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: notifier.text,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    value: 1,
                    child: Text(
                      widget.number3,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: notifier.text,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                widget.numberofpages,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                onTap: widget.backbutton,
                child: Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: widget.nextbutton,
                child: Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "Items per page : ",
                style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 15,
                  fontFamily: "Outfit",
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
              PopupMenuButton(
                tooltip: '',
                color: notifier.getBgColor,
                offset: const Offset(0, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.zero,
                elevation: 1,
                splashRadius: 1,
                shadowColor: Colors.grey,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.number1,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          color: notifier.text,
                          // color: Color(0xFF475569),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    value: 0,
                    child: Text(
                      widget.number1,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: notifier.text,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    value: 1,
                    child: Text(
                      widget.number2,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: notifier.text,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    value: 2,
                    child: Text(
                      widget.number3,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: notifier.text,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                widget.numberofpages,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: widget.backbutton,
                child: Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: widget.nextbutton,
                child: Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
