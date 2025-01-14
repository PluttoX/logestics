
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../Controllers/pages_controllers/e-commerce_controllers/categories_controller.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/Searchfield.dart';
import '../../../../widget/next_page_button.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());
  CategoriesController categoriesController = Get.put(CategoriesController());

  late ColorNotifier notifier;

  bool isActive = false;

  bool button = false;

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
                height: width < 650 ? 55 : 40,
                width: width,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Categories",
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
                                "Categories",
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
                            "Categories",
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
                                "Categories",
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
                padding: EdgeInsets.symmetric(vertical: 15),
                height: width < 550
                    ? 950
                    : width < 600
                        ? 860
                        : 840,
                decoration: BoxDecoration(
                  color: notifier.getBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(),
                      child: width < 600
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width,
                                  child: Searchfield(),
                                ),
                                SizedBox(height: 5),
                                InkWell(
                                  onTap: () {
                                    mainDrawerController.updateSelectedIndex(34);
                                  },
                                  hoverColor: Color(0xFFEEF4FB),
                                  child: Text(
                                    "+ Add New Category",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 15,
                                      color: Color(0xFF0f79f3),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width < 900 ? width / 2 : width / 4,
                                  child: Searchfield(),
                                ),
                                InkWell(
                                  onTap: () {
                                    mainDrawerController.updateSelectedIndex(34);
                                  },
                                  hoverColor: Color(0xFFEEF4FB),
                                  child: Text(
                                    "+ Add New Category",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Outfit",
                                      color: Color(0xFF0f79f3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    SizedBox(height: 15),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: width < 1360 ? null : constraints.maxWidth,
                            child: Table(
                              border: TableBorder(
                                horizontalInside:
                                    BorderSide(color: notifier.getfillborder),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(80),
                                1: FixedColumnWidth(100),
                                2: FixedColumnWidth(150),
                                3: FixedColumnWidth(150),
                                4: FixedColumnWidth(150),
                                5: FixedColumnWidth(290),
                                6: FixedColumnWidth(120),
                                7: FixedColumnWidth(100),
                              },
                              children: [
                                TableRow(
                                  decoration:
                                      BoxDecoration(color: notifier.tablehader),
                                  children: [
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            overlayColor:
                                                WidgetStateProperty.all<Color>(
                                              Colors.transparent,
                                            ),
                                            activeColor:
                                                const Color(0xff0f79f3),
                                            side: BorderSide(
                                              color: notifier.chakboxborder,
                                              width: 2,
                                            ),
                                            value: isActive,
                                            onChanged: (val) {
                                              setState(() {
                                                isActive = val!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Image",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Name",
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Total Products",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Slug",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Description",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Status",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Action",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                for (var a = categoriesController.loadmore;
                                    a <
                                        categoriesController.loadmore +
                                            categoriesController.selectindex;
                                    a++)
                                  TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: StatefulBuilder(
                                            builder: (BuildContext context,
                                                setState) {
                                              return Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                  overlayColor:
                                                      WidgetStateProperty.all<
                                                          Color>(
                                                    Colors.transparent,
                                                  ),
                                                  activeColor:
                                                      const Color(0xff0f79f3),
                                                  side: BorderSide(
                                                    color:
                                                        notifier.chakboxborder,
                                                    width: 2,
                                                  ),
                                                  value: isActive,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      isActive = val!;
                                                    });
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                categoriesController.images[a],
                                              ),
                                            ),
                                          ),
                                          margin: EdgeInsets.all(8),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            categoriesController.name[a],
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: notifier.text,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${categoriesController.totalProducts[a]}",
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            categoriesController.slug[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            categoriesController.description[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Container(
                                          padding: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                            color: categoriesController
                                                        .status[a] ==
                                                    "Active"
                                                ? notifier.ligreenColor
                                                : notifier.liredColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              categoriesController.status[a],
                                              style: TextStyle(
                                                letterSpacing: 1,
                                                fontFamily: "Outfit",
                                                fontSize: 15,
                                                color: categoriesController
                                                            .status[a] ==
                                                        "Active"
                                                    ? Color(0xFF3bd47e)
                                                    : Color(0xFFe74d42),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/pen.png",
                                                height: 20,
                                                color: Color(0xFF2a8ef6),
                                              ),
                                              SizedBox(width: 10),
                                              Image.asset(
                                                "assets/images/trash.png",
                                                height: 20,
                                                color: notifier.text,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: NextPageButton(
                        number1: "10",
                        number2: "20",
                        number3: "30",
                        numberofpages: "1 – 10 of 20",
                        backbutton: () {
                          if (button == true) {
                            setState(() {
                              button = !button;
                              categoriesController.images.shuffle();
                              categoriesController.name.shuffle();
                              categoriesController.totalProducts.shuffle();
                              categoriesController.slug.shuffle();
                              categoriesController.description.shuffle();
                              categoriesController.status.shuffle();
                            });
                            categoriesController
                                .setloadmore(categoriesController.selectpage);
                          }
                        },
                        nextbutton: () {
                          if (button == false) {
                            setState(() {
                              button = !button;
                              categoriesController.images.shuffle();
                              categoriesController.name.shuffle();
                              categoriesController.totalProducts.shuffle();
                              categoriesController.slug.shuffle();
                              categoriesController.description.shuffle();
                              categoriesController.status.shuffle();
                            });
                            categoriesController
                                .setloadmore(categoriesController.selectpage);
                          }
                        },
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
