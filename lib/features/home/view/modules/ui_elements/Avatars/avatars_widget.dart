
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class AvatarsWidget extends StatefulWidget {
  const AvatarsWidget({
    super.key,
    required this.title,
    required this.name,
    this.text,
    this.circleAvatar,
  });

  final String title;
  final String name;
  final bool? text;
  final bool? circleAvatar;

  @override
  State<AvatarsWidget> createState() => _AvatarsWidgetState();
}

class _AvatarsWidgetState extends State<AvatarsWidget> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double avatarSize = maxWidth / 8;
        double imageSize = maxWidth / 5;
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Outfit",
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 10),
              widget.text == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (var size in [
                          imageSize,
                          imageSize * 0.9,
                          imageSize * 0.7,
                          imageSize * 0.5,
                          imageSize * 0.4,
                        ])
                          Container(
                            margin: EdgeInsets.only(right: size / 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                widget.circleAvatar == true
                                    ? size / 2
                                    : size * 0.15,
                              ),
                              color: notifier.lightbgcolor,
                            ),
                            width: size,
                            height: size,
                            child: Center(
                              child: Text(
                                'Ab',
                                style: TextStyle(
                                  fontSize: size / 5,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0f79f3),
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  : Row(
                      children: [
                        for (var size in [
                          imageSize,
                          imageSize * 0.9,
                          imageSize * 0.8,
                          imageSize * 0.7,
                          imageSize * 0.5,
                        ])
                          Padding(
                            padding: EdgeInsets.only(right: size / 7),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(size * 0.1),
                              child: Image.network(
                                widget.name,
                                width: size,
                                height: size,
                              ),
                            ),
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
