
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

class CreateandEditCategory extends StatefulWidget {
  const CreateandEditCategory({super.key, this.editCategory});

  final bool? editCategory;

  @override
  State<CreateandEditCategory> createState() => _CreateandEditCategoryState();
}

class _CreateandEditCategoryState extends State<CreateandEditCategory> {
  late ColorNotifier notifier;

  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  final QuillEditorController quillEditorController = QuillEditorController();

  @override
  Widget build(BuildContext context) {
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
                      widget.editCategory == true
                          ? "Edit Category"
                          : "Create Category",
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
                          "Categories",
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
                      widget.editCategory == true
                          ? "Edit Category"
                          : "Create Category",
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
                      widget.editCategory == true
                          ? "Edit Category"
                          : "Create Category",
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
                          "Categories",
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
                          widget.editCategory == true
                              ? "Edit Category"
                              : "Create Category",
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
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.editCategory == true
                      ? "Edit Category"
                      : "Add New Category",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: notifier.text,
                  ),
                ),
                SizedBox(height: 20),
                width < 650
                    ? Column(
                        children: [
                          MyTextFormField(
                            titleText: "Category Name",
                            labelText: "Category Name",
                            hintText: "E.g. Electronics",
                          ),
                          SizedBox(height: 20),
                          MyTextFormField(
                            titleText: "Slug",
                            labelText: "Slug",
                            hintText: "E.g. Electronics",
                          ),
                          SizedBox(height: 20),
                          MyDropdownFormField(
                            titletext: "Parent Category",
                            hinttext: "Select",
                            items: const [
                              "Emburo",
                              "Fediz",
                              "Debilop",
                              "Canin",
                              "unity",
                            ],
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 20),
                          MyDropdownFormField(
                            titletext: "Display Type",
                            hinttext: "Display Type",
                            items: const [
                              "Digital Category",
                              "Physical Category",
                            ],
                            onChanged: (value) {},
                          ),
                          SizedBox(height: 20),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                MyTextFormField(
                                  titleText: "Category Name",
                                  labelText: "Category Name",
                                  hintText: "E.g. Electronics",
                                ),
                                SizedBox(height: 20),
                                MyDropdownFormField(
                                  titletext: "Parent Category",
                                  hinttext: "Select",
                                  items: const [
                                    "Emburo",
                                    "Fediz",
                                    "Debilop",
                                    "Canin",
                                    "unity",
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
                                MyTextFormField(
                                  titleText: "Slug",
                                  labelText: "Slug",
                                  hintText: "E.g. Electronics",
                                ),
                                SizedBox(height: 20),
                                MyDropdownFormField(
                                  titletext: "Display Type",
                                  hinttext: "Display Type",
                                  items: const [
                                    "Digital Category",
                                    "Physical Category",
                                  ],
                                  onChanged: (value) {},
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
                FilePickerView(title: "Upload New Category Image"),
                SizedBox(height: 20),
                Row(
                  children: [
                    CustomButton(
                      onPressed: () {},
                      text: widget.editCategory == true
                          ? "Edit Category"
                          : "Create Category",
                      bgcolor: Color(0xFF0f79f3),
                      height: 50,
                      width: 160,
                    ),
                    SizedBox(width: 10),
                    CustomButton(
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
    );
  }
}
