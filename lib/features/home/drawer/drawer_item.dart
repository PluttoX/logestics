
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Controllers/controllers.dart';
import '../theme/theme.dart';
import '../view/dashbord/e_commerece/e_commerce.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({
    super.key,
    required this.imageList,
    required this.titleList,
    this.controllerIndexlist,
    required this.hoverColor,
    required this.startIndex,
    this.svgindex,
  });

  final List imageList;
  final List titleList;
  final List? controllerIndexlist;
  final List<bool> hoverColor;
  final int startIndex;
  final int? svgindex;

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return ListView.builder(
      itemCount: widget.imageList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        int appsindex = index + widget.startIndex;
        return InkWell(
          overlayColor: WidgetStateColor.transparent,
          hoverColor: Colors.transparent,
          onHover: (value) {
            setState(() {
              widget.hoverColor[index] = value;
            });
          },
          onTap: () {
            setState(() {
              mainDrawerController.selectControllers = appsindex;
            });
            if (widget.controllerIndexlist != null) {
              if (width < 1200) {
                mainDrawerController
                    .updateSelectedIndex(widget.controllerIndexlist?[index]);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollController.jumpTo(0.0);
                });
                Navigator.pop(context);
              } else {
                mainDrawerController
                    .updateSelectedIndex(widget.controllerIndexlist?[index]);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollController.jumpTo(0.0);
                });
              }
            }
          },
          child: ListTile(
            mouseCursor: MouseCursor.defer,
            hoverColor: notifier.getHoverColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: Image.asset(
              widget.imageList[index],
              height: height / 45,
              color: mainDrawerController.selectControllers == appsindex
                  ? const Color(0xFF0f79f3)
                  : widget.hoverColor[index]
                      ? const Color(0xFF0f79f3)
                      : notifier.text,
            ),
            title: Text(
              widget.titleList[index],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                color: mainDrawerController.selectControllers == appsindex
                    ? Color(0xFF0f79f3)
                    : widget.hoverColor[index]
                        ? Color(0xFF0f79f3)
                        : notifier.text,
              ),
            ),
          ),
        );
      },
    );
  }
}
