
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../../../../theme/theme.dart';

class ProductInformation extends StatefulWidget {
  const ProductInformation({super.key});

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  int productQuantity = 1;

  late ColorNotifier notifier;

  List productDetailsTile = ["Category", "SKU", "Vendor", "Availability"];

  List productDetails = [
    "Jewellery",
    "APR 517",
    "Michael Shelton",
    "In Stock 20 items",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Luxury Rendering",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: "Outfit",
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: notifier.text,
          ),
        ),
        SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: "\$75.00 ",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: notifier.text,
            ),
            children: const <TextSpan>[
              TextSpan(
                text: "\$90.00",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.grey,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SmoothStarRating(
              allowHalfRating: true,
              size: 20,
              rating: 4.4,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_outline,
              starCount: 5,
              color: const Color(0xffECA61B),
              borderColor: const Color(0xffECA61B),
            ),
            Text(
              " (4.5)",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "Auctor in nam malesuada auctor ultrices proin condimentum leo cras. Ultrices a quam massa tincidunt dictum luctus cursus. Est eleifend nam hendrerit ultricies elit montes. Molestie blandit orci viverra arcu vitae integer pharetra.",
          style: TextStyle(
            fontFamily: "Outfit",
            fontSize: 16,
            height: 1.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "100% Original Products",
          style: TextStyle(
            fontFamily: "Outfit",
            fontSize: 16,
            height: 1.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Easy 15 days returns and exchanges",
          style: TextStyle(
            fontFamily: "Outfit",
            fontSize: 16,
            height: 1.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: notifier.lightbgcolor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (productQuantity > 1) {
                          productQuantity--;
                        }
                      });
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: Text(
                        "$productQuantity",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          color: notifier.text,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        productQuantity++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              height: 45,
              width: 180,
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
                  "Add To Cart",
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
        SizedBox(height: 15),
        ListView.separated(
          itemCount: productDetailsTile.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return RichText(
              text: TextSpan(
                text: "${productDetailsTile[index]} : ",
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: 16,
                  color: notifier.text,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "${productDetails[index]}",
                    style: TextStyle(
                      color: index == 3 ? Color(0xFF36d58a) : Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
        )
      ],
    );
  }
}
