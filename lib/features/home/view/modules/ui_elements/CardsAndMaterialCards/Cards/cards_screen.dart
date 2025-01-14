
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';
import 'my_card.dart';
import 'my_image_card.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  
  late ColorNotifier notifier;
  
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
                            "Cards",
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
                                "Cards",
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
                            "Cards",
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
                                "Cards",
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
                child: width < 750
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyCard(
                            title: "Basic Cards",
                            containerText: const ["unity", "Warning"],
                            containerBorderColor: const [
                              Color(0xFF1079f3),
                              Color(0xFFffc132),
                            ],
                            containerTextColor: const [
                              Color(0xFF1079f3),
                              Color(0xFFffc132),
                            ],
                            buttonText: "unity",
                            buttonTextColor: Color(0xFF1079f3),
                            buttonHoverColor: Color(0xFF1079f3),
                            buttonBorderColor: notifier.getfillborder,
                          ),
                          SizedBox(height: 20),
                          MyImageCard(
                            images: "https://images.unsplash.com/photo-1726767305248-e3cfaf9c98b7?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            containerText: const ["unity", "Primary"],
                            containerBgColor: const [
                              Color(0xFF0f79f3),
                              Color(0xFF0f79f3),
                            ],
                          ),
                          SizedBox(height: 20),
                          MyCard(
                            containerText: const ["Danger", "Warning"],
                            containerTextColor: const [
                              Colors.white,
                              Colors.black,
                            ],
                            containerBgColor: const [
                              Color(0xFFdc3545),
                              Color(0xFFffc107),
                            ],
                            buttonText: "unity",
                            buttonColor: Color(0xFF0f79f3),
                          ),
                          SizedBox(height: 20),
                          MyCard(
                            containerText: const ["unity", "Info"],
                            containerBgColor: const [
                              Color(0xFF0f79f3),
                              Color(0xFF0dcaf0),
                            ],
                            containerTextColor: const [
                              Colors.white,
                              Colors.black,
                            ],
                            images: "https://media.istockphoto.com/id/2105399620/photo/smiling-businessman-using-laptop-in-modern-office.webp?a=1&b=1&s=612x612&w=0&k=20&c=maFSS4msFIdeDKnVCJ9n4yX3FioJnq5oSKIZVhVgnxs=",
                            buttonText: "unity",
                            buttonColor: Color(0xFF0f79f3),
                          ),
                          SizedBox(height: 20),
                          MyImageCard(
                            images: "https://images.unsplash.com/photo-1727257186617-38153f3bc067?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIwfDZzTVZqVExTa2VRfHxlbnwwfHx8fHw%3D",
                            containerText: const ["Danger", "Warning"],
                            containerTextColor: const [
                              Colors.white,
                              Colors.black,
                            ],
                            containerBgColor: const [
                              Color(0xFFdc3545),
                              Color(0xFFffc107),
                            ],
                          ),
                          SizedBox(height: 20),
                          MyCard(
                            containerText: const ["Danger", "Warning"],
                            containerTextColor: const [
                              Color(0xFFdc384a),
                              Color(0xFFffc20d),
                            ],
                            containerBgColor: const [
                              Color(0xFFf8d7da),
                              Color(0xFFfff3cd),
                            ],
                            buttonText: "Accent",
                            buttonTextColor: Color(0xFF343eff),
                            buttonColor: Color(0xFFfdfbff),
                            showButtonShadow: true,
                          ),
                          SizedBox(height: 20),
                          MyCard(
                            title: "unity Card",
                            containerText: const ["unity", "Success"],
                            containerTextColor: const [
                              Color(0xFF0f79f3),
                              Color(0xFF4d9461),
                            ],
                            containerBgColor: const [
                              Color(0xFFf1f2fd),
                              Color(0xFFd1e7dd),
                            ],
                            images: "https://images.unsplash.com/photo-1505236273191-1dce886b01e9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            buttonText: "Warn",
                            buttonColor: Color(0xFFe74c3c),
                          ),
                          SizedBox(height: 20),
                          MyCard(
                            child: SizedBox(
                              width: 35,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFF0f79f3),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/heart.svg",
                                      height: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : width < 950
                        ? Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        MyCard(
                                          title: "Basic Cards",
                                          containerText: const["unity", "Warning"],
                                          containerBorderColor:const [
                                            Color(0xFF1079f3),
                                            Color(0xFFffc132),
                                          ],
                                          containerTextColor:const [
                                            Color(0xFF1079f3),
                                            Color(0xFFffc132),
                                          ],
                                          buttonText: "unity",
                                          buttonTextColor: Color(0xFF1079f3),
                                          buttonHoverColor: Color(0xFF1079f3),
                                          buttonBorderColor: notifier.getfillborder,
                                        ),
                                        SizedBox(height: 20),
                                        MyImageCard(
                                          images: "https://images.unsplash.com/photo-1726767305248-e3cfaf9c98b7?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                          containerText: const ["unity", "Primary"],
                                          containerBgColor: const [
                                            Color(0xFF0f79f3),
                                            Color(0xFF0f79f3),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        MyCard(
                                          containerText: const ["Danger", "Warning"],
                                          containerTextColor: const [
                                            Colors.white,
                                            Colors.black,
                                          ],
                                          containerBgColor: const [
                                            Color(0xFFdc3545),
                                            Color(0xFFffc107),
                                          ],
                                          buttonText: "unity",
                                          buttonColor: Color(0xFF0f79f3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      children: const [
                                        MyCard(
                                          containerText: ["unity", "Info"],
                                          containerBgColor: [
                                            Color(0xFF0f79f3),
                                            Color(0xFF0dcaf0),
                                          ],
                                          containerTextColor: [
                                            Colors.white,
                                            Colors.black,
                                          ],
                                          images: "https://media.istockphoto.com/id/2105399620/photo/smiling-businessman-using-laptop-in-modern-office.webp?a=1&b=1&s=612x612&w=0&k=20&c=maFSS4msFIdeDKnVCJ9n4yX3FioJnq5oSKIZVhVgnxs=",
                                          buttonText: "unity",
                                          buttonColor: Color(0xFF0f79f3),
                                        ),
                                        SizedBox(height: 20),
                                        MyImageCard(
                                          images: "https://images.unsplash.com/photo-1727257186617-38153f3bc067?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIwfDZzTVZqVExTa2VRfHxlbnwwfHx8fHw%3D",
                                          containerText: ["Danger", "Warning"],
                                          containerTextColor: [
                                            Colors.white,
                                            Colors.black,
                                          ],
                                          containerBgColor: [
                                            Color(0xFFdc3545),
                                            Color(0xFFffc107),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        MyCard(
                                          containerText: const [
                                            "Danger",
                                            "Warning"
                                          ],
                                          containerTextColor: const [
                                            Color(0xFFdc384a),
                                            Color(0xFFffc20d),
                                          ],
                                          containerBgColor: const [
                                            Color(0xFFf8d7da),
                                            Color(0xFFfff3cd),
                                          ],
                                          buttonText: "Accent",
                                          buttonTextColor: Color(0xFF343eff),
                                          buttonColor: Color(0xFFfdfbff),
                                          showButtonShadow: true,
                                        ),
                                        SizedBox(height: 20),
                                        MyCard(
                                          title: "unity Card",
                                          containerText: const [
                                            "unity",
                                            "Success"
                                          ],
                                          containerTextColor: const [
                                            Color(0xFF0f79f3),
                                            Color(0xFF4d9461),
                                          ],
                                          containerBgColor: const [
                                            Color(0xFFf1f2fd),
                                            Color(0xFFd1e7dd),
                                          ],
                                          images: "https://images.unsplash.com/photo-1505236273191-1dce886b01e9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                          buttonText: "Warn",
                                          buttonColor: Color(0xFFe74c3c),
                                        ),
                                        SizedBox(height: 20),
                                        MyCard(
                                          child: SizedBox(
                                            width: 35,
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xFF0f79f3),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "assets/images/heart.svg",
                                                    height: 25,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(child: Container()),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children:  [
                                    MyCard(
                                      title: "Basic Cards",
                                      containerText: const ["unity", "Warning"],
                                      containerBorderColor: const [
                                        Color(0xFF1079f3),
                                        Color(0xFFffc132),
                                      ],
                                      containerTextColor: const [
                                        Color(0xFF1079f3),
                                        Color(0xFFffc132),
                                      ],
                                      buttonText: "unity",
                                      buttonTextColor: Color(0xFF1079f3),
                                      buttonHoverColor: Color(0xFF1079f3),
                                      buttonBorderColor: notifier.getfillborder,
                                    ),
                                    SizedBox(height: 20),
                                    MyImageCard(
                                      images: "https://images.unsplash.com/photo-1726767305248-e3cfaf9c98b7?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      containerText: const ["unity", "Primary"],
                                      containerBgColor: const [
                                        Color(0xFF0f79f3),
                                        Color(0xFF0f79f3),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    MyCard(
                                      containerText: const ["Danger", "Warning"],
                                      containerTextColor: const [
                                        Colors.white,
                                        Colors.black,
                                      ],
                                      containerBgColor: const [
                                        Color(0xFFdc3545),
                                        Color(0xFFffc107),
                                      ],
                                      buttonText: "unity",
                                      buttonColor: Color(0xFF0f79f3),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  children: const [
                                    MyCard(
                                      containerText: ["unity", "Info"],
                                      containerBgColor: [
                                        Color(0xFF0f79f3),
                                        Color(0xFF0dcaf0),
                                      ],
                                      containerTextColor: [
                                        Colors.white,
                                        Colors.black,
                                      ],
                                      images: "https://media.istockphoto.com/id/2105399620/photo/smiling-businessman-using-laptop-in-modern-office.webp?a=1&b=1&s=612x612&w=0&k=20&c=maFSS4msFIdeDKnVCJ9n4yX3FioJnq5oSKIZVhVgnxs=",
                                      buttonText: "unity",
                                      buttonColor: Color(0xFF0f79f3),
                                    ),
                                    SizedBox(height: 20),
                                    MyImageCard(
                                      images: "https://images.unsplash.com/photo-1727257186617-38153f3bc067?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDIwfDZzTVZqVExTa2VRfHxlbnwwfHx8fHw%3D",
                                      containerText: ["Danger", "Warning"],
                                      containerTextColor: [
                                        Colors.white,
                                        Colors.black,
                                      ],
                                      containerBgColor: [
                                        Color(0xFFdc3545),
                                        Color(0xFFffc107),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  children: [
                                    MyCard(
                                      containerText: const [
                                        "Danger",
                                        "Warning"
                                      ],
                                      containerTextColor: const [
                                        Color(0xFFdc384a),
                                        Color(0xFFffc20d),
                                      ],
                                      containerBgColor: const [
                                        Color(0xFFf8d7da),
                                        Color(0xFFfff3cd),
                                      ],
                                      buttonText: "Accent",
                                      buttonTextColor: Color(0xFF343eff),
                                      buttonColor: Color(0xFFfdfbff),
                                      showButtonShadow: true,
                                    ),
                                    SizedBox(height: 20),
                                    MyCard(
                                      title: "unity Card",
                                      containerText: const ["unity", "Success"],
                                      containerTextColor: const [
                                        Color(0xFF0f79f3),
                                        Color(0xFF4d9461),
                                      ],
                                      containerBgColor: const [
                                        Color(0xFFf1f2fd),
                                        Color(0xFFd1e7dd),
                                      ],
                                      images: "https://images.unsplash.com/photo-1505236273191-1dce886b01e9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      buttonText: "Warn",
                                      buttonColor: Color(0xFFe74c3c),
                                    ),
                                    SizedBox(height: 20),
                                    MyCard(
                                      child: SizedBox(
                                        width: 35,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xFF0f79f3),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                "assets/images/heart.svg",
                                                height: 25,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
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
