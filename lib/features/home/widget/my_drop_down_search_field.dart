// ignore_for_file: must_be_immutable


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class MyDropDownSearchfield extends StatefulWidget {
  const MyDropDownSearchfield({
    super.key,
    required this.titleText,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.items,
    this.showControlvalue,
    this.showDisableInput,
  });

  final String titleText;
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final List<String> items;
  final bool? showControlvalue;
  final bool? showDisableInput;

  @override
  State<MyDropDownSearchfield> createState() => _MyDropDownSearchfieldState();
}

class _MyDropDownSearchfieldState extends State<MyDropDownSearchfield> {
  late ColorNotifier notifier;

  bool disableInput = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: notifier.text,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20),
          widget.showControlvalue == true
              ? RichText(
                  maxLines: 2,
                  text: TextSpan(
                    text: "Control value : ",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF949ba3),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.controller.text.isEmpty
                            ? "empty"
                            : widget.controller.text,
                        style: TextStyle(
                          fontSize: 17,
                          color: notifier.text,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          widget.showControlvalue == true ? SizedBox(height: 20) : Container(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: notifier.getfillborder,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TypeAheadField(
              controller: widget.controller,
              builder: (context, controller, focusNode) {
                return TextFormField(
                  controller: widget.controller,
                  focusNode: focusNode,
                  cursorColor: notifier.text,
                  enabled: disableInput,
                  style: TextStyle(color: notifier.text),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: notifier.getfillborder, width: 0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff0165FC),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: notifier.text,
                    ),
                    labelText: widget.labelText,
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Color(0xff0165FC),
                    ),
                  ),
                );
              },
              onSelected: (item) {
                setState(() {
                  widget.controller.text = item.toString();
                });
              },
              suggestionsCallback: (pattern) async {
                return widget.items
                    .where((element) =>
                        element.toLowerCase().contains(pattern.toLowerCase()))
                    .toList();
              },
              emptyBuilder: (context) => Container(
                decoration: BoxDecoration(
                  color: notifier.getBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "Item No Found...!!!",
                      style: TextStyle(color: notifier.text),
                    ),
                  ],
                ),
              ),
              itemBuilder: (context, suggestion) {
                return Container(
                  color: notifier.getBgColor,
                  child: ListTile(
                    minLeadingWidth: 0,
                    title: Text(
                      suggestion,
                      style: TextStyle(color: notifier.text),
                    ),
                  ),
                );
              },
            ),
          ),
          widget.showDisableInput == true ? SizedBox(height: 10) : Container(),
          widget.showDisableInput == true
              ? InkWell(
                  onTap: () {
                    setState(() {
                      disableInput = !disableInput;
                    });
                  },
                  child: Row(
                    children: [
                      CupertinoSwitch(
                        value: disableInput,
                        onChanged: (value) {
                          setState(() {
                            disableInput = !disableInput;
                          });
                        },
                        activeColor: Color(0xFF0f79f3),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Disable Input?",
                        style: TextStyle(
                          color: notifier.text,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

// child: DropDownSearchFormField(
//   textFieldConfiguration: TextFieldConfiguration(
//     enabled: disableInput,
//     decoration: InputDecoration(
//       contentPadding:
//           EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: Color(0xFFdfe4ee), width: 0),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       focusedBorder: UnderlineInputBorder(
//         borderSide: const BorderSide(
//           color: Color(0xff0165FC),
//         ),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       hintText: widget.hintText,
//       hintStyle: TextStyle(
//         color: notifier.text,
//         fontFamily: "Outfit",
//       ),
//       labelText: widget.labelText,
//       labelStyle: TextStyle(
//         color: Colors.grey,
//         fontFamily: "Outfit",
//       ),
//       floatingLabelStyle: TextStyle(
//         color: Color(0xff0165FC),
//         fontFamily: "Outfit",
//       ),
//     ),
//     controller: widget.controller,
//     style: TextStyle(fontFamily: "Outfit"),
//     cursorColor: const Color(0xff0165FC),
//   ),
//   suggestionsCallback: (pattern) {
//     return widget.items;
//   },
//   itemBuilder: (context, String suggestion) {
//     return ListTile(
//       contentPadding: EdgeInsets.symmetric(horizontal: 10),
//       title: Text(
//         suggestion,
//         style: TextStyle(
//           fontFamily: "Outfit",
//         ),
//       ),
//     );
//   },
//   suggestionsBoxDecoration: SuggestionsBoxDecoration(
//     borderRadius: BorderRadius.circular(8),
//     color: Colors.white,
//     elevation: 0.7,
//   ),
//   transitionBuilder: (context, suggestionsBox, controller) {
//     return suggestionsBox;
//   },
//   onSuggestionSelected: (String suggestion) {
//     setState(() {
//       widget.controller.text = suggestion;
//     });
//   },
//   suggestionsBoxController: widget.suggestionsBoxController,
//   onSaved: (value) => widget.selectedText = value!,
//   displayAllSuggestionWhenTap: true,
// ),
