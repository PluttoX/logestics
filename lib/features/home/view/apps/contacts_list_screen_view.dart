
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Controllers/apps_controllers/contacts_list_controller.dart';
import '../../Controllers/controllers.dart';
import '../../theme/theme.dart';
import '../../widget/Searchfield.dart';
import '../../widget/next_page_button.dart';
import '../../widget/popupbutton.dart';

class ContactsListScreenView extends StatefulWidget {
  const ContactsListScreenView({super.key});

  @override
  State<ContactsListScreenView> createState() => _ContactsListScreenViewState();
}

class _ContactsListScreenViewState extends State<ContactsListScreenView> {
  late ColorNotifier notifier;

  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  ContactsListController contactsListController =
      Get.put(ContactsListController());

  bool isActive = false;

  bool button = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: width < 650 ? 55 : 40,
            width: width,
            child: width < 650
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contacts List",
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
                            "Apps",
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
                            "Contacts List",
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
                        "Contacts List",
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
                            "Apps",
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
                            "Contacts List",
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
            height: width < 550 ? 850 : 820,
            decoration: BoxDecoration(
              color: notifier.getBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width < 850 ? width / 1.4 : width / 4,
                          child: Searchfield(),
                        ),
                        Popupbutton(
                          title: "All",
                          items: const [
                            "All",
                            "Active",
                            "Deactive",
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: width < 750 ? height / 60 : height / 50),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: width < 1850 ? null : constraints.maxWidth,
                            child: Table(
                              border: TableBorder(
                                horizontalInside:
                                    BorderSide(color: notifier.getfillborder),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(60),
                                1: FixedColumnWidth(120),
                                2: FixedColumnWidth(220),
                                3: FixedColumnWidth(250),
                                4: FixedColumnWidth(200),
                                5: FixedColumnWidth(150),
                                6: FixedColumnWidth(180),
                                7: FixedColumnWidth(100),
                                8: FixedColumnWidth(100),
                                9: FixedColumnWidth(100),
                              },
                              children: [
                                TableRow(
                                  decoration:
                                      BoxDecoration(color: notifier.tablehader),
                                  children: [
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Transform.scale(
                                          scale: 1.2,
                                          child: Checkbox(
                                            overlayColor:
                                                WidgetStateProperty.all<Color>(
                                              Colors.transparent,
                                            ),
                                            activeColor:
                                                const Color(0xff0f79f3),
                                            side: BorderSide(
                                              width: 2,
                                              color: notifier.chakboxborder,
                                            ),
                                            value: isActive,
                                            onChanged: (val) {
                                              setState(() {
                                                isActive = val!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Contact ID",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Customer",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Phone",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Last Contacted",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Company",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Lead Score",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Status",
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Action",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Outfit",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: notifier.text,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                for (var a = contactsListController.loadmore;
                                    a <
                                        contactsListController.loadmore +
                                            contactsListController.selectindex;
                                    a++)
                                  TableRow(
                                    children: [
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: StatefulBuilder(
                                            builder: (BuildContext context,
                                                setState) {
                                              return Transform.scale(
                                                scale: 1.2,
                                                child: Checkbox(
                                                  overlayColor:
                                                      WidgetStateProperty.all<
                                                          Color>(
                                                    Colors.transparent,
                                                  ),
                                                  activeColor:
                                                      const Color(0xff0f79f3),
                                                  side: BorderSide(
                                                    width: 2,
                                                    color:
                                                        notifier.chakboxborder,
                                                  ),
                                                  value: isActive,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      isActive = val!;
                                                    });
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "#${contactsListController.contactID[a]}",
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            leading: ClipOval(
                                              child: Image.asset(
                                                contactsListController
                                                    .customerImage[a],
                                                height: height / 20,
                                              ),
                                            ),
                                            title: Text(
                                              contactsListController
                                                  .customerName[a],
                                              style: TextStyle(
                                                fontFamily: "Outfit",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: notifier.text,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "${contactsListController.email[a]}",
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            contactsListController.phone[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            contactsListController
                                                .lastContacted[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            contactsListController.company[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            contactsListController.leadScore[a],
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              fontFamily: "Outfit",
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            padding: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: contactsListController
                                                          .statustext[a] ==
                                                      "Active"
                                                  ? notifier.ligreenColor
                                                  : notifier.liredColor,
                                            ),
                                            child: Center(
                                              child: Text(
                                                contactsListController
                                                    .statustext[a],
                                                style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontFamily: "Outfit",
                                                  fontSize: 15,
                                                  color: contactsListController
                                                              .statustext[a] ==
                                                          "Active"
                                                      ? Color(0xff3dd7a1)
                                                      : Color(0xFFe74e3e),
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment:
                                            TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                "assets/images/pen.png",
                                                height: 20,
                                                color: Color(0xFF2a8ef6),
                                              ),
                                              Image.asset(
                                                "assets/images/trash.png",
                                                height: 20,
                                                color: notifier.text,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    NextPageButton(
                      number1: "10",
                      number2: "20",
                      number3: "30",
                      numberofpages: "1 - 10 0f 20",
                      backbutton: () {
                        if (button == true) {
                          setState(() {
                            button = !button;
                            contactsListController.contactID.shuffle();
                            contactsListController.customerImage.shuffle();
                            contactsListController.customerName.shuffle();
                            contactsListController.email.shuffle();
                            contactsListController.phone.shuffle();
                            contactsListController.lastContacted.shuffle();
                            contactsListController.company.shuffle();
                            contactsListController.leadScore.shuffle();
                            contactsListController.statustext.shuffle();
                          });
                          contactsListController
                              .setloadmore(contactsListController.selectpage);
                        }
                      },
                      nextbutton: () {
                        if (button == false) {
                          setState(() {
                            button = !button;
                            contactsListController.contactID.shuffle();
                            contactsListController.customerImage.shuffle();
                            contactsListController.customerName.shuffle();
                            contactsListController.email.shuffle();
                            contactsListController.phone.shuffle();
                            contactsListController.lastContacted.shuffle();
                            contactsListController.company.shuffle();
                            contactsListController.leadScore.shuffle();
                            contactsListController.statustext.shuffle();
                          });
                          contactsListController
                              .setloadmore(contactsListController.selectpage);
                        }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
