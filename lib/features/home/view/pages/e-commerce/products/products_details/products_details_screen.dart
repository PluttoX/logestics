
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/pages/e-commerce/products/products_details/product_images.dart';
import 'package:logestics/features/home/view/pages/e-commerce/products/products_details/product_information.dart';
import 'package:logestics/features/home/view/pages/e-commerce/products/products_details/products_tabbar/product_tabbar.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key});

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    if (width < 950) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Products Details",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => mainDrawerController.updateSelectedIndex(0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/home.png",
                              height: 15,
                              color: Color(0xFF0f7bf4),
                            ),
                            Text(
                              " Dashboard",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "E-Commerce",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Products",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "Products Details",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: notifier.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 50),
            Container(
              width: width,
              // height: height,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: notifier.getBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ProductImages(),
                  ProductInformation(),
                  SizedBox(height: 50),
                  ProductTabbar(),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products Details",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => mainDrawerController.updateSelectedIndex(0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/home.png",
                              height: 15,
                              color: Color(0xFF0f7bf4),
                            ),
                            Text(
                              " Dashboard",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "E-Commerce",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "Products",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        "Products Details",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: notifier.text,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: width,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: notifier.getBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductImages(),
                      SizedBox(width: 50),
                      Expanded(child: ProductInformation()),
                    ],
                  ),
                  SizedBox(height: 50),
                  ProductTabbar(),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
