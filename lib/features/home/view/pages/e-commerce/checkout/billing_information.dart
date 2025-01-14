
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/my_dropdown_field.dart';
import '../../../../widget/my_text_field.dart';

class BillingInformation extends StatefulWidget {
  const BillingInformation({super.key, required this.createOrder});

  final bool createOrder;

  @override
  State<BillingInformation> createState() => _BillingInformationState();
}

class _BillingInformationState extends State<BillingInformation> {
  late ColorNotifier notifier;

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
            "Billing Information",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: "Outfit",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: notifier.text,
            ),
          ),
          SizedBox(height: 15),
          width < 600
              ? Column(
                  children: [
                    MyTextFormField(
                      titleText: "Customer Name",
                      hintText: "E.g. Mateo Luca",
                      labelText: "Your Name",
                    ),
                    SizedBox(height: 15),
                    MyTextFormField(
                      titleText: "Phone Number",
                      labelText: "Your phone number",
                      hintText: "E.g. +(415)555-0132",
                    ),
                    SizedBox(height: 15),
                    MyTextFormField(
                      titleText: "Email Address",
                      hintText: "E.g. Mateo Luca",
                      labelText: "Your Email Address",
                    ),
                    SizedBox(height: 15),
                    MyDropdownFormField(
                      titletext: "State",
                      hinttext: "Your state",
                      items: const [
                        "Florida",
                        "Wisconsin",
                        "Washington",
                        "Nebraska",
                        "Minnesota",
                      ],
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 15),
                    MyDropdownFormField(
                      titletext: "City",
                      hinttext: "Your city",
                      items: const [
                        "New York",
                        "Tokyo",
                        "London",
                        "Amsterdam",
                        "Paris",
                      ],
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 15),
                    MyTextFormField(
                      titleText: "ZIP / PostCode",
                      labelText: "Your zip / postcode",
                      hintText: "E.g. 3100",
                    ),
                    SizedBox(height: 15),
                    MyTextFormField(
                      titleText: "Street Address",
                      labelText: "Your street address",
                      hintText: "E.g. 123 Main Street,Anytown,USA",
                    ),
                    SizedBox(height: 15),
                    MyDropdownFormField(
                      titletext: "Country",
                      hinttext: "Your country",
                      items: const [
                        "Switzerland",
                        "New Zealand",
                        "Germany",
                        "United States",
                        "Japan",
                        "Netherlands",
                        "Sweden",
                        "United Kingdom",
                        "Canada",
                        "Australia",
                      ],
                      onChanged: (value) {},
                    ),
                  ],
                )
              : Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            MyTextFormField(
                              titleText: "Customer Name",
                              hintText: "E.g. Mateo Luca",
                              labelText: "Your Name",
                            ),
                            SizedBox(height: 15),
                            MyTextFormField(
                              titleText: "Email Address",
                              hintText: "E.g. Mateo Luca",
                              labelText: "Your Email Address",
                            ),
                            SizedBox(height: 15),
                            MyDropdownFormField(
                              titletext: "City",
                              hinttext: "Your city",
                              items: const [
                                "New York",
                                "Tokyo",
                                "London",
                                "Amsterdam",
                                "Paris",
                              ],
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 15),
                            MyTextFormField(
                              titleText: "Street Address",
                              labelText: "Your street address",
                              hintText: "E.g. 123 Main Street,Anytown,USA",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            MyTextFormField(
                              titleText: "Phone Number",
                              labelText: "Your phone number",
                              hintText: "E.g. +(415)555-0132",
                            ),
                            SizedBox(height: 15),
                            MyDropdownFormField(
                              titletext: "State",
                              hinttext: "Your state",
                              items: const [
                                "Florida",
                                "Wisconsin",
                                "Washington",
                                "Nebraska",
                                "Minnesota",
                              ],
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 15),
                            MyTextFormField(
                              titleText: "ZIP / PostCode",
                              labelText: "Your zip / postcode",
                              hintText: "E.g. 3100",
                            ),
                            SizedBox(height: 15),
                            MyDropdownFormField(
                              titletext: "Country",
                              hinttext: "Your country",
                              items: const [
                                "Switzerland",
                                "New Zealand",
                                "Germany",
                                "United States",
                                "Japan",
                                "Netherlands",
                                "Sweden",
                                "United Kingdom",
                                "Canada",
                                "Australia",
                              ],
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 15),
          Text(
            "Order Note (optional)",
            style: TextStyle(
              fontFamily: "Outfit",
              color: notifier.text,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 7),
          Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: notifier.getfillborder),
            ),
            child: TextField(
              style: TextStyle(
                fontFamily: "Outfit",
                color: notifier.text,
              ),
              cursorColor: Color(0xFF0f79f3),
              maxLines: 5,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(10),
                hintText: "E.g.it markes me feel...",
                hintStyle: TextStyle(
                  fontFamily: "Outfit",
                  color: notifier.text,
                ),
                labelText: "Write here...",
                labelStyle: TextStyle(
                  fontFamily: "Outfit",
                  color: Colors.grey,
                ),
                floatingLabelStyle: TextStyle(
                  color: Color(0xff0165FC),
                  fontFamily: "Outfit",
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: notifier.getfillborder,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF0f79f3),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              CustomButton(
                text: widget.createOrder == true
                    ? "Create Order"
                    : "Proceed To Shipping",
                onPressed: () {},
                bgcolor: Color(0xFF0f79f3),
                width: 160,
                height: 50,
              ),
              widget.createOrder == false ? Container() : SizedBox(width: 10),
              widget.createOrder == false
                  ? Container()
                  : CustomButton(
                      text: "Cancel",
                      onPressed: () {},
                      bgcolor: Color(0xFFe74c3c),
                      height: 50,
                      width: 130,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
