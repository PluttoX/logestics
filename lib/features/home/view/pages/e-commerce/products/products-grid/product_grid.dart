
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../../widget/mycontainers.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  late List<bool> isHovering;

  @override
  void initState() {
    super.initState();
    isHovering = List.filled(productImages.length, false);
  }

  List productImages = [
    "https://cdn.pixabay.com/photo/2022/08/16/04/52/jewel-7389356_640.jpg",
    "https://images.unsplash.com/photo-1515529706504-b440b49fb63b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1484788984921-03950022c9ef?q=80&w=2132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.pexels.com/photos/815494/pexels-photo-815494.jpeg?cs=srgb&dl=pexels-dzeninalukac-815494.jpg&fm=jpg",
    "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8vBdS8WOtP0NqtKtgFqGYTrFDj9g2uJ1xluENuMHaFyQPX402mS2dnKQ6Gdda9KGpZeU&usqp=CAU",
    "https://res.cloudinary.com/teepublic/image/private/s--vKPM19YG--/t_Resized%20Artwork/c_crop,x_10,y_10/c_fit,w_470/c_crop,g_north_west,h_626,w_470,x_0,y_0/g_north_west,u_upload:v1462829013:production:blanks:cau9y2yr6rnvk9qkrf1h,x_-395,y_-325/b_rgb:eeeeee/c_limit,f_auto,h_630,q_auto:good:420,w_630/v1614312052/production/designs/19740243_0.jpg",
    "https://redtape.com/cdn/shop/files/RSO3752_1.jpg?v=1711713936",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0KVypvpG8ULXx6MTf4wQvPXuSdqmbWIpNjw&s",
  ];

  List productNames = [
    "Luxury Rendering",
    "Mobile Device",
    "Gaming Laptop",
    "Wireless Headphone",
    "Hand Watch",
    "Futuristic Bracelet",
    "Triblend T-Shirt",
    "Sports Shoes",
    "Woman Handbag",
  ];

  List pnewPrices = [
    "150.00",
    "750.00",
    "25.00",
    "80.00",
    "120.00",
    "15.00",
    "45.00",
    "55.00",
    "75.00",
  ];

  List poldPrices = [
    "180.00",
    "780.00",
    "300.00",
    "100.00",
    "130.00",
    "19.00",
    "45.00",
    "70.00",
    "75.00",
  ];

  List favritProducts = [];

  List<double> pratingValues = [5, 4.4, 4, 3.4, 3, 4, 4, 4.4, 5];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Scaffold(
      backgroundColor: notifier.mainBgColor,
      body: Column(
        children: [
          GridView.builder(
            itemCount: productNames.length,
            padding: width < 950 ? EdgeInsets.all(10) : EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width < 550
                  ? 1
                  : width < 750
                      ? 2
                      : width < 950
                          ? 3
                          : width < 1200
                              ? 2
                              : width < 1994
                                  ? 3
                                  : 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: width < 550
                  ? 500
                  : width < 650
                      ? 450
                      : width < 750
                          ? 500
                          : width < 850
                              ? 450
                              : width < 1200
                                  ? 470
                                  : width < 1550
                                      ? 450
                                      : 500,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: notifier.getBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () {
                                  mainDrawerController.updateSelectedIndex(22);
                                },
                                onHover: (value) {
                                  setState(() {
                                    isHovering[index] = value;
                                  });
                                },
                                child: AnimatedContainer(
                                  transformAlignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..scale(isHovering[index] ? 1.2 : 1.0),
                                  duration: Duration(milliseconds: 300),
                                  child: Image.network(
                                    productImages[index],
                                    fit: BoxFit.cover,
                                    width: constraints.maxWidth,
                                    height: 300,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (!favritProducts.contains(index)) {
                                    favritProducts.add(index);
                                    debugPrint("-------$favritProducts-------");
                                  }
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: favritProducts.contains(index)
                                      ? Image.asset(
                                          "assets/images/heart.png",
                                          color: Color(0xFFffb264),
                                          height: 20,
                                        )
                                      : Image.asset(
                                          "assets/images/heart_outline.png",
                                          height: 20,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          productNames[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: notifier.text,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "\$${pnewPrices[index]} ",
                            style: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: notifier.text,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "\$${poldPrices[index]}",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmoothStarRating(
                              allowHalfRating: true,
                              size: 20,
                              rating: pratingValues[index],
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_outline,
                              starCount: 5,
                              color: const Color(0xffECA61B),
                              borderColor: const Color(0xffECA61B),
                            ),
                            Text(
                              " (${pratingValues[index].toString()})",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 15),
                          child: OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                favritProducts.remove(index);
                                debugPrint("---------$favritProducts---------");
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: Size(constraints.maxWidth, 50),
                              overlayColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: notifier.getfillborder,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            icon: Image.asset(
                              "assets/images/shopping-basket.png",
                              height: 20,
                              color: notifier.text,
                            ),
                            label: Text(
                              "Add To Cart",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 18,
                                color: notifier.text,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: width < 550
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Showing 1 to 9 of 50 entries",
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
                        "Showing 1 to 9 of 50 entries",
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
  }
}

Widget bottomButton(
  context,
  Widget child,
  Color color,
) {
  notifier = Provider.of(context, listen: true);
  return Container(
    width: 40,
    decoration: BoxDecoration(
      // color: Colors.white,
      color: color,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(
        color: notifier.getfillborder,
      ),
    ),
    child: Center(child: child),
  );
}
