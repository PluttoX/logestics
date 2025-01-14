
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';
import '../../../../../widget/popupbutton.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    late ColorNotifier notifier;

    List title = ["Email", "Contact No", "Location", "Wallet Balance", "Store"];

    List data = [
      "hello@unity.com",
      "+(800) 555-0199",
      "United States",
      "\$9,999.50",
      "TechMaster Store",
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: constraints.maxWidth,
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: notifier.lightbgcolor,
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/seller1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      width: width < 1360 ? constraints.maxWidth / 3 : null,
                      child: Text(
                        "Milton Jones",
                        style: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: notifier.text,
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Popupbutton(
                          items: [
                            "View",
                            "Edit",
                            "Delete",
                          ],
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                itemCount: title.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return RichText(
                    maxLines: 2,
                    text: TextSpan(
                      text: "${title[index]} : ",
                      style: TextStyle(
                        fontFamily: "Outfit",
                        fontSize: 17,
                        color: Color(0xFF949ba3),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: data[index],
                          style: TextStyle(
                            fontSize: 17,
                            color: notifier.text,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
              SizedBox(height: 30),
              Text(
                "Contact Support",
                style: TextStyle(
                  fontFamily: "Outfit",
                  color: notifier.text,
                  fontWeight: FontWeight.w600,
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
                    labelText: "Enter your message here....",
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
                    floatingLabelStyle: TextStyle(
                      color: Color(0xff0165FC),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Color(0xFF0f79f3),
                  minimumSize: Size(160, 50),
                ),
                child: Text(
                  "Send Message",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Outfit",
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
