
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../../../../../../theme/theme.dart';

class Ratings extends StatefulWidget {
  const Ratings({super.key});

  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {

  late ColorNotifier notifier;

  List<double> ratingValues = [5.00, 4.00, 3.00, 2.00, 1.00];

  List reviews = [120, 25, 9, 3, 1];

  List sliderValue = [0.8, 0.6, 0.4, 0.2, 0.1];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context,listen: true);

    if (width < 850) {
      return Container(
        decoration: BoxDecoration(
            // color: Colors.brown,
            ),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "4.9",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: notifier.text,
              ),
            ),
            Text(
              "Overall Rating",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                SmoothStarRating(
                  allowHalfRating: true,
                  size: 20,
                  rating: 5.0,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_outline,
                  starCount: 5,
                  color: const Color(0xffECA61B),
                  borderColor: const Color(0xffECA61B),
                ),
                Text(
                  " (158 Reviews)",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: width < 850
                  ? width
                  : width < 950
                      ? height / 1.8
                      : height / 1.5,
              decoration: BoxDecoration(
                  // color: Colors.deepPurpleAccent,
                  ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: ratingValues.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(),
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothStarRating(
                          size: width < 370 ? 15 : 20,
                          rating: ratingValues[index].toDouble(),
                          filledIconData: Icons.star,
                          defaultIconData: Icons.star_outline,
                          starCount: 5,
                          color: const Color(0xffECA61B),
                          borderColor: const Color(0xffECA61B),
                        ),
                        Text(
                          "  (${ratingValues[index].toStringAsFixed(2)})",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: "Outfit",
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: width < 370
                              ? width / 5
                              : width < 950
                                  ? width / 4
                                  : width < 1200
                                      ? width / 3.2
                                      : width < 1850
                                          ? width / 5
                                          : width / 6,
                          child: ProgressBar(
                            value: sliderValue[index],
                            width: width,
                            color: Color(0xFF0f79f3),
                            height: 5,
                            backgroundColor: notifier.lightbgcolor,
                          ),
                        ),
                        SizedBox(
                          width: 45,
                          child: Text(
                            "  (${reviews[index].toString()})",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: "Outfit",
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "4.9",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: notifier.text,
                ),
              ),
              Text(
                "Overall Rating",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  SmoothStarRating(
                    allowHalfRating: true,
                    size: 20,
                    rating: 5.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_outline,
                    starCount: 5,
                    color: const Color(0xffECA61B),
                    borderColor: const Color(0xffECA61B),
                  ),
                  Text(
                    " (158 Reviews)",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Container(
            width: width < 950
                ? height / 1.5
                : width < 1000
                    ? height / 1.2
                    : height / 1.1,
            decoration: BoxDecoration(
                // color: Colors.amber,
                ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: ratingValues.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SmoothStarRating(
                      size: 20,
                      rating: ratingValues[index].toDouble(),
                      filledIconData: Icons.star,
                      defaultIconData: Icons.star_outline,
                      starCount: 5,
                      color: const Color(0xffECA61B),
                      borderColor: const Color(0xffECA61B),
                    ),
                    Text(
                      "  (${ratingValues[index].toStringAsFixed(2)})",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: "Outfit",
                      ),
                    ),
                    width < 950 ? Spacer() : SizedBox(width: 50),
                    Container(
                      decoration: BoxDecoration(
                          // color: Colors.green,
                          ),
                      width: width < 950
                          ? width / 4
                          : width < 1200
                              ? width / 3.5
                              : width < 1850
                                  ? width / 5
                                  : width / 6,
                      child: ProgressBar(
                        value: sliderValue[index],
                        width: width,
                        color: Color(0xFF0f79f3),
                        height: 5,
                        backgroundColor: notifier.lightbgcolor,
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      child: Text(
                        "  (${reviews[index].toString()})",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: "Outfit",
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
