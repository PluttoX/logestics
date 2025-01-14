
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Controllers/controllers.dart';
import '../theme/theme.dart';
import '../view/dashbord/e_commerece/e_commerce.dart';

bool change = false;

class DrawerItemExpentiontile extends StatefulWidget {
  DrawerItemExpentiontile({
    super.key,
    required this.title,
    required this.images,
    required this.text,
    this.controllerIndexlist,
    required this.startIndex,
    required this.endIndex,
    required this.titleHover,
    required this.hoverColor,
    this.showSvg,
  });

  final String title;
  final String images;
  final bool? showSvg;
  final List text;
  final List? controllerIndexlist;
  bool titleHover;
  List<bool> hoverColor;
  final int startIndex;
  final int endIndex;

  @override
  State<DrawerItemExpentiontile> createState() =>
      _DrawerItemExpentiontileState();
}

class _DrawerItemExpentiontileState extends State<DrawerItemExpentiontile> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    widget.titleHover = value;
                  });
                },
                child: Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    trailing: Icon(
                      Icons.keyboard_arrow_down,
                      color: notifier.text,
                    ),
                    initiallyExpanded: mainDrawerController.selectControllers >=
                                widget.startIndex &&
                            mainDrawerController.selectControllers <=
                                widget.endIndex
                        ? true
                        : false,
                    tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: widget.showSvg == true
                        ? SvgPicture.asset(
                            widget.images,
                            height: height / 45,
                            color: mainDrawerController.selectControllers >=
                                        widget.startIndex &&
                                    mainDrawerController.selectControllers <=
                                        widget.endIndex
                                ? const Color(0xFF0f79f3)
                                : widget.titleHover
                                    ? const Color(0xFF0f79f3)
                                    : notifier.text,
                          )
                        : Image.asset(
                            widget.images,
                            height: height / 45,
                            color: mainDrawerController.selectControllers >=
                                        widget.startIndex &&
                                    mainDrawerController.selectControllers <=
                                        widget.endIndex
                                ? Color(0xFF0f79f3)
                                : widget.titleHover
                                    ? Color(0xFF0f79f3)
                                    : notifier.text,
                          ),
                    title: Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: mainDrawerController.selectControllers >=
                                    widget.startIndex &&
                                mainDrawerController.selectControllers <=
                                    widget.endIndex
                            ? Color(0xFF0f79f3)
                            : widget.titleHover
                                ? Color(0xFF0f79f3)
                                : notifier.text,
                      ),
                    ),
                    children: [
                      ListView.builder(
                        itemCount: widget.text.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          int builderIndex = index + widget.startIndex;
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: mainDrawerController.selectControllers ==
                                      builderIndex
                                  ? notifier.getHoverColor
                                  : widget.hoverColor[index]
                                      ? notifier.getHoverColor
                                      : Colors.transparent,
                            ),
                            child: InkWell(
                              hoverColor: notifier.getHoverColor,
                              borderRadius: BorderRadius.circular(8),
                              onHover: (value) {
                                setState(() {
                                  widget.hoverColor[index] = value;
                                });
                              },
                              onTap: () {
                                setState(() {
                                  if (width < 1200) {
                                    setState(() {
                                      mainDrawerController.updateSelectedIndex(
                                          widget.controllerIndexlist?[index]);
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        scrollController.jumpTo(0.0);
                                      });
                                      Navigator.pop(context);
                                    });
                                  }
                                  else {
                                    setState(() {
                                      mainDrawerController.updateSelectedIndex(
                                          widget.controllerIndexlist?[index]);
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        scrollController.jumpTo(0.0);
                                      });
                                    });
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(
                                        color: mainDrawerController
                                                    .selectControllers ==
                                                builderIndex
                                            ? const Color(0xFF0f79f3)
                                            : widget.hoverColor[index]
                                                ? const Color(0xFF0f79f3)
                                                : Colors.grey.shade400,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: constraints.maxWidth / 2,
                                      child: Text(
                                        widget.text[index],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: "Outfit",
                                          fontSize: 15,
                                          color: mainDrawerController
                                                      .selectControllers ==
                                                  builderIndex
                                              ? const Color(0xFF0f79f3)
                                              : widget.hoverColor[index]
                                                  ? const Color(0xFF0f79f3)
                                                  : notifier.text,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
