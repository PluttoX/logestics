import 'package:flutter/material.dart';

class KanbanToCompleted extends StatefulWidget {
  const KanbanToCompleted({super.key});

  @override
  State<KanbanToCompleted> createState() => _KanbanToCompletedState();
}

class _KanbanToCompletedState extends State<KanbanToCompleted> {
  bool toCompletedHover = false;

  List toCompletedTitles = [
    "App project update",
    "E-commerce site",
    "LMS & education site design",
    "Creative portfolio design",
    "Vaxo admin dashboard",
  ];

  List toCompletedStatuse = [
    "App",
    "Site",
    "Education",
    "Protfolio",
    "Admin",
  ];

  List toCompletedDate = [
    "Created 25 Nov",
    "Created 24 Nov",
    "Created 23 Nov",
    "Created 22 Nov",
    "Created 21 Nov",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFF6356e2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: ListTile(
              title: Text(
                "To Completed (05)",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  letterSpacing: 1,
                  fontFamily: "Outfit",
                  fontSize: height / 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "This month completed 05 projects",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Outfit",
                  fontSize: height / 55,
                  color: Colors.white,
                ),
              ),
              trailing: PopupMenuButton(
                tooltip: '',
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.zero,
                elevation: 1,
                splashRadius: 1,
                shadowColor: Colors.grey,
                constraints: BoxConstraints(
                  maxWidth: 150,
                  minWidth: 150,
                ),
                child: SizedBox(
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(
                      "Select All",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF475569),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      "Edit All",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Outfit",
                        color: Color(0xFF475569),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      "Delete All",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "Outfit",
                        color: Color(0xFF475569),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        ListView.separated(
          itemCount: toCompletedTitles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        toCompletedTitles[index],
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Done",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 14,
                          color: Color(0xFF32d581),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      "This column represents tasks that have been identified but are not yet scheduled for work.",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFf4f6fc),
                    ),
                    child: Text(
                      toCompletedStatuse[index],
                      style: TextStyle(
                        fontFamily: "Outfit",
                        color: Color(0xFF32d581),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF4bdcf3),
                      ),
                      SizedBox(width: 4),
                      Text(
                        toCompletedDate[index],
                        style: TextStyle(
                          fontFamily: "Outfit",
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 70,
                        child: Stack(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/user2.jpg"),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/user10.jpg"),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 40,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/user5.jpg"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 20);
          },
        ),
        SizedBox(height: 20),
        InkWell(
          onTap: () {},
          onHover: (value) {
            setState(() {
              toCompletedHover = !toCompletedHover;
            });
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: toCompletedHover ? const Color(0xFFeff3f9) : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "+ Add Another Task",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height / 45,
                  fontFamily: "Outfit",
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
