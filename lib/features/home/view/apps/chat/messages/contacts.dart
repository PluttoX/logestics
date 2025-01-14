
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/stringfile.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> {
  late ColorNotifier notifier;

  List profileImage = [
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/download 1.png",
    "assets/images/avatar-7 1.png",
    "assets/images/artist.png",
    "assets/images/avatar-1-51c6502a 1.png",
    "assets/images/avatar-6 1.png",
    "assets/images/avatar-7 1.png",
  ];

  List name = [
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
    AllString.user5,
    AllString.user6,
    AllString.user1,
    AllString.user2,
    AllString.user3,
    AllString.user4,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return ListView.separated(
      itemCount: profileImage.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: width < 900 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(child: Image.asset(profileImage[index])),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Colors.green
                          : index % 2 == 0
                              ? Colors.red
                              : Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title: Text(
              name[index],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 18,
                color: notifier.text,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          child: Divider(color: notifier.getfillborder),
        );
      },
    );
  }
}
