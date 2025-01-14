
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../../../Controllers/controllers.dart';
import '../../../../../theme/theme.dart';
import '../../../../../widget/custom_button.dart';
import '../../../../../widget/file_picker.dart';
import '../../../../../widget/multipleselect_dropdawon_field.dart';
import '../../../../../widget/my_dropdown_field.dart';
import '../../../../../widget/my_text_field.dart';

class CreateandEditProductScreen extends StatefulWidget {
  const CreateandEditProductScreen({
    super.key,
    this.editProduct,
  });
  final bool? editProduct;

  @override
  State<CreateandEditProductScreen> createState() =>
      _CreateandEditProductScreenState();
}

class _CreateandEditProductScreenState
    extends State<CreateandEditProductScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  final QuillEditorController quillEditorController = QuillEditorController();

  late ColorNotifier notifier;

  var productType = "Digital Product";
  var brandName = "Emburo";

  List selected = [];

  late List isActive;

  @override
  void initState() {
    isActive = List.filled(tags.length, false);
    super.initState();
  }

  void showDatePickers() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  List tags = [
    "Watch",
    "Electronics",
    "Sports",
    "Fashion",
    "Electronics",
    "Jewellery",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier=Provider.of(context,listen: true);

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
                        widget.editProduct == true
                            ? "Edit Product"
                            : "Create Product",
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
                            widget.editProduct == true
                                ? "Edit Product"
                                : "Create Product",
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
                        widget.editProduct == true
                            ? "Edit Product"
                            : "Create Product",
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
                            widget.editProduct == true
                                ? "Edit Product"
                                : "Create Product",
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
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(15),
            height: width < 600
                ? 2850
                : width < 950
                    ? 1800
                    : width < 1999
                        ? 1110
                        : 1120,
            decoration: BoxDecoration(
              color:notifier.getBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: width < 950
                ? Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add a Product",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: notifier.text,
                              ),
                            ),
                            SizedBox(height: 20),
                            width < 600
                                ? Column(
                                    children: [
                                      MyTextFormField(
                                        titleText: "Product Title",
                                        labelText: "Product Title",
                                        hintText: "E.g. Hand Watch",
                                      ),
                                      SizedBox(height: 15),
                                      MyDropdownFormField(
                                        titletext: "Brand Name",
                                        hinttext: "select",
                                        items: const [
                                          "Digital Product",
                                          "Physical Product"
                                        ],
                                        onChanged: (value) {
                                          productType = value;
                                        },
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "SKU",
                                        hintText: "E.g. ABC-12345",
                                        labelText: "SKU",
                                      ),
                                      SizedBox(height: 15),
                                      MyDropdownFormField(
                                        titletext: "Product Type",
                                        hinttext: "select",
                                        items: const [
                                          "Emburo",
                                          "Fediz",
                                          "Debilop",
                                          "Canin",
                                          "unity",
                                        ],
                                        onChanged: (value) {
                                          productType = value;
                                        },
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: const [
                                            MyTextFormField(
                                              titleText: "Product Title",
                                              labelText: "Product Title",
                                              hintText: "E.g. Hand Watch",
                                            ),
                                            SizedBox(height: 15),
                                            MyTextFormField(
                                              titleText: "SKU",
                                              hintText: "E.g. ABC-12345",
                                              labelText: "SKU",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            MyDropdownFormField(
                                              titletext: "Brand Name",
                                              hinttext: "select",
                                              items: const [
                                                "Digital Product",
                                                "Physical Product"
                                              ],
                                              onChanged: (value) {
                                                productType = value;
                                              },
                                            ),
                                            SizedBox(height: 15),
                                            MyDropdownFormField(
                                              titletext: "Product Type",
                                              hinttext: "select",
                                              items: const [
                                                "Emburo",
                                                "Fediz",
                                                "Debilop",
                                                "Canin",
                                                "unity",
                                              ],
                                              onChanged: (value) {
                                                productType = value;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                            SizedBox(height: 15),
                            Text(
                              "Product Description",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                color: notifier.text,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 7),
                            Container(
                              height: width < 530 ? 250 : 200,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: notifier.getBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color:notifier.getfillborder),
                              ),
                              child: Column(
                                children: [
                                  ToolBar(
                                    activeIconColor: Color(0xFF0f79f3),
                                    padding: const EdgeInsets.all(8),
                                    iconSize: 15,
                                    controller: quillEditorController,
                                   toolBarColor: notifier.getBgColor,
                                    iconColor: notifier.text,
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
                                    minHeight: 100,
                                    hintTextAlign: TextAlign.start,
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    hintTextPadding: EdgeInsets.zero,
                                    loadingBuilder: (context) {
                                      return const Center();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            width < 600
                                ? Column(
                                    children: [
                                      MyTextFormField(
                                        titleText: "Regular Price",
                                        labelText: "Regular Price",
                                        hintText: "E.g. \$99",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Sale Price",
                                        hintText: "E.g. \$29",
                                        labelText: "Sale Price",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Publish Schedule",
                                        hintText: "",
                                        labelText: "Choose a date",
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            showDatePickers();
                                          },
                                          icon: Icon(
                                              Icons.calendar_today_rounded,color: notifier.text,),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Product in Stock",
                                        hintText: "E.g. 17",
                                        labelText: "Product in Stock",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Product ID",
                                        labelText: "Product ID",
                                        hintText: "E.g. #1342-ABC",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Discout / Offer",
                                        hintText: "E.g. \$20",
                                        labelText: "Discout / Offer",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Available Date",
                                        hintText: "",
                                        labelText: "Choose a date",
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            showDatePickers();
                                          },
                                          icon: Icon(
                                              Icons.calendar_today_rounded,color: notifier.text,),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "End Date",
                                        hintText: "",
                                        labelText: "Choose a date",
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            showDatePickers();
                                          },
                                          icon: Icon(
                                              Icons.calendar_today_rounded,color: notifier.text,),
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
                                              titleText: "Regular Price",
                                              labelText: "Regular Price",
                                              hintText: "E.g. \$99",
                                            ),
                                            SizedBox(height: 15),
                                            MyTextFormField(
                                              titleText: "Publish Schedule",
                                              hintText: "",
                                              labelText: "Choose a date",
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  showDatePickers();
                                                },
                                                icon: Icon(Icons
                                                    .calendar_today_rounded,color: notifier.text,),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            MyTextFormField(
                                              titleText: "Product ID",
                                              labelText: "Product ID",
                                              hintText: "E.g. #1342-ABC",
                                            ),
                                            SizedBox(height: 15),
                                            MyTextFormField(
                                              titleText: "Available Date",
                                              hintText: "",
                                              labelText: "Choose a date",
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  showDatePickers();
                                                },
                                                icon: Icon(Icons
                                                    .calendar_today_rounded,color: notifier.text,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            MyTextFormField(
                                              titleText: "Sale Price",
                                              hintText: "E.g. \$29",
                                              labelText: "Sale Price",
                                            ),
                                            SizedBox(height: 15),
                                            MyTextFormField(
                                              titleText: "Product in Stock",
                                              hintText: "E.g. 17",
                                              labelText: "Product in Stock",
                                            ),
                                            SizedBox(height: 15),
                                            MyTextFormField(
                                              titleText: "Discout / Offer",
                                              hintText: "E.g. \$20",
                                              labelText: "Discout / Offer",
                                            ),
                                            SizedBox(height: 15),
                                            MyTextFormField(
                                              titleText: "End Date",
                                              hintText: "",
                                              labelText: "Choose a date",
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  showDatePickers();
                                                },
                                                icon: Icon(Icons
                                                    .calendar_today_rounded,color: notifier.text,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      FilePickerView(title: "Upload New Product Images"),
                      SizedBox(height: 15),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "Product Category & Tags",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: notifier.text,
                                ),
                              ),
                              SizedBox(height: 15),
                              width < 600
                                  ? Column(
                                      children: [
                                        MyDropdownFormField(
                                          titletext: "Category",
                                          hinttext: "Select",
                                          items: const [
                                            "Watch",
                                            "Mobile",
                                            "Laptop",
                                            "Headphone",
                                            "Shoe"
                                          ],
                                          onChanged: (value) {},
                                        ),
                                        SizedBox(height: 15),
                                        MyDropdownFormField(
                                          titletext: "Vendor",
                                          hinttext: "Select",
                                          items: const [
                                            "Dennis Matthews",
                                            "Susan Rader",
                                            "Douglas Harvey",
                                            "John Valdez",
                                            "Kathryn Turner",
                                          ],
                                          onChanged: (value) {},
                                        ),
                                        SizedBox(height: 15),
                                        MyDropdownFormField(
                                          titletext: "Collection",
                                          hinttext: "Select",
                                          items: const [
                                            "Collection 1",
                                            "Collection 2",
                                            "Collection 3",
                                            "Collection 4",
                                            "Collection 5",
                                          ],
                                          onChanged: (value) {},
                                        ),
                                        SizedBox(height: 15),
                                        MultipleselectDropdawonField(
                                          title: "Tags",
                                          tags: tags,
                                          checkbox: isActive,
                                        ),
                                      ],
                                    )
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              MyDropdownFormField(
                                                titletext: "Category",
                                                hinttext: "Select",
                                                items: const [
                                                  "Watch",
                                                  "Mobile",
                                                  "Laptop",
                                                  "Headphone",
                                                  "Shoe"
                                                ],
                                                onChanged: (value) {},
                                              ),
                                              SizedBox(height: 15),
                                              MyDropdownFormField(
                                                titletext: "Collection",
                                                hinttext: "Select",
                                                items: const [
                                                  "Collection 1",
                                                  "Collection 2",
                                                  "Collection 3",
                                                  "Collection 4",
                                                  "Collection 5",
                                                ],
                                                onChanged: (value) {},
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              MyDropdownFormField(
                                                titletext: "Vendor",
                                                hinttext: "Select",
                                                items: const [
                                                  "Dennis Matthews",
                                                  "Susan Rader",
                                                  "Douglas Harvey",
                                                  "John Valdez",
                                                  "Kathryn Turner",
                                                ],
                                                onChanged: (value) {},
                                              ),
                                              SizedBox(height: 15),
                                              MultipleselectDropdawonField(
                                                title: "Tags",
                                                tags: tags,
                                                checkbox: isActive,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                              SizedBox(height: 20),
                              Text(
                                "Other Option",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: notifier.text,
                                ),
                              ),
                              SizedBox(height: 15),
                              MyTextFormField(
                                titleText: "Title",
                                hintText: "E.g. Hand Watch",
                                labelText: "Title",
                              ),
                              SizedBox(height: 15),
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
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: notifier.getfillborder,
                                  ),
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    color: notifier.text,
                                  ),
                                  cursorColor: Color(0xFF0f79f3),
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.all(10),
                                    hintMaxLines: 10,
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
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: notifier.getfillborder,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
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
                                    text: widget.editProduct == true
                                        ? "Update Changes"
                                        : "Create Product",
                                    bgcolor: Color(0xFF0f79f3),
                                    onPressed: () {},
                                    height: 50,
                                    width: 160,
                                  ),
                                  widget.editProduct == true
                                      ? Container()
                                      : SizedBox(width: 10),
                                  widget.editProduct == true
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
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width < 1200 ? width / 1.6 : width / 2 + 40,
                        decoration: BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add a Product",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: "Outfit",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: notifier.text,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: const [
                                      MyTextFormField(
                                        titleText: "Product Title",
                                        labelText: "Product Title",
                                        hintText: "E.g. Hand Watch",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "SKU",
                                        hintText: "E.g. ABC-12345",
                                        labelText: "SKU",
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      MyDropdownFormField(
                                        titletext: "Brand Name",
                                        hinttext: "select",
                                        items: const [
                                          "Digital Product",
                                          "Physical Product"
                                        ],
                                        onChanged: (value) {
                                          productType = value;
                                        },
                                      ),
                                      SizedBox(height: 15),
                                      MyDropdownFormField(
                                        titletext: "Product Type",
                                        hinttext: "select",
                                        items: const [
                                          "Emburo",
                                          "Fediz",
                                          "Debilop",
                                          "Canin",
                                          "unity",
                                        ],
                                        onChanged: (value) {
                                          productType = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Product Description",
                              style: TextStyle(
                                fontFamily: "Outfit",
                                color: notifier.text,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 7),
                            Container(
                              height: 200,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: notifier.getBgColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color:notifier.getfillborder),
                              ),
                              child: Column(
                                children: [
                                  ToolBar(
                                    activeIconColor: Color(0xFF0f79f3),
                                    padding: const EdgeInsets.all(8),
                                    iconSize: 15,
                                    iconColor: notifier.text,
                                   toolBarColor: notifier.getBgColor,
                                    controller: quillEditorController,
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
                                    minHeight: 103,
                                    hintTextAlign: TextAlign.start,
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    hintTextPadding: EdgeInsets.zero,
                                    loadingBuilder: (context) {
                                      return const Center(
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      MyTextFormField(
                                        titleText: "Regular Price",
                                        labelText: "Regular Price",
                                        hintText: "E.g. \$99",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Publish Schedule",
                                        hintText: "",
                                        labelText: "Choose a date",
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            showDatePickers();
                                          },
                                          icon: Icon(
                                              Icons.calendar_today_rounded,color: notifier.text,),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Product ID",
                                        labelText: "Product ID",
                                        hintText: "E.g. #1342-ABC",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Available Date",
                                        hintText: "",
                                        labelText: "Choose a date",
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            showDatePickers();
                                          },
                                          icon: Icon(
                                              Icons.calendar_today_rounded,color: notifier.text,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    children: [
                                      MyTextFormField(
                                        titleText: "Sale Price",
                                        hintText: "E.g. \$29",
                                        labelText: "Sale Price",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Product in Stock",
                                        hintText: "E.g. 17",
                                        labelText: "Product in Stock",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "Discout / Offer",
                                        hintText: "E.g. \$20",
                                        labelText: "Discout / Offer",
                                      ),
                                      SizedBox(height: 15),
                                      MyTextFormField(
                                        titleText: "End Date",
                                        hintText: "",
                                        labelText: "Choose a date",
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            showDatePickers();
                                          },
                                          icon: Icon(
                                              Icons.calendar_today_rounded ,color: notifier.text,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            FilePickerView(title: "Upload New Product Images"),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                CustomButton(
                                  text: widget.editProduct == true
                                      ? "Update Changes"
                                      : "Create Product",
                                  bgcolor: Color(0xFF0f79f3),
                                  onPressed: () {},
                                  height: 50,
                                  width: 160,
                                ),
                                widget.editProduct == true
                                    ? Container()
                                    : SizedBox(width: 10),
                                widget.editProduct == true
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
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Category & Tags",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: notifier.text,
                                ),
                              ),
                              SizedBox(height: 20),
                              MyDropdownFormField(
                                titletext: "Category",
                                hinttext: "Select",
                                items: const [
                                  "Watch",
                                  "Mobile",
                                  "Laptop",
                                  "Headphone",
                                  "Shoe"
                                ],
                                onChanged: (value) {},
                              ),
                              SizedBox(height: 15),
                              MyDropdownFormField(
                                titletext: "Vendor",
                                hinttext: "Select",
                                items: const [
                                  "Dennis Matthews",
                                  "Susan Rader",
                                  "Douglas Harvey",
                                  "John Valdez",
                                  "Kathryn Turner",
                                ],
                                onChanged: (value) {},
                              ),
                              SizedBox(height: 15),
                              MyDropdownFormField(
                                titletext: "Collection",
                                hinttext: "Select",
                                items: const [
                                  "Collection 1",
                                  "Collection 2",
                                  "Collection 3",
                                  "Collection 4",
                                  "Collection 5",
                                ],
                                onChanged: (value) {},
                              ),
                              SizedBox(height: 15),
                              MultipleselectDropdawonField(
                                title: "Tags",
                                tags: tags,
                                checkbox: isActive,
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Other Option",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: "Outfit",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: notifier.text,
                                ),
                              ),
                              SizedBox(height: 15),
                              MyTextFormField(
                                titleText: "Title",
                                hintText: "E.g. Hand Watch",
                                labelText: "Title",
                              ),
                              SizedBox(height: 15),
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
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: notifier.getfillborder,
                                  ),
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    fontFamily: "Outfit",
                                    color: notifier.text,
                                  ),
                                  cursorColor: Color(0xFF0f79f3),
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.all(10),
                                    hintMaxLines: 10,
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
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: notifier.getfillborder,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Color(0xFF0f79f3),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

