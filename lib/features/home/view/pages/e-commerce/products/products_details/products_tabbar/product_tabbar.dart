
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/pages/e-commerce/products/products_details/products_tabbar/ratings_tab/ratings_review.dart';
import 'package:provider/provider.dart';

import '../../../../../../theme/theme.dart';
import 'description_tab.dart';

class ProductTabbar extends StatefulWidget {
  const ProductTabbar({super.key});

  @override
  State<ProductTabbar> createState() => _ProductTabbarState();
}

class _ProductTabbarState extends State<ProductTabbar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  late ColorNotifier notifier;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context,listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            DefaultTabController(
              length: tabController.length,
              child: TabBar(
                isScrollable: true,
                dividerHeight: 50,
                dividerColor: notifier.mainBgColor,
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                indicatorColor: const Color(0xff0165FC),
                controller: tabController,
                labelColor: const Color(0xFF0165FC),
                unselectedLabelColor: notifier.text,

                onTap: (value) {

                },
                physics: NeverScrollableScrollPhysics(),
                padding: width < 850
                    ? EdgeInsets.zero
                    : EdgeInsets.symmetric(horizontal: width / 35),
                tabAlignment: TabAlignment.start,
                tabs: const [
                  Tab(
                    child: Text("Description", overflow: TextOverflow.ellipsis),
                  ),
                  Tab(
                    child: Text("Ratings & Reviews",
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  ),
              height: width < 340
                  ? 2050
                  : width < 390
                      ? 1950
                      : width < 430
                          ? 1850
                          : width < 480
                              ? 1680
                              : width < 510
                                  ? 1620
                                  : width < 650
                                      ? 1550
                                      : width < 750
                                          ? 1450
                                          : width < 850
                                              ? 1350
                                              : width < 950
                                                  ? 1250
                                                  : width < 1260
                                                      ? 1100
                                                      : width < 1480
                                                          ? 1050
                                                          : 980,
              child: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  DescriptionTab(),
                  RatingsReview(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
