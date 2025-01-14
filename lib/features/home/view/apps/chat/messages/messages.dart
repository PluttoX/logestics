
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/Searchfield.dart';
import 'all_messages.dart';
import 'contacts.dart';
import 'group_chat.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              width < 900
                  ? Container()
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Messages",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "Outfit",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: notifier.text,
                  ),
                ),
              ),
              width < 900 ? Container() : SizedBox(height: height / 50),
              width < 900
                  ? Container()
                  : const Expanded(
                    child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Searchfield(),
                                  ),
                  ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DefaultTabController(
                    length: tabController.length,
                    child: TabBar(
                      isScrollable: false,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: const Color(0xff0165FC),
                      controller: tabController,
                      dividerColor: notifier.getfillborder,
                      labelColor: const Color(0xFF0165FC),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(
                        fontFamily: "Outfit",
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: const [
                        Tab(
                          child: Text("All Message",
                              overflow: TextOverflow.ellipsis),
                        ),
                        Tab(
                          child:
                          Text("Group Chat", overflow: TextOverflow.ellipsis),
                        ),
                        Tab(
                          child:
                          Text("Contacts", overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    AllMessages(),
                    GroupChat(),
                    ContactsView(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
