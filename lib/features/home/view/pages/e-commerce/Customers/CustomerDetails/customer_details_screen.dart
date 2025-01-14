
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/home/view/pages/e-commerce/Customers/CustomerDetails/transactions_history.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';
import 'customer_information.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({super.key});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
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
                    "Customer Details",
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
                                fontSize: height / 55,
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
                          fontSize: height / 55,
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
                        "Customers",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: height / 55,
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
                    "Customer Details",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: height / 55,
                      color: notifier.text,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  height: 580,
                  decoration: BoxDecoration(),
                  child: CustomerInformation(),
                ),
                SizedBox(height: 20),
                Container(
                  height: 750,
                  width: width,
                  decoration: BoxDecoration(),
                  child: TransactionsHistory(),
                ),
              ],
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
                    "Customer Details",
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
                        "Customers",
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
                        "Customer Details",
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
              decoration: BoxDecoration(),
              height: 730,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(),
                      child: CustomerInformation(),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: width < 1200 ? width / 1.5 : width / 2 + 50,
                    decoration: BoxDecoration(),
                    child: TransactionsHistory(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
