
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class AlertsWidget extends StatefulWidget {
  const AlertsWidget({
    super.key,
    required this.title,
    required this.text,
    this.bgColor,
    this.textColor,
    this.showleading,
    this.showtrailing,
    this.showRichtext,
  });
  final String title;
  final List text;
  final List<Color>? bgColor;
  final List<Color>? textColor;
  final bool? showleading;
  final bool? showtrailing;
  final bool? showRichtext;

  @override
  State<AlertsWidget> createState() => _AlertsWidgetState();
}

class _AlertsWidgetState extends State<AlertsWidget> {

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context,listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
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
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              ListView.separated(
                itemCount: widget.text.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: widget.bgColor == null
                          ? Colors.transparent
                          : widget.bgColor?[index],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: widget.textColor == null
                            ? Colors.transparent
                            : widget.textColor![index],
                        width: 0.3,
                      ),
                    ),
                    child: Row(
                      children: [
                        widget.showleading == true
                            ? Image.asset(
                                "assets/images/home.png",
                                color: widget.textColor == null
                                    ? Colors.white
                                    : widget.textColor?[index],
                                height: 20,
                              )
                            : Container(),
                        widget.showleading == true
                            ? SizedBox(width: 10)
                            : Container(),
                        widget.showRichtext == true
                            ? SizedBox(
                                width: constraints.maxWidth / 1.2,
                                child: RichText(
                                  maxLines: 2,
                                  text: TextSpan(
                                    text: widget.text[index],
                                    style: TextStyle(
                                      // fontSize: 15,
                                      color: widget.textColor == null
                                          ? Colors.white
                                          : widget.textColor?[index],
                                      fontFamily: "Outfit",
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: " an example linke. ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: "Give it a click if you like.",
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: constraints.maxWidth / 1.5,
                                child: Text(
                                  widget.text[index],
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: widget.textColor == null
                                        ? Colors.white
                                        : widget.textColor?[index],
                                    // fontSize: 15,
                                    fontFamily: "Outfit",
                                  ),
                                ),
                              ),
                        Spacer(),
                        widget.showtrailing == true
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.text.remove(widget.text[index]);
                                    widget.bgColor
                                        ?.remove(widget.bgColor?[index]);
                                    widget.textColor
                                        ?.remove(widget.textColor?[index]);
                                  });
                                },
                                child: Icon(
                                  Icons.close,
                                  size: 15,
                                  color: widget.textColor == null
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
