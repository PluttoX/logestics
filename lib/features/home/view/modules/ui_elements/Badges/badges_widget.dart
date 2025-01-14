import 'package:badges/badges.dart' as badges;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class BadgesWidget extends StatefulWidget {
  final String title;
  final List? textColors;
  final List? bgColors;
  final List? borderColor;
  final bool? shapCricle;
  const BadgesWidget({
    super.key,
    required this.title,
    this.textColors,
    this.bgColors,
    this.borderColor,
    this.shapCricle,
  });

  @override
  State<BadgesWidget> createState() => _BadgesWidgetState();
}

class _BadgesWidgetState extends State<BadgesWidget> {

  late ColorNotifier notifier ;

  List text = [
    "unity",
    "Primary",
    "Secondary",
    "Success",
    "Danger",
    "Warning",
    "Info",
    "Light",
    "Dark",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

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
              for (var i = 0; i < text.length; i++)
                _buildBadge(
                  text[i],
                  BorderRadius.circular(widget.shapCricle == true ? 50 : 8),
                  widget.bgColors == null
                      ? Colors.transparent
                      : widget.bgColors?[i],
                  widget.textColors == null
                      ? (i == 5 || i == 6 || i == 7
                          ? Colors.black
                          : Colors.white)
                      : widget.textColors?[i],
                  widget.borderColor == null
                      ? Colors.transparent
                      : widget.borderColor?[i],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(
    String text,
    BorderRadius borderRadius,
    Color bgColor,
    Color textColor,
    Color borderColor,
  ) {
    return InkWell(
      onTap: () {},
      child: badges.Badge(
        badgeContent: Text(
          text,
          style: TextStyle(
            fontFamily: "Outfit",
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        badgeStyle: badges.BadgeStyle(
          badgeColor: bgColor,
          shape: badges.BadgeShape.square,
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: borderColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
        ),
      ),
    );
  }
}
