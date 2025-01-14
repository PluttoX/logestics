
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../../Controllers/controllers.dart';
import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/file_picker.dart';
import '../../../../widget/my_dropdown_field.dart';
import '../../../../widget/my_text_field.dart';

class CreateSellerScreen extends StatefulWidget {
  const CreateSellerScreen({super.key});

  @override
  State<CreateSellerScreen> createState() => _CreateSellerScreenState();
}

class _CreateSellerScreenState extends State<CreateSellerScreen> {
  @override
  Widget build(BuildContext context) {
    MainDrawerController mainDrawerController = Get.put(MainDrawerController());

    final QuillEditorController quillEditorController = QuillEditorController();

    late ColorNotifier notifier;

    @override
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(),
          height: width < 950 ? 80 : 40,
          child: width < 950
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Seller",
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
                          "E-Commerce",
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
                          "Sellers",
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
                      ],
                    ),
                    Text(
                      "Create Seller",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 15,
                        color: notifier.text,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create Seller",
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
                          "E-Commerce",
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
                          "Sellers",
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
                          "Create Seller",
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
          height: width < 450
              ? 1550
              : width < 600
                  ? 1500
                  : null,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              width < 600
                  ? Column(
                      children: [
                        MyTextFormField(
                          titleText: "Seller Name",
                          labelText: "Enter seller name",
                          hintText: "",
                        ),
                        SizedBox(height: 20),
                        MyTextFormField(
                          titleText: "Store Name",
                          labelText: "Enter store name",
                          hintText: "",
                        ),
                        SizedBox(height: 20),
                        MyTextFormField(
                          titleText: "Phone Number",
                          labelText: "Enter phone number",
                          hintText: "",
                        ),
                        SizedBox(height: 20),
                        MyTextFormField(
                          titleText: "Email Address",
                          labelText: "Enter email address",
                          hintText: "",
                        ),
                        SizedBox(height: 20),
                        MyTextFormField(
                          titleText: "Date of Birth",
                          labelText: "Enter date of birth",
                          hintText: "",
                        ),
                        SizedBox(height: 20),
                        MyDropdownFormField(
                          titletext: "City",
                          hinttext: "Select city",
                          items: const [
                            "New York",
                            "Tokyo",
                            "London",
                            "Amsterdam",
                            "Paris",
                          ],
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 20),
                        MyDropdownFormField(
                          titletext: "Country",
                          hinttext: "Select country",
                          items: const [
                            "Switzerland",
                            "New Zealand",
                            "Germany",
                            "United States",
                            "Japan",
                            "Netherlands",
                            "Sweden",
                            "Canada",
                            "United Kingdom",
                            "Australia",
                          ],
                          onChanged: (value) {},
                        ),
                        SizedBox(height: 20),
                        MyTextFormField(
                          titleText: "ZIP/Postcode",
                          labelText: "Enter zip / postcode",
                          hintText: "",
                        ),
                        SizedBox(height: 20),
                        MyTextFormField(
                          titleText: "Wallet Balance",
                          labelText: "Enter wallet balance",
                          hintText: "",
                        ),
                      ],
                    )
                  : width < 950
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    titleText: "Seller Name",
                                    labelText: "Enter seller name",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Phone Number",
                                    labelText: "Enter phone number",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Date of Birth",
                                    labelText: "Enter date of birth",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyDropdownFormField(
                                    titletext: "Country",
                                    hinttext: "Select country",
                                    items: const [
                                      "Switzerland",
                                      "New Zealand",
                                      "Germany",
                                      "United States",
                                      "Japan",
                                      "Netherlands",
                                      "Sweden",
                                      "Canada",
                                      "United Kingdom",
                                      "Australia",
                                    ],
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Wallet Balance",
                                    labelText: "Enter wallet balance",
                                    hintText: "",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    titleText: "Store Name",
                                    labelText: "Enter store name",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Email Address",
                                    labelText: "Enter email address",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyDropdownFormField(
                                    titletext: "City",
                                    hinttext: "Select city",
                                    items: const [
                                      "New York",
                                      "Tokyo",
                                      "London",
                                      "Amsterdam",
                                      "Paris",
                                    ],
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "ZIP/Postcode",
                                    labelText: "Enter zip / postcode",
                                    hintText: "",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  MyTextFormField(
                                    titleText: "Seller Name",
                                    labelText: "Enter seller name",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Email Address",
                                    labelText: "Enter email address",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyDropdownFormField(
                                    titletext: "Country",
                                    hinttext: "Select country",
                                    items: const [
                                      "Switzerland",
                                      "New Zealand",
                                      "Germany",
                                      "United States",
                                      "Japan",
                                      "Netherlands",
                                      "Sweden",
                                      "Canada",
                                      "United Kingdom",
                                      "Australia",
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                children: const [
                                  MyTextFormField(
                                    titleText: "Store Name",
                                    labelText: "Enter store name",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Date of Birth",
                                    labelText: "Enter date of birth",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "ZIP/Postcode",
                                    labelText: "Enter zip / postcode",
                                    hintText: "",
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
                                    labelText: "Enter phone number",
                                    hintText: "",
                                  ),
                                  SizedBox(height: 20),
                                  MyDropdownFormField(
                                    titletext: "City",
                                    hinttext: "Select city",
                                    items: const [
                                      "New York",
                                      "Tokyo",
                                      "London",
                                      "Amsterdam",
                                      "Paris",
                                    ],
                                    onChanged: (value) {},
                                  ),
                                  SizedBox(height: 20),
                                  MyTextFormField(
                                    titleText: "Wallet Balance",
                                    labelText: "Enter wallet balance",
                                    hintText: "",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
              SizedBox(height: 20),
              Text(
                "Description",
                style: TextStyle(
                  fontFamily: "Outfit",
                  color: notifier.text,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 7),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: notifier.getBgColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: notifier.getfillborder),
                ),
                child: Column(
                  children: [
                    ToolBar(
                      activeIconColor: Color(0xFF0f79f3),
                      padding: const EdgeInsets.all(8),
                      iconSize: 15,
                      iconColor: notifier.text,
                      controller: quillEditorController,
                      toolBarColor: notifier.getBgColor,
                    ),
                    QuillHtmlEditor(
                      controller: quillEditorController,
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Outfit",
                      ),
                      backgroundColor: notifier.getBgColor,
                      hintText: 'Type here...',
                      hintTextStyle: TextStyle(
                        fontFamily: "Outfit",
                        color: Colors.grey,
                      ),
                      isEnabled: true,
                      minHeight: 150,
                      hintTextAlign: TextAlign.start,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      hintTextPadding: EdgeInsets.zero,
                      loadingBuilder: (context) {
                        return const Center();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              FilePickerView(title: "Upload Image"),
              SizedBox(height: 20),
              Row(
                children: [
                  CustomButton(
                    text: "Create Seller",
                    onPressed: () {},
                    bgcolor: Color(0xFF0f79f3),
                    height: 50,
                    width: 160,
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    text: "Cancel",
                    onPressed: () {},
                    bgcolor: Color(0xFFe74c3c),
                    width: 130,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
