
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/controllers.dart';
import '../../../widget/mycontainers.dart';

class BreadcrumbScreen extends StatefulWidget {
  const BreadcrumbScreen({super.key});

  @override
  State<BreadcrumbScreen> createState() => _BreadcrumbScreenState();
}

class _BreadcrumbScreenState extends State<BreadcrumbScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context,listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width < 650 ? 55 : 40,
                width: width,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Breadcrumb",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:notifier.text,
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
                                "UI Elements",
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
                                "Breadcrumb",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  color:notifier.text,
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
                            "Breadcrumb",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color:notifier.text,
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
                                "UI Elements",
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
                                "Breadcrumb",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 15,
                                  color:notifier.text,
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
                  borderRadius: BorderRadius.circular(10),
                  color: notifier.getBgColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Breadcrumb",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color:notifier.text,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Home",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color:notifier.text,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Home",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Color(0xFF127bf3),
                            ),
                          ),
                        ),
                        Text(
                          " / ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                        Text(
                          "Library",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Home",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Color(0xFF127bf3),
                            ),
                          ),
                        ),
                        Text(
                          " / ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Library",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Color(0xFF127bf3),
                            ),
                          ),
                        ),
                        Text(
                          " / ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                        Text(
                          "unity",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Home",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Color(0xFF127bf3),
                            ),
                          ),
                        ),
                        Text(
                          " / ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Library",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Color(0xFF127bf3),
                            ),
                          ),
                        ),
                        Text(
                          " / ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "unity",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 15,
                              color: Color(0xFF127bf3),
                            ),
                          ),
                        ),
                        Text(
                          " / ",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                        Text(
                          "Data",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color:notifier.text,
                          ),
                        ),
                      ],
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
