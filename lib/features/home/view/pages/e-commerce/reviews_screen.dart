
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/controllers.dart';
import '../../../Controllers/pages_controllers/e-commerce_controllers/reviews_controller.dart';
import '../../../theme/theme.dart';
import '../../../widget/Searchfield.dart';
import '../../../widget/next_page_button.dart';
import '../../../widget/popupbutton.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  ReviewsController reviewController = Get.put(ReviewsController());

  late ColorNotifier notifier;

  bool isActive = false;

  bool button = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    List<Color> statusbgColors = [
      notifier.liblueColor,
      notifier.liyellowColor,
      notifier.liblueColor,
      notifier.liredColor,
      notifier.liyellowColor,
      notifier.liblueColor,
      notifier.liblueColor,
      notifier.liredColor,
      notifier.liblueColor,
      notifier.liyellowColor,
      notifier.liyellowColor,
      notifier.liblueColor,
      notifier.liredColor,
      notifier.liblueColor,
      notifier.liblueColor,
      notifier.liyellowColor,
      notifier.liredColor,
      notifier.liblueColor,
      notifier.liyellowColor,
      notifier.liblueColor,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: width < 650 ? 55 : 40,
                child: width < 650
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reviews",
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
                                "Reviews",
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
                            "Reviews",
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
                                "Reviews",
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
                    ? 1330
                    : width < 1995
                        ? 1300
                        : 1130,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width < 430
                                ? constraints.maxWidth / 1.7
                                : width < 650
                                    ? constraints.maxWidth / 1.5
                                    : width < 950
                                        ? constraints.maxWidth / 2
                                        : width < 1200
                                            ? constraints.maxWidth / 3
                                            : constraints.maxWidth / 4,
                            child: Searchfield(),
                          ),
                          Popupbutton(
                            title: "This Week",
                            items: const [
                              "This Day",
                              "This Week",
                              "This Month",
                              "This Year",
                            ],
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
                            width: width < 1550 ? null : constraints.maxWidth,
                            child: Table(
                              border: TableBorder(
                                horizontalInside:
                                    BorderSide(color: notifier.getfillborder),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(50),
                                1: FixedColumnWidth(80),
                                2: FixedColumnWidth(200),
                                3: FixedColumnWidth(380),
                                4: FixedColumnWidth(100),
                                5: FixedColumnWidth(150),
                                6: FixedColumnWidth(150),
                                7: FixedColumnWidth(115),
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
                                              width: 2,
                                              color: notifier.chakboxborder,
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
                                          "ID",
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
                                          "Product",
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
                                          "Customer Review",
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
                                          "Rating",
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
                                          "Date",
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
                                for (var a = reviewController.loadmore;
                                    a <
                                        reviewController.loadmore +
                                            reviewController.selectindex;
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
                                                    width: 2,
                                                    color:
                                                        notifier.chakboxborder,
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
                                            reviewController.id[a],
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: ClipOval(
                                              child: Image.network(
                                                reviewController
                                                    .productImages[a],
                                                height: 40,
                                                width: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            title: Text(
                                              reviewController.productName[a],
                                              style: TextStyle(
                                                fontFamily: "Outfit",
                                                fontSize: 15,
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
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: ClipOval(
                                              child: Image.asset(
                                                reviewController
                                                    .customerImages[a],
                                                height: height / 20,
                                              ),
                                            ),
                                            title: RichText(
                                              text: TextSpan(
                                                text: 'By ',
                                                style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontFamily: "Outfit",
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: reviewController
                                                        .customerNames[a],
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: notifier.text,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            subtitle: Text(
                                              reviewController
                                                  .customerReviews[a],
                                              style: TextStyle(
                                                fontFamily: "Outfit",
                                                fontSize: 15,
                                                color: Colors.grey,
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
                                            children: [
                                              Text(
                                                reviewController.rating[a],
                                                style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontFamily: "Outfit",
                                                  fontSize: 15,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.star,
                                                color: Color(0xFFffb264),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            reviewController.date[a],
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
                                            color: statusbgColors[a],
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Center(
                                            child: Text(
                                              reviewController.status[a],
                                              style: TextStyle(
                                                letterSpacing: 1,
                                                fontFamily: "Outfit",
                                                fontSize: 15,
                                                color: reviewController
                                                    .statusTextColors[a],
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
                                              InkWell(
                                                onTap: () {
                                                  mainDrawerController
                                                      .updateSelectedIndex(22);
                                                },
                                                child: Image.asset(
                                                  "assets/images/eye.png",
                                                  height: 20,
                                                  color: Color(0xFF2a8ef6),
                                                ),
                                              ),
                                              SizedBox(width: 15),
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
                              reviewController.id.shuffle();
                              reviewController.productImages.shuffle();
                              reviewController.productName.shuffle();
                              reviewController.customerImages.shuffle();
                              reviewController.customerNames.shuffle();
                              reviewController.customerReviews.shuffle();
                              reviewController.rating.shuffle();
                              reviewController.date.shuffle();
                              reviewController.status.shuffle();
                            });
                            reviewController
                                .setloadmore(reviewController.selectpage);
                          }
                        },
                        nextbutton: () {
                          if (button == false) {
                            setState(() {
                              button = !button;
                              reviewController.id.shuffle();
                              reviewController.productImages.shuffle();
                              reviewController.productName.shuffle();
                              reviewController.customerImages.shuffle();
                              reviewController.customerNames.shuffle();
                              reviewController.customerReviews.shuffle();
                              reviewController.rating.shuffle();
                              reviewController.date.shuffle();
                              reviewController.status.shuffle();
                            });
                            reviewController
                                .setloadmore(reviewController.selectpage);
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
