
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/theme.dart';

late ColorNotifier notifier;

Widget topSalesLocations(context) {
  List countryflags = [
    "assets/images/usa.png",
    "assets/images/china.png",
    "assets/images/australia.png",
    "assets/images/germany.png",
    "assets/images/canada.png",
    "assets/images/france.png",
  ];

  List countrynames = [
    "United States",
    "China",
    "Australia",
    "Germany",
    "Canada",
    "France",
  ];

  List countrysales = ["85%", "60%", "70%", "75%", "80%", "65%"];

  var height = MediaQuery.of(context).size.height;

  var width = MediaQuery.of(context).size.width;

  notifier = Provider.of(context, listen: true);

  if (width < 850) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Sales Locations",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: notifier.text,
              // color: const Color(0xFF475569),
            ),
          ),
          Image.asset(
            "assets/images/locations-map.png",
            height: width < 850 ? null : height / 5,
          ),
          SizedBox(
            width: width,
            child: Center(
              child: ListView.separated(
                itemCount: countryflags.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Image.asset(countryflags[index], height: 15),
                      const SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: countrynames[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Outfit",
                            color: Colors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: " ${countrysales[index]}",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 14, color: notifier.text,
                                // color: const Color(0xFF475569),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              ),
            ),
          ),
        ],
      ),
    );
  } else {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Sales Locations",
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: notifier.text,
              // color: const Color(0xFF475569),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image.asset("assets/images/locations-map.png"),
              ),
              SizedBox(width: width / 20),
              Expanded(
                child: SizedBox(
                  width: width / 10,
                  child: Center(
                    child: ListView.separated(
                      itemCount: countryflags.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Image.asset(countryflags[index], height: 15),
                            const SizedBox(width: 10),
                            RichText(
                              text: TextSpan(
                                text: countrynames[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Outfit",
                                  color: Colors.grey,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " ${countrysales[index]}",
                                    style: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 14, color: notifier.text,
                                      // color: const Color(0xFF475569),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
