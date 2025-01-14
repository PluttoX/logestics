
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';

class ChipsAutocomplete extends StatefulWidget {
  const ChipsAutocomplete({
    super.key,
    required this.title,
    required this.hintText,
    required this.labelText,
    required this.items,
    this.showControl,
  });

  final String title;
  final String hintText;
  final String labelText;
  final List<String> items;
  final bool? showControl;

  @override
  State<ChipsAutocomplete> createState() => _ChipsAutocompleteState();
}

class _ChipsAutocompleteState extends State<ChipsAutocomplete> {
  late ColorNotifier notifier;
  late double distanceToField;
  late StringTagController _stringTagController;

  bool disableInput = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _stringTagController = StringTagController();
  }

  @override
  void dispose() {
    super.dispose();
    _stringTagController.dispose();
  }

  // static const List<String> _initialTags = <String>["Lemon"];

  List controlble = ["Disable", "Enable"];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              widget.showControl == true
                  ? Row(
                      children: [
                        for (var i = 0; i < controlble.length; i++)
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: CustomButton(
                              text: controlble[i],
                              bgcolor: notifier.isDark
                                  ? Colors.black
                                  : Color(0xFFfdfbff),
                              showButtonShadow: true,
                              hovercolor: Color(0xff0165FC),
                              textcolor: notifier.text,
                              onPressed: () {
                                setState(() {
                                  if (i == 0) {
                                    if (disableInput == true) {
                                      disableInput = !disableInput;
                                    }
                                  } else {
                                    if (disableInput == false) {
                                      disableInput = !disableInput;
                                    }
                                  }
                                });
                              },
                            ),
                          ),
                      ],
                    )
                  : Container(),
              widget.showControl == true ? SizedBox(height: 15) : Container(),
              widget.showControl == true
                  ? Text(
                      "Enter video keywords",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    )
                  : Container(),
              widget.showControl == true ? SizedBox(height: 15) : Container(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: notifier.getfillborder,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: TextFieldTags<String>(
                    textfieldTagsController: _stringTagController,
                    initialTags: widget.items,
                    letterCase: LetterCase.normal,
                    inputFieldBuilder: (context, inputFieldValues) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              controller: inputFieldValues.tagScrollController,
                              scrollDirection: Axis.vertical,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 8,
                                  left: 8,
                                ),
                                child: Wrap(
                                  runSpacing: 4.0,
                                  spacing: 4.0,
                                  children: inputFieldValues.tags.map(
                                    (String tag) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: notifier.getfillborder,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                          vertical: 5.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            InkWell(
                                              child: Text(
                                                tag,
                                                style: TextStyle(
                                                  color: disableInput == false
                                                      ? Colors.grey
                                                      : notifier.text,
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                            const SizedBox(width: 4.0),
                                            InkWell(
                                              onTap: disableInput == false
                                                  ? null
                                                  : () {
                                                      inputFieldValues
                                                          .onTagRemoved(tag);
                                                    },
                                              child: Icon(
                                                Icons.cancel,
                                                size: 14.0,
                                                color: disableInput == false
                                                    ? Colors.grey
                                                    : notifier.text,
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ),
                          TextField(
                            onTap: () {
                              _stringTagController.getFocusNode?.requestFocus();
                            },
                            scrollPadding: EdgeInsets.symmetric(horizontal: 10),
                            cursorColor: const Color(0xff0165FC),
                            controller: inputFieldValues.textEditingController,
                            focusNode: inputFieldValues.focusNode,
                            style: TextStyle(color: notifier.text),
                            enabled: disableInput,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              isDense: false,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: notifier.getfillborder,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignLabelWithHint: true,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff0165FC),
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              errorText: inputFieldValues.error,
                              hintText: widget.hintText,
                              hintStyle: TextStyle(
                                color: disableInput == false
                                    ? Colors.grey
                                    : notifier.text,
                              ),
                              labelText: widget.labelText,
                              labelStyle: TextStyle(
                                color: disableInput == false
                                    ? Colors.grey
                                    : Color(0xff0165FC),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onChanged: inputFieldValues.onTagChanged,
                            onSubmitted: inputFieldValues.onTagSubmitted,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              widget.showControl == true ? SizedBox(height: 15) : Container(),
              widget.showControl == true
                  ? RichText(
                      text: TextSpan(
                        text: "The following keywords are entered : ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                          fontFamily: "Outfit",
                        ),
                        children: <TextSpan>[
                          for (var value = 0;
                              value < widget.items.length;
                              value++)
                            TextSpan(
                              text: "${widget.items[value]}, ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
