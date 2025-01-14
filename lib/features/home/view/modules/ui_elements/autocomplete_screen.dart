
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/controllers.dart';
import '../../../theme/theme.dart';
import '../../../widget/my_drop_down_search_field.dart';

class AutocompleteScreen extends StatefulWidget {
  const AutocompleteScreen({super.key});

  @override
  State<AutocompleteScreen> createState() => _AutocompleteScreenState();
}

class _AutocompleteScreenState extends State<AutocompleteScreen> {
  
  late ColorNotifier notifier;
  
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  TextEditingController simpleControllers = TextEditingController();
  TextEditingController highlightControllers = TextEditingController();
  TextEditingController displayControllers = TextEditingController();
  TextEditingController filterControllers = TextEditingController();
  TextEditingController optionsGroupControllers = TextEditingController();
  TextEditingController plainInputControllers = TextEditingController();
  TextEditingController requireanControllers = TextEditingController();
  TextEditingController overviewControllers = TextEditingController();

  String? simpleText;
  String? highlightText;
  String? displayText;
  String? filterText;
  String? optionsGroupText;
  String? plainInputText;
  String? requireanText;
  String? overviewText;

  List<String> text = ["One", "Two", "Three"];
  List<String> display = ["Mary", "Shelley", "Igor"];
  List<String> optionGroups = [
    "Alabama",
    "Alaska",
    "Arizana",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming",
  ];
  List<String> plainInput = [
    "Champs-Élysées",
    "Lombard Street",
    "Lombard Street",
    "Abbey Road",
    "Fifth Avenue",
  ];

  List<String> requirean = ["One", "Two", "Three", "Four", "Five"];

  List<String> overviewImages = [
    "assets/images/Flag_of_Arkansas.svg",
    "assets/images/Flag_of_California.svg",
    "assets/images/Flag_of_Florida.svg",
    "assets/images/Flag_of_Texas.svg",
  ];
  List<String> overview = ["Arkansas", "California", "Florida", "Texas"];
  List<String> overviewPopulation = ["2.978M", "39.14M", "20.27M", "27.47M"];

  bool disableInput = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier = Provider.of(context,listen: true);

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
                            "Autocomplete",
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
                                "Autocomplete",
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
                            "Autocomplete",
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
                                "Autocomplete",
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
              width < 950
                  ? Column(
                      children: [
                        MyDropDownSearchfield(
                          titleText: "Simple Autocomplete",
                          labelText: "Number",
                          hintText: "Picke one",
                          controller: simpleControllers,
                          items: text,
                        ),
                        SizedBox(height: 20),
                        MyDropDownSearchfield(
                          titleText:
                              "Highlight the First Autocomplete Option",
                          labelText: "Number",
                          hintText: "Pick one",
                          controller: highlightControllers,
                          items: text,
                        ),
                        SizedBox(height: 20),
                        MyDropDownSearchfield(
                          titleText: "Display Value Autocomplete",
                          labelText: "Assignee",
                          hintText: "",
                          controller: displayControllers,
                          items: display,
                        ),
                        SizedBox(height: 20),
                        MyDropDownSearchfield(
                          titleText: "Filter Autocomplete",
                          labelText: "Number",
                          hintText: "Pick one",
                          controller: filterControllers,
                          items: text,
                        ),
                        SizedBox(height: 20),
                        MyDropDownSearchfield(
                          titleText: "Option Groups Autocomplete",
                          labelText: "States Groups",
                          hintText: "",
                          controller: optionsGroupControllers,
                          items: optionGroups,
                        ),
                        SizedBox(height: 20),
                        MyDropDownSearchfield(
                          titleText: "Plain Input Autocomplete",
                          labelText: "Search for a Street",
                          hintText: "",
                          controller: plainInputControllers,
                          items: plainInput,
                        ),
                        SizedBox(height: 20),
                        MyDropDownSearchfield(
                          titleText: "Autocomplete Overview",
                          labelText: "State",
                          hintText: "",
                          controller: overviewControllers,
                          items: overview,
                          showDisableInput: true,
                        ),
                        SizedBox(height: 20),
                        MyDropDownSearchfield(
                          titleText:
                              "Require an Autocomplete Option to be Selected",
                          labelText: "Number",
                          hintText: "Pick one",
                          controller: requireanControllers,
                          items: requirean,
                          showControlvalue: true,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: MyDropDownSearchfield(
                                titleText: "Simple Autocomplete",
                                labelText: "Number",
                                hintText: "Picke one",
                                controller: simpleControllers,
                                items: text,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MyDropDownSearchfield(
                                titleText:
                                    "Highlight the First Autocomplete Option",
                                labelText: "Number",
                                hintText: "Pick one",
                                controller: highlightControllers,
                                items: text,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MyDropDownSearchfield(
                                titleText: "Display Value Autocomplete",
                                labelText: "Assignee",
                                hintText: "",
                                controller: displayControllers,
                                items: display,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MyDropDownSearchfield(
                                titleText: "Filter Autocomplete",
                                labelText: "Number",
                                hintText: "Pick one",
                                controller: filterControllers,
                                items: text,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MyDropDownSearchfield(
                                titleText: "Option Groups Autocomplete",
                                labelText: "States Groups",
                                hintText: "",
                                controller: optionsGroupControllers,
                                items: optionGroups,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MyDropDownSearchfield(
                                titleText: "Plain Input Autocomplete",
                                labelText: "Search for a Street",
                                hintText: "",
                                controller: plainInputControllers,
                                items: plainInput,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: MyDropDownSearchfield(
                                titleText: "Autocomplete Overview",
                                labelText: "State",
                                hintText: "",
                                controller: overviewControllers,
                                items: overview,
                                showDisableInput: true,
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: MyDropDownSearchfield(
                                titleText:
                                    "Require an Autocomplete Option to be Selected",
                                labelText: "Number",
                                hintText: "Pick one",
                                controller: requireanControllers,
                                items: requirean,
                                showControlvalue: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
              // SizedBox(height: 250),
            ],
          ),
        );
      },
    );
  }
}
