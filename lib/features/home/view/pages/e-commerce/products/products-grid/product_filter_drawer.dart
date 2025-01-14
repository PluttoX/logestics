// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../../../../theme/theme.dart';
import '../../../../../widget/Searchfield.dart';

class ProductFilterDrawer extends StatefulWidget {
  const ProductFilterDrawer({super.key});

  @override
  State<ProductFilterDrawer> createState() => _ProductFilterDrawerState();
}

class _ProductFilterDrawerState extends State<ProductFilterDrawer> {
  late ColorNotifier notifier;

  RangeValues currentRangeValues = RangeValues(10, 4500);

  late List<bool> itemsSelect;
  late List<bool> categoriesSelect;
  late List<bool> brandsSelect;
  late List<bool> colorsSelect;
  late List<bool> ratingsSelect;

  @override
  void initState() {
    super.initState();
    itemsSelect = List<bool>.filled(itemsfor.length, false);
    categoriesSelect = List<bool>.filled(categories.length, false);
    brandsSelect = List<bool>.filled(brands.length, false);
    colorsSelect = List<bool>.filled(colors.length, false);
    ratingsSelect = List<bool>.filled(ratings.length, false);
  }

  List itemsfor = ["Womwen", "Men", "Kids", "Accessories"];

  List categories = [
    "All",
    "Electronics",
    "Accessories",
    "Sports",
    "Games",
    "Computers",
    "Mobile",
  ];

  List categoriesCounts = [
    "246",
    "85",
    "99",
    "27",
    "16",
    "38",
    "24",
  ];

  List brands = [
    "All",
    "Adidas",
    "Banboo",
    "Canin",
    "Debilop",
    "Emburo",
    "Fediz",
  ];

  List brandsCounts = [
    "156",
    "34",
    "26",
    "19",
    "29",
    "10",
    "13",
  ];

  List<Color> colors = [
    Color(0xFF000000),
    Color(0xFFFFFFFF),
    Color(0xFFd32030),
    Color(0xFF2ed47e),
    Color(0xFF0f79f3),
    Color(0xFFf67c00),
    Color(0xFFffe500),
    Color(0xFFff00b8),
    Color(0xFF796df6),
    Color(0xFF00cae3),
  ];

  List ratings = [5.0, 4.0, 3.0, 2.0, 1.0];

  List ratingCounts = ["145", "75", "12", "5", "3"];

  void updateItemsFor(index) {
    setState(() {
      itemsSelect[index] = !itemsSelect[index];
    });
  }

  void updateCategories(index) {
    setState(() {
      categoriesSelect[index] = !categoriesSelect[index];
    });
  }

  void updateBrands(index) {
    setState(() {
      brandsSelect[index] = !brandsSelect[index];
    });
  }

  void updateColors(index) {
    setState(() {
      colorsSelect[index] = !colorsSelect[index];
    });
  }

  void updateRatings(index) {
    setState(() {
      ratingsSelect[index] = !ratingsSelect[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.mainBgColor,
      appBar: width < 950
          ? AppBar(
              backgroundColor: notifier.mainBgColor,
              centerTitle: true,
              title: Text(
                "Filter",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
            )
          : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: notifier.getBgColor,
              borderRadius: BorderRadius.circular(width < 950 ? 0 : 10),
            ),
            child: SingleChildScrollView(
              physics: width < 950
                  ? ScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  width < 950
                      ? Container()
                      : Text(
                          "Filter",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: notifier.text,
                          ),
                        ),
                  width < 950 ? Container() : SizedBox(height: 15),
                  Text(
                    "Search",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  SizedBox(height: 10),
                  Searchfield(),
                  SizedBox(height: 10),
                  Text(
                    "Items for",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: itemsfor.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(),
                        width: constraints.maxWidth,
                        height: 40,
                        child: Row(
                          children: [
                            Checkbox(
                              overlayColor: WidgetStateColor.transparent,
                              side: BorderSide(color: Color(0xFFe0e0e0)),
                              activeColor: Color(0xFF0f79f3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              value: itemsSelect[index],
                              onChanged: (value) => updateItemsFor(index),
                            ),
                            InkWell(
                              onTap: () => updateItemsFor(index),
                              child: Text(
                                " ${itemsfor[index]}",
                                style: TextStyle(
                                  color: notifier.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Categories",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(),
                        width: constraints.maxWidth,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              overlayColor: WidgetStateColor.transparent,
                              side: BorderSide(color: Color(0xFFe0e0e0)),
                              activeColor: Color(0xFF0f79f3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              value: categoriesSelect[index],
                              onChanged: (value) => updateCategories(index),
                            ),
                            InkWell(
                              onTap: () => updateCategories(index),
                              child: Text(
                                " ${categories[index]}",
                                style: TextStyle(
                                  color: notifier.text,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              categoriesCounts[index],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Brands",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: brands.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(),
                        width: constraints.maxWidth,
                        height: 40,
                        child: Row(
                          children: [
                            Checkbox(
                              overlayColor: WidgetStateColor.transparent,
                              side: BorderSide(color: Color(0xFFe0e0e0)),
                              activeColor: Color(0xFF0f79f3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              value: brandsSelect[index],
                              onChanged: (value) => updateBrands(index),
                            ),
                            InkWell(
                              onTap: () => updateBrands(index),
                              child: Text(
                                " ${brands[index]}",
                                style: TextStyle(
                                  color: notifier.text,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              brandsCounts[index],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Text(
                    "Colors",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    margin: EdgeInsets.symmetric(vertical: 15),
                    width: constraints.maxWidth,
                    child: Wrap(
                      runSpacing: 8,
                      spacing: 13,
                      children: [
                        for (var i = 0; i < colors.length; i++)
                          InkWell(
                            onTap: () => updateColors(i),
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: colors[i],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1.5,
                                  color: i == 1
                                      ? notifier.getfillborder
                                      : colors[i],
                                ),
                              ),
                              child: colorsSelect[i]
                                  ? SvgPicture.asset(
                                      "assets/images/checkIcon.svg",
                                      height: 10,
                                      color: i == 1
                                          ? Color(0xFF677583)
                                          : Colors.white,
                                    )
                                  : Container(),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Price",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  RangeSlider(
                    values: currentRangeValues,
                    min: 0,
                    max: 5000,
                    activeColor: Color(0xFF0f79f2),
                    inactiveColor: notifier.lightbgcolor,
                    onChanged: (RangeValues values) {
                      setState(() {
                        currentRangeValues = values;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${currentRangeValues.start.round()}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '\$${currentRangeValues.end.round()}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ratings",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: ratings.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(),
                        width: constraints.maxWidth,
                        height: 40,
                        child: Row(
                          children: [
                            Checkbox(
                              overlayColor: WidgetStateColor.transparent,
                              side: BorderSide(color: Color(0xFFe0e0e0)),
                              activeColor: Color(0xFF0f79f3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              value: ratingsSelect[index],
                              onChanged: (value) => updateRatings(index),
                            ),
                            InkWell(
                              onTap: () => updateRatings(index),
                              child: SmoothStarRating(
                                size: 20,
                                rating: ratings[index].toDouble(),
                                filledIconData: Icons.star,
                                defaultIconData: Icons.star_outline,
                                starCount: 5,
                                color: const Color(0xffECA61B),
                                borderColor: const Color(0xffECA61B),
                                onRatingChanged: (rating) =>
                                    updateRatings(index),
                              ),
                            ),
                            InkWell(
                              onTap: () => updateRatings(index),
                              child: Text(
                                "  (${ratings[index].toStringAsFixed(0)})",
                                style: TextStyle(
                                  color: notifier.text,
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              ratingCounts[index],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
