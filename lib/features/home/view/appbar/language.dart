
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../theme/theme.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  late ColorNotifier notifier;

  List countryflags = [
    "assets/images/usa.png",
    "assets/images/australia.png",
    "assets/images/spain.png",
    "assets/images/france.png",
    "assets/images/germany.png",
  ];

  List langyage = [
    "English",
    "Australian",
    "Spanish",
    "French",
    "German",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        tooltip: '',
        color: notifier.getBgColor,
        offset: const Offset(0, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // initialValue: UserRole,
        elevation: 1,
        splashRadius: 1,
        constraints: BoxConstraints(
          maxWidth: 200,
          minWidth: 200,
        ),
        shadowColor: Colors.grey,
        child: SizedBox(
          height: height / 35,
          child: Row(
            children: [
              Image.asset(
                "assets/images/translate.png",
                color: notifier.text,
                height: 20,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: notifier.text,
              ),
            ],
          ),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            padding: const EdgeInsets.all(12),
            enabled: false,
            // value: UserRole.itemTwo,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose Language",
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: notifier.text,
                  ),
                ),
                SizedBox(height: 20),
                StyledDivider(
                  lineStyle: DividerLineStyle.dashed,
                  color: notifier.getfillborder,
                ),
                ListView.separated(
                  itemCount: countryflags.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              countryflags[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        langyage[index],
                        style: TextStyle(
                          fontFamily: "Outfit",
                          color: notifier.text,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return StyledDivider(
                      lineStyle: DividerLineStyle.dashed,
                      color: notifier.getfillborder,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
