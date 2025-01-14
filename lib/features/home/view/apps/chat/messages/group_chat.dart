
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class GroupChat extends StatefulWidget {
  const GroupChat({super.key});

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  late ColorNotifier notifier;

  List image = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRYxYmApuq7uZT3CslC5GVGKX9QJ7OBoA4uLJLm7NmD-m1ta1J3L4fElpn3V_1t7U3sbI&usqp=CAU",
    "https://assets.entrepreneur.com/content/3x2/2000/1648742653-Ent-PythonProgramming.jpeg",
    "https://media.licdn.com/dms/image/v2/D4D12AQHYC_ZczxV2zw/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1695524296879?e=2147483647&v=beta&t=rLMZ59ByIABpdPtfPZPZC65iXWG4zbht2eqKfWOdxRs",
  ];

  List titleText = [
    "UI/UX Designer Group",
    "Web Development Group",
    "Discussion Group",
  ];

  List subText = [
    "Divan: Sure I'll submit the file...",
    "Divan:",
    "Divan: Great ! 🔥",
  ];

  List trailingText = [
    "Just Now",
    "Sun 9:10 PM",
    "Mon 2:12 PM",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics:
              width < 900 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: width < 750
                      ? constraints.maxHeight / 15
                      : constraints.maxHeight / 12,
                  width: constraints.maxWidth,
                  color: Color(0xFF0f79f3),
                  child: Center(
                    child: Text(
                      "+ Create New Group",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Outfit",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                itemCount: image.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: width < 900
                    ? NeverScrollableScrollPhysics()
                    : ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      leading: ClipOval(
                        child: Image.network(
                          image[index],
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        titleText[index],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          color: notifier.text,
                        ),
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          text: subText[index],
                          style: TextStyle(
                            fontFamily: "Outfit",
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: index == 1 ? ' Typing...' : "",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Text(
                        trailingText[index],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: notifier.getfillborder);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
