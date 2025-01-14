import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/dashbord/e_commerece/recent_orders.dart';
import 'package:logestics/features/home/view/dashbord/e_commerece/revenue.dart';
import 'package:logestics/features/home/view/dashbord/e_commerece/top_sales_locations.dart';
import 'package:logestics/features/home/view/dashbord/e_commerece/top_sellers.dart';
import 'package:logestics/features/home/view/dashbord/e_commerece/total_selling_products.dart';
import 'package:logestics/features/home/view/dashbord/e_commerece/transactions_history.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';
import '../../../widget/mycontainers.dart';
import 'e_commerce_widget1.dart';
import 'e_commerce_widget2.dart';
import 'order_summary.dart';

final ScrollController scrollController = ScrollController();

class ECommercePageView extends StatefulWidget {
  const ECommercePageView({super.key});

  @override
  State<ECommercePageView> createState() => _ECommercePageViewState();
}

class _ECommercePageViewState extends State<ECommercePageView> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 840) {
          return SingleChildScrollView(
            // controller: scrollController,
            child: Column(
              children: [
                SizedBox(
                  width: width,
                  height: 270,
                  child: totalSales(context),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 150,
                  child: mycontainers(
                    context,
                    title: "Total Orders",
                    subtitle: "23,075",
                    text: "4.75% increase in order last Week",
                    image: "assets/images/trend-up.png",
                    containertext: "5.80%",
                    textColor: Colors.green,
                    backgroundColor: notifier.ligreenColor,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0f79f3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/shopping-cart.svg",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 150,
                  child: mycontainers(
                    context,
                    title: "Total Customer",
                    subtitle: "65,234",
                    text: "Total visits decrease by 1.25%",
                    backgroundColor: notifier.liredColor,
                    textColor: Colors.red,
                    containertext: "2.65%",
                    image: "assets/images/trend-down.png",
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Color(0xFF00cae3),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/users-group.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 150,
                  child: mycontainers(
                    context,
                    title: "Total Revenue",
                    subtitle: "\$23,646",
                    text: "Revenue increases this month",
                    backgroundColor: notifier.ligreenColor,
                    image: "assets/images/trend-up.png",
                    textColor: Colors.green,
                    containertext: "4.40%",
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Color(0xFFffb264),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/dollar.png",
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 170,
                  child: salesOverview(context),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: profit(context),
                ),
                const SizedBox(height: 20),
                SizedBox(height: 300, child: averageDailySales(context)),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  width: width,
                  child: bestSellerOfTheMonth(context),
                ),
                const SizedBox(height: 20),
                SizedBox(height: 200, child: newCustomersThisMonth(context)),
                const SizedBox(height: 20),
                SizedBox(
                  height: width < 550 ? 530 : 480,
                  child: totalSellingProducts(context),
                ),
                const SizedBox(height: 20),
                SizedBox(height: 400, child: orderSummary(context)),
                const SizedBox(height: 20),
                SizedBox(height: 510, child: topSellers(context)),
                const SizedBox(height: 20),
                SizedBox(
                  height: width < 550
                      ? 550
                      : width < 850
                          ? 580
                          : 300,
                  child: topSalesLocations(context),
                ),
                const SizedBox(height: 20),
                SizedBox(height: 270, child: revenue(context)),
                const SizedBox(height: 20),
                SizedBox(
                  height: width < 550 ? 520 : 490,
                  child: recentOrder(context),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: width < 550 ? 520 : 490,
                  child: transactionsHistory(context),
                ),
              ],
            ),
          );
        } else {
          return SingleChildScrollView(
            // controller: scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: totalSales(context),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: mycontainers(
                                    context,
                                    title: "Total Orders",
                                    subtitle: "23,075",
                                    text: "4.75% increase in order last Week",
                                    image: "assets/images/trend-up.png",
                                    containertext: "5.80%",
                                    textColor: Colors.green,
                                    backgroundColor: notifier.ligreenColor,
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF0f79f3),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          "assets/images/shopping-cart.svg",
                                          color: Colors.white,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Expanded(
                                child: SizedBox(
                                  child: mycontainers(
                                    context,
                                    title: "Total Customer",
                                    subtitle: "65,234",
                                    text: "Total visits decrease by 1.25%",
                                    backgroundColor: notifier.liredColor,
                                    textColor: Colors.red,
                                    containertext: "2.65%",
                                    image: "assets/images/trend-down.png",
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      padding: const EdgeInsets.all(20),
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF00cae3),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/users-group.png",
                                          color: Colors.white,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 160,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: mycontainers(
                          context,
                          title: "Total Revenue",
                          subtitle: "\$23,646",
                          text: "Revenue increases this month",
                          backgroundColor: notifier.ligreenColor,
                          image: "assets/images/trend-up.png",
                          textColor: Colors.green,
                          containertext: "4.40%",
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              color: Color(0xFFffb264),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/dollar.png",
                                color: Colors.white,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(child: salesOverview(context)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: profit(context)),
                      const SizedBox(width: 20),
                      Expanded(child: averageDailySales(context)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: width,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: bestSellerOfTheMonth(context)),
                      const SizedBox(width: 20),
                      Expanded(child: newCustomersThisMonth(context)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 480,
                  child: totalSellingProducts(context),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 480,
                  child: Row(
                    children: [
                      Expanded(child: orderSummary(context)),
                      const SizedBox(width: 20),
                      Expanded(child: topSellers(context)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 270,
                  child: Row(
                    children: [
                      Expanded(child: topSalesLocations(context)),
                      const SizedBox(width: 20),
                      Expanded(child: revenue(context)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(height: 450, child: recentOrder(context)),
                const SizedBox(height: 20),
                SizedBox(height: 490, child: transactionsHistory(context)),
              ],
            ),
          );
        }
      },
    );
  }
}
