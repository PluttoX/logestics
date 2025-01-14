
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/pages/e-commerce/Sellers/SellerDetails/seller_overview.dart';
import 'package:logestics/features/home/view/pages/e-commerce/Sellers/SellerDetails/user_information.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../dashbord/help_desk/new_tickets_created.dart';
import '../../products/products_list_screen.dart';

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen({super.key});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  
  late ColorNotifier notifier;  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier = Provider.of(context,listen: true);

    if (width < 950) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Seller Details",
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
                        "Sellers",
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
                  Text(
                    "Seller Details",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 15,
                      color: notifier.text,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: width < 630 ? 680 : 380,
              decoration: BoxDecoration(),
              child: SellerOverview(),
            ),
            SizedBox(height: 20),
            UserInformation(),
            SizedBox(height: 20),
            Container(
              height: 400,
              decoration: BoxDecoration(),
              child: NewTicketsCreated(revenue: true),
            ),
            SizedBox(height: 20),
            ProductsListScreen(showtitlebar: false)
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
                    "Seller Details",
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
                        "Sellers",
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
                        "Seller Details",
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
              height: width < 1450 ? 380 : 210,
              decoration: BoxDecoration(),
              child: SellerOverview(),
            ),
            SizedBox(height: 20),
            Container(
              height: width < 1200
                  ? 550
                  : width < 1220
                      ? 600
                      : 550,
              decoration: BoxDecoration(),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: UserInformation(),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: width / 1.7,
                    decoration: BoxDecoration(),
                    child: NewTicketsCreated(revenue: true),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProductsListScreen(showtitlebar: false),
          ],
        ),
      );
    }
  }
}
