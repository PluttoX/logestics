
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/Searchfield.dart';
import '../../../../widget/popupbutton.dart';
import '../products/products-grid/product_grid.dart';

class SellersListScreen extends StatefulWidget {
  const SellersListScreen({super.key});

  @override
  State<SellersListScreen> createState() => _SellersListScreenState();
}

class _SellersListScreenState extends State<SellersListScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  List images = [
    "assets/images/seller1.png",
    "assets/images/seller2.png",
    "assets/images/seller3.png",
    "assets/images/seller4.png",
    "assets/images/seller5.png",
    "assets/images/seller6.png",
    "assets/images/seller7.png",
    "assets/images/seller8.png",
    "assets/images/seller9.png",
    "assets/images/seller10.png",
    "assets/images/seller11.png",
    "assets/images/seller12.png",
  ];

  List title = [
    "Milton Jones",
    "Victoria Hopkins",
    "Venessa Jones",
    "Roosevelt Hall",
    "Ralph Velasquez",
    "Ellen Hernandez",
    "Donald Qualls",
    "David Williamson",
    "Rocky O'Donnell",
    "Richard Brumfield",
    "Dallas Jones",
    "Barbara Marshall",
  ];

  List lastSaleDate = [
    "Nov 25, 2024",
    "Nov 01, 2024",
    "Sep 30, 2024",
    "Aug 01, 2024",
    "Jul 25, 2024",
    "Jul 10, 2024",
    "Jun 25, 2024",
    "May 20, 2024",
    "Apr 30, 2024",
    "Apr 01, 2024",
    "Mar 25, 2024",
    "Mar 05, 2024",
  ];

  List itemStock = [
    "50",
    "39",
    "75",
    "99",
    "350",
    "200",
    "80",
    "150",
    "75",
    "500",
    "50",
    "99",
  ];

  List walletBalance = [
    "5,999.50",
    "4,645.50",
    "5,550.50",
    "2,100.50",
    "15,250.50",
    "10,500.50",
    "2,580.00",
    "9,000.00",
    "4,500.50",
    "18,500.00",
    "6,300.50",
    "3,699.50",
  ];

  List revenue = [
    "5,999.50",
    "4,645.50",
    "4,350.50",
    "1,500.50",
    "10,200.50",
    "5,458.50",
    "1,500.00",
    "6,000.00",
    "4,500.50",
    "13,200.00",
    "4,000.50",
    "2,599.50",
  ];

  List store = [
    "TechMaster Store",
    "RisionTech Outlet",
    "ComfotLiving",
    "SportFit Store",
    "Velas Store",
    "Herna Store",
    "Dona Store",
    "Willi Dav Store",
    "Donne Store",
    "RichMaster Store",
    "Dajon Store",
    "Barbahall Store",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width < 650 ? 60 : 40,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sellers List",
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
                                onTap: () =>
                                    mainDrawerController.updateSelectedIndex(0),
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
                                "Sellers List",
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
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sellers List",
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
                                onTap: () =>
                                    mainDrawerController.updateSelectedIndex(0),
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
                                "Sellers List",
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
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: notifier.getBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(),
                  child: width < 600
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                mainDrawerController.updateSelectedIndex(38);
                              },
                              hoverColor: Color(0xFFEEF4FB),
                              child: Text(
                                "+ Add New Seller",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Outfit",
                                  color: Color(0xFF0f79f3),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            SizedBox(width: width, child: Searchfield()),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                mainDrawerController.updateSelectedIndex(38);
                              },
                              hoverColor: Color(0xFFEEF4FB),
                              child: Text(
                                "+ Add New Seller",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Outfit",
                                  color: Color(0xFF0f79f3),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width < 900 ? width / 2 : width / 4,
                              child: Searchfield(),
                            ),
                          ],
                        ),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                itemCount: images.length,
                padding: width < 950 ? EdgeInsets.all(10) : EdgeInsets.zero,
                shrinkWrap: true,
                physics: width < 950
                    ? ScrollPhysics()
                    : NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width < 700
                      ? 1
                      : width < 1000
                          ? 2
                          : 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: notifier.getBgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: notifier.lightbgcolor,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  SizedBox(
                                    width: width < 400
                                        ? constraints.maxWidth / 3
                                        : width < 1200
                                            ? null
                                            : width < 1250
                                                ? constraints.maxWidth / 2.5
                                                : null,
                                    child: Text(
                                      title[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Outfit",
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: notifier.text,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Popupbutton(
                                        items: ["View", "Edit", "Delete"],
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Last Sale Date : ",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Color(0xFF949ba3),
                                  ),
                                ),
                                Text(
                                  lastSaleDate[index],
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: notifier.text,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Item Stock : ",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Color(0xFF949ba3),
                                  ),
                                ),
                                Text(
                                  itemStock[index],
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: notifier.text,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Wallet Balance : ",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Color(0xFF949ba3),
                                  ),
                                ),
                                Text(
                                  walletBalance[index],
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: notifier.text,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Revenue : ",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Color(0xFF949ba3),
                                  ),
                                ),
                                Text(
                                  revenue[index],
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: notifier.text,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Store : ",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 15,
                                    color: Color(0xFF949ba3),
                                  ),
                                ),
                                Text(
                                  store[index],
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
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
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8),
                child: width < 550
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Showing 1 to 12 of 80 entries",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: "Outfit",
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                bottomButton(
                                  context,
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.grey,
                                  ),
                                  notifier.getBgColor,
                                ),
                                SizedBox(width: 5),
                                bottomButton(
                                  context,
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "Outfit",
                                    ),
                                  ),
                                  Color(0xFF0f79f3),
                                ),
                                SizedBox(width: 5),
                                bottomButton(
                                  context,
                                  Text(
                                    "2",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: "Outfit",
                                    ),
                                  ),
                                  notifier.getBgColor,
                                ),
                                SizedBox(width: 5),
                                bottomButton(
                                  context,
                                  Text(
                                    "3",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: "Outfit",
                                    ),
                                  ),
                                  notifier.getBgColor,
                                ),
                                SizedBox(width: 5),
                                bottomButton(
                                  context,
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.grey,
                                  ),
                                  notifier.getBgColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Showing 1 to 12 of 80 entries",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: "Outfit",
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                bottomButton(
                                  context,
                                  Icon(
                                    Icons.arrow_back,
                                    color: Colors.grey,
                                  ),
                                  notifier.getBgColor,
                                ),
                                SizedBox(width: 5),
                                bottomButton(
                                  context,
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "Outfit",
                                    ),
                                  ),
                                  Color(0xFF0f79f3),
                                ),
                                SizedBox(width: 5),
                                bottomButton(
                                  context,
                                  Text(
                                    "2",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: "Outfit",
                                    ),
                                  ),
                                  notifier.getBgColor,
                                ),
                                SizedBox(width: 5),
                                bottomButton(
                                  context,
                                  Text(
                                    "3",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: "Outfit",
                                    ),
                                  ),
                                  notifier.getBgColor,
                                ),
                                SizedBox(width: 5),
                                bottomButton(
                                  context,
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.grey,
                                  ),
                                  notifier.getBgColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
