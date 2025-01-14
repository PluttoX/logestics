
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';

class MyImageCard extends StatefulWidget {
  const MyImageCard({
    super.key,
    required this.images,
    this.containerText,
    this.containerBgColor,
    this.containerBorderColor,
    this.containerTextColor,
  });
  final List? containerText;
  final List? containerBgColor;
  final List? containerBorderColor;
  final List? containerTextColor;
  final String images;

  @override
  State<MyImageCard> createState() => _MyImageCardState();
}

class _MyImageCardState extends State<MyImageCard> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {

    notifier = Provider.of(context,listen: true);

    return Container(
      height: 400,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(widget.images),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                                  widget.containerTextColor?[i] ?? Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
          Spacer(),
          Text(
            "Nesta Technologies",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "When you enter into any new area of science, you almost always any new area of science find.",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 16.5,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
