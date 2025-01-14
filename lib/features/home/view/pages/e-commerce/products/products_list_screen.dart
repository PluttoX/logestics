
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../Controllers/pages_controllers/e-commerce_controllers/products_list_controller.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/Searchfield.dart';
import '../../../../widget/next_page_button.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key, this.showtitlebar});

  final bool? showtitlebar;

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  ProductsListController productsListController =
      Get.put(ProductsListController());

  late ColorNotifier notifier;

  bool isActive = false;

  bool button = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Column(
      children: [
        widget.showtitlebar == false
            ? Container()
            : SizedBox(
                height: width < 650 ? 55 : 40,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Products List",
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
                                "Products List",
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
                            "Products List",
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
                                "Products List",
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
          padding: EdgeInsets.symmetric(vertical: 10),
          height: width < 450
              ? 1000
              : width < 550
                  ? 900
                  : width < 1450
                      ? 850
                      : 830,
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(),
                    height: width < 550
                        ? 110
                        : width < 1450
                            ? 90
                            : 70,
                    width: width,
                    child: width < 700
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              richTexts("All Products", "48,753"),
                              SizedBox(width: 15),
                              richTexts("Published Products ", "12,832"),
                              SizedBox(width: 15),
                              richTexts("Drafts Products", "12,832"),
                              InkWell(
                                onTap: () {
                                  mainDrawerController.updateSelectedIndex(23);
                                },
                                child: Text(
                                  "+ Add New Product",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Outfit",
                                    color: Color(0xFF0f79f3),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : width < 1450
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: height / 2,
                                        child: Searchfield(),
                                      ),
                                      Row(
                                        children: [
                                          richTexts("All Products", "48,753"),
                                          SizedBox(width: 15),
                                          richTexts(
                                              "Published Products", "12,832"),
                                          SizedBox(width: 15),
                                          richTexts(
                                              "Drafts Products", "12,832"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      mainDrawerController
                                          .updateSelectedIndex(23);
                                    },
                                    child: Text(
                                      "+ Add New Product",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Outfit",
                                        color: Color(0xFF0f79f3),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width / 4.5,
                                    child: Searchfield(),
                                  ),
                                  SizedBox(width: 20),
                                  richTexts("All Products", "48,753"),
                                  SizedBox(width: 15),
                                  richTexts("Published Products ", "12,832"),
                                  SizedBox(width: 15),
                                  richTexts("Drafts Products", "12,832"),
                                  Spacer(),
                                  InkWell(
                                    onTap: () {
                                      mainDrawerController
                                          .updateSelectedIndex(23);
                                    },
                                    child: Text(
                                      "+ Add New Product",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "Outfit",
                                        color: Color(0xFF0f79f3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: width < 1200 ? null : constraints.maxWidth,
                          child: Table(
                            border: TableBorder(
                              horizontalInside:
                                  BorderSide(color: notifier.getfillborder),
                            ),
                            columnWidths: {
                              0: FixedColumnWidth(width < 1820 ? 50 : 80),
                              1: FixedColumnWidth(width < 1820 ? 100 : 150),
                              2: FixedColumnWidth(width < 1820 ? 250 : 350),
                              3: FixedColumnWidth(width < 1820 ? 150 : 200),
                              4: FixedColumnWidth(width < 1820 ? 80 : 100),
                              5: FixedColumnWidth(width < 1820 ? 150 : 200),
                              6: FixedColumnWidth(width < 1820 ? 170 : 200),
                              7: FixedColumnWidth(width < 1820 ? 70 : 100),
                              8: FixedColumnWidth(width < 1820 ? 150 : 200),
                              9: FixedColumnWidth(width < 1820 ? 200 : 250),
                              10: FixedColumnWidth(100),
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
                                          activeColor: const Color(0xff0f79f3),
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
                                        "Product ID",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                        "Product",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                        "Category",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                        "Price",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                        "Stock Quantity",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                        "Date",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                        "Sales",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                        "Revenue",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                        "Rating",
                                        style: TextStyle(
                                          fontFamily: "Outfit",
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
                                          fontWeight: FontWeight.bold,
                                          color: notifier.text,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              for (var a = productsListController.loadmore;
                                  a <
                                      productsListController.loadmore +
                                          productsListController.selectindex;
                                  a++)
                                TableRow(
                                  children: [
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: StatefulBuilder(
                                          builder:
                                              (BuildContext context, setState) {
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
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "#${productsListController.productId[a]}",
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          onTap: () {
                                            mainDrawerController
                                                .updateSelectedIndex(22);
                                          },
                                          contentPadding: EdgeInsets.zero,
                                          leading: ClipOval(
                                            child: Image.network(
                                              productsListController
                                                  .productImage[a],
                                              height: 40,
                                              width: 40,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          title: Text(
                                            productsListController
                                                .productName[a],
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              fontWeight: FontWeight.bold,
                                              color: notifier.text,
                                            ),
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
                                          "${productsListController.category[a]}",
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
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
                                          "\$${productsListController.price[a]}",
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
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
                                          productsListController
                                              .stockQuantity[a],
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
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
                                          productsListController.date[a],
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
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
                                          productsListController.sales[a],
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
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
                                          "\$${productsListController.revenue[a]}",
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
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
                                          productsListController.rating[a],
                                          style: TextStyle(
                                            letterSpacing: 1,
                                            fontFamily: "Outfit",
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              "assets/images/eye.png",
                                              height: 20,
                                              color: Color(0xFF2a8ef6),
                                            ),
                                            Image.asset(
                                              "assets/images/pen.png",
                                              height: 20,
                                              color: notifier.text,
                                            ),
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
                            productsListController.productId.shuffle();
                            productsListController.productImage.shuffle();
                            productsListController.productName.shuffle();
                            productsListController.category.shuffle();
                            productsListController.price.shuffle();
                            productsListController.stockQuantity.shuffle();
                            productsListController.date.shuffle();
                            productsListController.sales.shuffle();
                            productsListController.revenue.shuffle();
                            productsListController.rating.shuffle();
                          });
                          productsListController
                              .setloadmore(productsListController.selectpage);
                        }
                      },
                      nextbutton: () {
                        if (button == false) {
                          setState(() {
                            button = !button;
                            productsListController.productId.shuffle();
                            productsListController.productImage.shuffle();
                            productsListController.productName.shuffle();
                            productsListController.category.shuffle();
                            productsListController.price.shuffle();
                            productsListController.stockQuantity.shuffle();
                            productsListController.date.shuffle();
                            productsListController.sales.shuffle();
                            productsListController.revenue.shuffle();
                            productsListController.rating.shuffle();
                          });
                          productsListController
                              .setloadmore(productsListController.selectpage);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget richTexts(String greyText, String blueText) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return RichText(
      text: TextSpan(
        text: greyText,
        style: TextStyle(
          fontFamily: "Outfit",
          fontSize: 15,
          color: Colors.grey,
          fontWeight: FontWeight.w300,
        ),
        children: <TextSpan>[
          TextSpan(
            text: " ($blueText)",
            style: TextStyle(
              color: Color(0xFF0f79f3),
            ),
          ),
        ],
      ),
    );
  }
}
