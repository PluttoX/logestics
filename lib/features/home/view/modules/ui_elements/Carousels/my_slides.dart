import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../theme/theme.dart';

class MySlides extends StatefulWidget {
  const MySlides({
    super.key,
    required this.title,
    required this.images,
    this.showIndicator,
    this.showbutton,
    this.viewportFraction,
    this.padding,
  });

  final String title;
  final List images;

  final bool? showIndicator;
  final bool? showbutton;
  final double? viewportFraction;
  final double? padding;

  @override
  State<MySlides> createState() => _MySlidesState();
}

class _MySlidesState extends State<MySlides> {
  final CarouselSliderController carouselController =
      CarouselSliderController();

  int currentIndex = 0;
  bool isHover1 = false;
  bool isHover2 = false;
  
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
                style: TextStyle(
                  color: notifier.text,
                  fontFamily: "Outfit",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(),
                width: constraints.maxWidth,
                height: width < 1600
                    ? 320
                    : width < 1995
                        ? 400
                        : 600,
                child: CarouselSlider(
                  carouselController: carouselController,
                  items: widget.images.map(
                    (i) {
                      return Container(
                        padding: EdgeInsets.all(widget.padding ?? 0),
                        decoration: BoxDecoration(),
                        width: constraints.maxWidth,
                        child: Image.asset(
                          i,
                          width: constraints.maxWidth,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ).toList(),
                  options: CarouselOptions(
                    height: constraints.maxHeight,
                    padEnds: false,
                    autoPlay: false,
                    aspectRatio: 16 / 10,
                    autoPlayCurve: Curves.linear,
                    viewportFraction: widget.viewportFraction ?? 1,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          currentIndex = index;
                        },
                      );
                    },
                  ),
                ),
              ),
              widget.showbutton == true ? SizedBox(height: 20) : Container(),
              widget.showbutton == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              isHover1 = value;
                            });
                          },
                          onTap: () {
                            carouselController.previousPage();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: isHover1
                                  ? Color(0xFF0f79f3)
                                  : notifier.lightbgcolor,
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/left.png",
                                color: isHover1 ? Colors.white : notifier.text,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              isHover2 = value;
                            });
                          },
                          onTap: () {
                            carouselController.nextPage();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: isHover2
                                  ? Color(0xFF0f79f3)
                                  : notifier.lightbgcolor,
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/right.png",
                                color: isHover2 ? Colors.white : notifier.text,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              widget.showIndicator == true ? SizedBox(height: 20) : Container(),
              widget.showIndicator == true
                  ? Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: widget.images.length,
                        effect: ColorTransitionEffect(
                          dotColor: notifier.lightbgcolor,
                          activeDotColor: Color(0xFF0f79f3),
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
