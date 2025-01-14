
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key});

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  final ScrollController _scrollController = ScrollController();

  late ColorNotifier notifier;

  PageController pageController = PageController();

  int activePage = 0;

  List productImages = [
    "https://cdn.pixabay.com/photo/2022/08/16/04/52/jewel-7389356_640.jpg",
    "https://rukminim2.flixcart.com/image/850/1000/xif0q/ring/p/d/f/adjustable-1-princess-crown-ring-miss-india-world-fancy-party-original-imagnqquyksvqphs.jpeg?q=90&crop=false",
    "https://www.jewelove.in/cdn/shop/files/jewelove-18k-rose-gold-ring-with-pink-diamond-for-women-jl-au-100-women-s-band-only-si-ij-38986974757105.jpg?v=1687349248&width=1537",
    "https://5.imimg.com/data5/SELLER/Default/2024/2/394573465/JO/DD/TU/197385888/leaf-pattern-daily-wear-ladies-gold-ring.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: width < 950 ? width - 40 : 550,
          width: width < 950 ? width : 550,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: PageView.builder(
            pageSnapping: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padEnds: true,
            itemCount: productImages.length,
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                activePage = value;
              });
            },
            allowImplicitScrolling: true,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  productImages[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 100,
          width: 400,
          child: ListView.separated(
            itemCount: productImages.length,
            controller: _scrollController,
            shrinkWrap: true,
            physics:
                width < 500 ? ScrollPhysics() : NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    pageController.animateToPage(index,
                        duration: kTabScrollDuration, curve: Curves.easeIn);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      productImages[index],
                      width: 90,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 8);
            },
          ),
        ),
      ],
    );
  }
}
