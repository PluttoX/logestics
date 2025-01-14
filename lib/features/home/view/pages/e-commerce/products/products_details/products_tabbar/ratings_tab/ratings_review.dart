
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/pages/e-commerce/products/products_details/products_tabbar/ratings_tab/ratings.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../../../../../../theme/theme.dart';

class RatingsReview extends StatefulWidget {
  const RatingsReview({super.key});

  @override
  State<RatingsReview> createState() => _RatingsReviewState();
}

class _RatingsReviewState extends State<RatingsReview> {
  double yourRatings = 2.0;
  
  late ColorNotifier notifier;

  TextEditingController yourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier = Provider.of(context,listen: true);

    return Container(
      // color: Colors.amber.shade50,
      margin: width < 850
          ? EdgeInsets.all(10)
          : EdgeInsets.only(left: 60, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          width < 850 ? Container() : SizedBox(height: 40),
          Text(
            "Ratings",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 10),
          Ratings(),
          SizedBox(height: 30),
          width < 950
              ? Column(
                  children: [
                    reviewDetails(
                      5,
                      "assets/images/user1.jpg",
                      "Mark Stjohn",
                    ),
                    SizedBox(height: 20),
                    reviewDetails(
                      4.4,
                      "assets/images/user2.jpg",
                      "Joan Stanley",
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: reviewDetails(
                        5,
                        "assets/images/user1.jpg",
                        "Mark Stjohn",
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: reviewDetails(
                        4.4,
                        "assets/images/user2.jpg",
                        "Joan Stanley",
                      ),
                    ),
                  ],
                ),
          SizedBox(height: 50),
          Text(
            "Your Ratings",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 20),
          SmoothStarRating(
            allowHalfRating: true,
            size: 20,
            spacing: 10,
            rating: yourRatings,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_outline,
            starCount: 5,
            color: const Color(0xffECA61B),
            borderColor: const Color(0xffECA61B),
            onRatingChanged: (rating) {
              setState(() {
                yourRatings = rating;
              });
            },
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: notifier.getfillborder,
              ),
            ),
            child: TextField(
              style: TextStyle(
                fontFamily: "Outfit",
                color: notifier.text,
              ),
              cursorColor: Color(0xFF0f79f3),
              maxLines: 6,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(10),
                hintMaxLines: 10,
                hintText: "E.g.it markes me feel...",
                hintStyle: TextStyle(
                  fontFamily: "Outfit",
                  color: notifier.text,
                ),
                labelText: "Write comment here...",
                labelStyle: TextStyle(
                  fontFamily: "Outfit",
                  color: Colors.grey,
                ),
                floatingLabelStyle: TextStyle(
                  color: Color(0xff0165FC),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: notifier.getfillborder,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xFF0f79f3),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 45,
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                elevation: 0,
                backgroundColor: Color(0xFF0f79f3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                "Submit",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget reviewDetails(
    double rating,
    String image,
    String title,
  ) {
    notifier = Provider.of(context,listen: true);
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifier.mainBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SmoothStarRating(
                allowHalfRating: true,
                size: 20,
                rating: rating,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_outline,
                starCount: 5,
                color: const Color(0xffECA61B),
                borderColor: const Color(0xffECA61B),
              ),
              SizedBox(
                width: 50,
                child: Text(
                  " (5)",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Outfit",
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Risus nulla amet facilisis eu metus nulla. Nisi interdum nec in lectus amet dis. Pulvinar ut vulputate odio venenatis id urna. Nullam elementum id egestas aliquet leo potenti pellentesque vel tortor. Varius integer facilisi vestibulum ante scelerisque adipiscing at turpis ultricies. Ullamcorper dui in in ultricies sodales in sapien. Elit lectus tincidunt tempus platea praesent.  Mi dignissim faucibus fringilla egestas.",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 17,
              height: 2,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipOval(
              child: Image.asset(image),
            ),
            title: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 20,
                color: notifier.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
