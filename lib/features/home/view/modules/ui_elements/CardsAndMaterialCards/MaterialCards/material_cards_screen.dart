
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';
import 'card_alignment_option.dart';
import 'card_multiple_sections.dart';
import 'card_with_footer.dart';
import 'card_with_image.dart';

class MaterialCardsScreen extends StatefulWidget {
  const MaterialCardsScreen({super.key});

  @override
  State<MaterialCardsScreen> createState() => _MaterialCardsScreenState();
}

class _MaterialCardsScreenState extends State<MaterialCardsScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

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
                            "Material Cards",
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
                                "Material Cards",
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
                            "Material Cards",
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
                                "Material Cards",
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
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: notifier.getBgColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(5, 6),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Simple card",
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: notifier.text,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          CardWithFooter(),
                          SizedBox(height: 20),
                          CardWithImage(
                            sizeStatus: "Small",
                            image:
                                "https://images.unsplash.com/photo-1515529706504-b440b49fb63b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            imageheight: 100,
                            imagewidth: 100,
                          ),
                          SizedBox(height: 20),
                          CardWithImage(
                            sizeStatus: "Medium",
                            image:
                                "https://images.unsplash.com/photo-1484788984921-03950022c9ef?q=80&w=2132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            imageheight: 135,
                            imagewidth: 135,
                          ),
                          SizedBox(height: 20),
                          CardWithImage(
                            sizeStatus: "Large",
                            image:
                                "https://images.pexels.com/photos/815494/pexels-photo-815494.jpeg?cs=srgb&dl=pexels-dzeninalukac-815494.jpg&fm=jpg",
                            imageheight: 170,
                            imagewidth: 170,
                          ),
                          SizedBox(height: 20),
                          CardAlignmentOption(
                            title: "Card with actions alignment option",
                            alignmentStatus: "Start",
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          SizedBox(height: 20),
                          CardAlignmentOption(
                            title: "Card with actions alignment option",
                            alignmentStatus: "End",
                            mainAxisAlignment: MainAxisAlignment.end,
                          ),
                          SizedBox(height: 20),
                          CardAlignmentOption(
                            title: "Card with sub-title",
                            alignmentStatus: "Dog Breed",
                            subtitle1: "This card indeterminates progress bar.",
                            subtitle2:
                                "The Mateo Luca is the smallest of the six original and distinct spitz breeds of dog from Japan. A small, agile dog that copes very well with mountainous terrain, the Shiba Inu was originally bred for.",
                            mainAxisAlignment: MainAxisAlignment.start,
                          ),
                          SizedBox(height: 20),
                          CardWithImage(
                            sizeStatus: "Extra large",
                            image:
                                "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
                            imageheight: width < 400 ? 200 : 250,
                            imagewidth: width < 400 ? 200 : 250,
                          ),
                          SizedBox(height: 20),
                          CardMultipleSections(),
                        ],
                      )
                    : width < 950
                        ? Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color: notifier.getBgColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(5, 6),
                                                blurRadius: 10,
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Simple card",
                                                style: TextStyle(
                                                  fontFamily: "Outfit",
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifier.text,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        CardWithFooter(),
                                        SizedBox(height: 20),
                                        CardWithImage(
                                          sizeStatus: "Small",
                                          image:
                                              "https://images.unsplash.com/photo-1515529706504-b440b49fb63b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                          imageheight: 100,
                                          imagewidth: 100,
                                        ),
                                        SizedBox(height: 20),
                                        CardWithImage(
                                          sizeStatus: "Medium",
                                          image:
                                              "https://images.unsplash.com/photo-1484788984921-03950022c9ef?q=80&w=2132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                          imageheight: 135,
                                          imagewidth: 135,
                                        ),
                                        SizedBox(height: 20),
                                        CardWithImage(
                                          sizeStatus: "Large",
                                          image:
                                              "https://images.pexels.com/photos/815494/pexels-photo-815494.jpeg?cs=srgb&dl=pexels-dzeninalukac-815494.jpg&fm=jpg",
                                          imageheight: 170,
                                          imagewidth: 170,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      children: const [
                                        CardAlignmentOption(
                                          title:
                                              "Card with actions alignment option",
                                          alignmentStatus: "Start",
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                        ),
                                        SizedBox(height: 20),
                                        CardAlignmentOption(
                                          title:
                                              "Card with actions alignment option",
                                          alignmentStatus: "End",
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                        ),
                                        SizedBox(height: 20),
                                        CardAlignmentOption(
                                          title: "Card with sub-title",
                                          alignmentStatus: "Dog Breed",
                                          subtitle1:
                                              "This card indeterminates progress bar.",
                                          subtitle2:
                                              "The Mateo Luca is the smallest of the six original and distinct spitz breeds of dog from Japan. A small, agile dog that copes very well with mountainous terrain, the Shiba Inu was originally bred for.",
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                        ),
                                        SizedBox(height: 20),
                                        CardWithImage(
                                          sizeStatus: "Extra large",
                                          image:
                                              "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
                                          imageheight: 250,
                                          imagewidth: 250,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(child: CardMultipleSections()),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: notifier.getBgColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(5, 6),
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.1),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Simple card",
                                            style: TextStyle(
                                              fontFamily: "Outfit",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                              color: notifier.text,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    CardWithFooter(),
                                    SizedBox(height: 20),
                                    CardWithImage(
                                      sizeStatus: "Small",
                                      image:
                                          "https://images.unsplash.com/photo-1515529706504-b440b49fb63b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      imageheight: 100,
                                      imagewidth: 100,
                                    ),
                                    SizedBox(height: 20),
                                    CardWithImage(
                                      sizeStatus: "Medium",
                                      image:
                                          "https://images.unsplash.com/photo-1484788984921-03950022c9ef?q=80&w=2132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                      imageheight: 135,
                                      imagewidth: 135,
                                    ),
                                    SizedBox(height: 20),
                                    CardWithImage(
                                      sizeStatus: "Large",
                                      image:
                                          "https://images.pexels.com/photos/815494/pexels-photo-815494.jpeg?cs=srgb&dl=pexels-dzeninalukac-815494.jpg&fm=jpg",
                                      imageheight: 170,
                                      imagewidth: 170,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  children: const [
                                    CardAlignmentOption(
                                      title:
                                          "Card with actions alignment option",
                                      alignmentStatus: "Start",
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                    SizedBox(height: 20),
                                    CardAlignmentOption(
                                      title:
                                          "Card with actions alignment option",
                                      alignmentStatus: "End",
                                      mainAxisAlignment: MainAxisAlignment.end,
                                    ),
                                    SizedBox(height: 20),
                                    CardAlignmentOption(
                                      title: "Card with sub-title",
                                      alignmentStatus: "Dog Breed",
                                      subtitle1:
                                          "This card indeterminates progress bar.",
                                      subtitle2:
                                          "The Mateo Luca is the smallest of the six original and distinct spitz breeds of dog from Japan. A small, agile dog that copes very well with mountainous terrain, the Shiba Inu was originally bred for.",
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                    ),
                                    SizedBox(height: 20),
                                    CardWithImage(
                                      sizeStatus: "Extra large",
                                      image:
                                          "https://images.pexels.com/photos/277390/pexels-photo-277390.jpeg?cs=srgb&dl=pexels-pixabay-277390.jpg&fm=jpg",
                                      imageheight: 250,
                                      imagewidth: 250,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: CardMultipleSections(),
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
