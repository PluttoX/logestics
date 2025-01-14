
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Controllers/controllers.dart';
import '../theme/theme.dart';
import '../view/dashbord/e_commerece/e_commerce.dart';
import 'drawer_item.dart';
import 'drawer_item_expentiontile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late ColorNotifier notifier;

  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  bool dashboardsTitleHover = false;
  bool emailTitleHover = false;
  bool filemanagerTitleHover = false;
  bool ecommerceTitleHover = false;
  bool uiElementTitleHover = false;
  bool crmTitleHover = false;
  bool projectmanagementTitleHover = false;
  bool lmsTitleHover = false;
  bool helpdeskTitleHover = false;
  bool eventsTitleHover = false;
  bool socialTitleHover = false;
  bool invoicesTitleHover = false;
  bool usersTitleHover = false;
  bool profileTitleHover = false;
  bool iconsTitleHover = false;
  bool tablesTitleHover = false;
  bool formsTitleHover = false;
  bool chartsTitleHover = false;
  bool authenticationTitleHover = false;
  bool extraPagesTitleHover = false;
  bool errorsTitleHover = false;
  bool settingsTitleHover = false;
  bool multilevelmenuTitleHover = false;

  late List<bool> dashboardHoverColor;
  late List<bool> appsHoverColor;
  late List<bool> emailHoverColor;
  late List<bool> filemanagerHoverColor;
  late List<bool> ecommerceHoverColor;
  late List<bool> uiElementHoverColor;

  @override
  void initState() {
    super.initState();
    dashboardHoverColor = List.filled(dashboard.length, false);
    appsHoverColor = List.filled(apps.length, false);
    emailHoverColor = List.filled(email.length, false);
    filemanagerHoverColor = List.filled(filemanager.length, false);
    ecommerceHoverColor = List.filled(ecommerce.length, false);
    uiElementHoverColor = List.filled(uiElement.length, false);
  }

  List dashboard = [
    "Admin",
    // "CRM",
    // "Project Management",
    // "LMS",
    // "Help Desk",
  ];
  //List dashboardContIndex = [0, 1, 2, 3, 4];
  List dashboardContIndex = [0];
  List apps = [
    "assets/images/note-list-square.png",
    "assets/images/calendar-empty-alt.png",
    "assets/images/user-square.png",
    "assets/images/message-text.png",
   // "assets/images/command.png",
  ];
  List appstext = [
    "Invoices",
    "Calendar",
    "Contacts",
    "Chat",
    //"Kanban Board",
  ];
  /*List appsContIndex = [5, 6, 7, 8, 9];*/
  List appsContIndex = [5, 6, 7, 8, ];
  List email = ["Inbox", "Compose", "Read"];
  List emailContIndex = [10, 11, 12];

  List filemanager = [
    "My Drive",
    "Assets",
    "Projects",
    "Personal",
    "Applications",
    "Documents",
    "Media",
  ];
  List filemanagerContIndex = [13, 14, 15, 16, 17, 18, 19];

  List ecommerce = [
    "Products Grid",
    "Products List",
    "Product Details",
    "Create Product",
    "Edit Product",
    "Cart",
    "Checkout",
    "Orders",
    "Order Details",
    "Create order",
    "Order Tracking",
    "Customer",
    "Customer Details",
    "Categories",
    "Create Category",
    "Edit Category",
    "Sellers",
    "Seller Details",
    "Create Seller",
    "Reviews",
    "Refunds",
  ];
  List ecommerceContInext = [
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40
  ];

  List crm = [
    "Contacts",
    "Customers",
    "Leads",
    "Deals",
  ];

  List projectmanagement = [
    "Project Overview",
    "Projects List",
    "Create Project",
    "Clients",
    "Teams",
    "Kanban Board",
    "Users",
  ];

  List lms = [
    "Courses List",
    "Course Details",
    "Create Course",
    "Edit Course",
    "Instructors"
  ];

  List helpdesk = [
    "Tickets",
    "Ticket Details",
    "Agents",
    "Reports",
  ];

  List events = [
    "Events",
    "Event Details",
    "Create An Event",
    "Edit An Event",
  ];

  List social = [
    "Profile",
    "Settings",
  ];

  List invoices = [
    "Invoices",
    "Invoice Details",
  ];

  List users = [
    "Team Members",
    "Users List",
    "Add User",
    "Projects",
  ];

  List profile = [
    "User Profile",
    "Teams",
    "Projects",
  ];

  List icons = ["Material Symbols", "RemixIcon"];

  List uiElement = [
    "Alerts",
    "Autocomplete",
    "Avatars",
    "Accordion",
    "Badges",
    "Breadcrumb",
    "Button Toggle",
    "Bottom Sheet",
    "Buttons",
    "Cards",
    "Carousels",
    "Checkbox",
    "Chips",
    "Clipboard",
    "Color Picker",
    "Datepicker",
    "Dialog",
    "Divider",
    "Drag & Drop",
  ];
  List uiElementsContIndex = [
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    // 60,
    // 61,
    // 62,
    // 63,
    // 64,
    // 65,
    // 66,
    // 67,
    // 68,
    // 69,
    // 70,
    // 71,
    // 72,
    // 73,
    // 74,
    // 75,
    // 76,
    // 77,
    // 78,
    // 79,
    // 80,
    // 81,
    // 82,
    // 83,
    // 84,
    // 85,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return StatefulBuilder(builder: (context, setState) {
          return GetBuilder<MainDrawerController>(
            builder: (mainDrawerController) {
              return Drawer(
                width: width / 6,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: notifier.getBgColor,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            hoverColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                if (width < 1200) {
                                  mainDrawerController.updateSelectedIndex(0);
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    scrollController.jumpTo(0.0);
                                  });
                                  Navigator.pop(context);
                                } else {
                                  mainDrawerController.updateSelectedIndex(0);
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    scrollController.jumpTo(0.0);
                                  });
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/Group 2.svg",
                                  height: 35,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "logistics",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: height / 30,
                                    color: notifier.text,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "- MAIN",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),

                          DrawerItemExpentiontile(
                            title: "Dashboard",
                            images: "assets/images/grid-web.png",
                            text: dashboard,
                            controllerIndexlist: dashboardContIndex,
                            startIndex: 0,
                            endIndex: 0,
                            titleHover: dashboardsTitleHover,
                            hoverColor: dashboardHoverColor,
                          ),

                          //system
                          const Text(
                            "- System",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              // fontFamily: "Outfit",
                              fontSize: 15,
                            ),
                          ),

                          DrawerItem(
                            imageList: apps,
                            titleList: appstext,
                            controllerIndexlist: appsContIndex,
                            hoverColor: appsHoverColor,
                            startIndex: 5,
                          ),

                          // //  apps
                          // const Text(
                          //   "- APPS",
                          //   overflow: TextOverflow.ellipsis,
                          //   style: TextStyle(
                          //     color: Colors.grey,
                          //     // fontFamily: "Outfit",
                          //     fontSize: 15,
                          //   ),
                          // ),
                          //
                          // DrawerItem(
                          //   imageList: apps,
                          //   titleList: appstext,
                          //   controllerIndexlist: appsContIndex,
                          //   hoverColor: appsHoverColor,
                          //   startIndex: 5,
                          // ),
/*
                          DrawerItemExpentiontile(
                            title: "Email",
                            images: "assets/images/envelope.png",
                            text: email,
                            controllerIndexlist: emailContIndex,
                            startIndex: 10,
                            endIndex: 12,
                            titleHover: emailTitleHover,
                            hoverColor: emailHoverColor,
                          ),*/

                         /* DrawerItemExpentiontile(
                            title: "File Manager",
                            images: "assets/images/file.png",
                            text: filemanager,
                            controllerIndexlist: filemanagerContIndex,
                            startIndex: 13,
                            endIndex: 19,
                            titleHover: filemanagerTitleHover,
                            hoverColor: filemanagerHoverColor,
                          ),*/

                        /*  // pages
                          const Text(
                            "- PAGES",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              // fontFamily: "Outfit",
                              fontSize: 15,
                            ),
                          ),*/

                          /*DrawerItemExpentiontile(
                            title: "E-Commerce",
                            images: "assets/images/shopping-cart.svg",
                            text: ecommerce,
                            controllerIndexlist: ecommerceContInext,
                            startIndex: 20,
                            endIndex: 40,
                            titleHover: ecommerceTitleHover,
                            hoverColor: ecommerceHoverColor,
                            showSvg: true,
                          ),*/
/*
                          const Text(
                            "- MODULES",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              // fontFamily: "Outfit",
                              fontSize: 15,
                            ),
                          ),*/

                         /* DrawerItemExpentiontile(
                            title: "UI Elements",
                            images: "assets/images/scan-qr.png",
                            text: uiElement,
                            controllerIndexlist: uiElementsContIndex,
                            startIndex: 41,
                            endIndex: 85,
                            titleHover: uiElementTitleHover,
                            hoverColor: uiElementHoverColor,
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}
