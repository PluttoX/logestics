import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logestics/features/authentication/domain/useCases/sign_out_use_case.dart';
import 'package:logestics/features/home/Controllers/controllers.dart';
import 'package:provider/provider.dart';
import 'package:styled_divider/styled_divider.dart';

import '../../theme/theme.dart';

enum SamplePopup {
  itemOne,
  itemTwo,
  itemThree,
  itemfour,
  itemfive,
  itemsix,
  itemsevan,
  itemeight
}

class Profilepopup extends StatefulWidget {
  const Profilepopup({super.key});

  @override
  State<Profilepopup> createState() => _ProfilepopupState();
}

class _ProfilepopupState extends State<Profilepopup> {
  List profilepopupmenu = [
    "assets/images/user.png",
    "assets/images/settings.png",
    "assets/images/exclamation-circle.png",
    "assets/images/log-out.png",
  ];

  List profilepopupmenutext = [
    "My profile",
    "Settings",
    "Support",
    "Logout",
  ];

  late ColorNotifier notifier;

  SamplePopup? selectePopup;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PopupMenuButton(
        tooltip: "",
        color: notifier.getBgColor,
        offset: const Offset(0, 50),
        initialValue: selectePopup,
        elevation: 1,
        splashRadius: 1,
        constraints: const BoxConstraints(
          maxWidth: 200,
          minWidth: 200,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        itemBuilder: (context) => <PopupMenuEntry<SamplePopup>>[
          PopupMenuItem(
            value: SamplePopup.itemOne,
            enabled: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset(
                      "assets/images/avatar-7 1.png",
                      height: height / 20,
                    ),
                    title: Text(
                      "Zaheer",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: notifier.text,
                      ),
                    ),
                    subtitle: const Text(
                      "admin",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Outfit",
                        fontSize: 15,
                      ),
                    ),
                  ),
                  StyledDivider(
                    color: notifier.getfillborder,
                    lineStyle: DividerLineStyle.dashed,
                  ),
                  ListView.builder(
                    itemCount: profilepopupmenu.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return TextButton(
                        onPressed: (){
                          if(index==3){
                            Get.find<MainDrawerController>().signOut();
                          }
                        },
                        child: ListTile(
                          leading: Image.asset(
                            profilepopupmenu[index],
                            color: const Color(0xff0165FC),
                          ),
                          title: Text(
                            profilepopupmenutext[index],
                            style: TextStyle(
                              fontFamily: "Outfit",
                              color: notifier.text,
                              fontSize: 15,
                            ),
                          ),

                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
        child: Container(
          height: height / 20,
          decoration: const BoxDecoration(),
          child: Row(
            children: [
              Image.asset(
                "assets/images/avatar-7 1.png",
                height: height / 20,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: notifier.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
