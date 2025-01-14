
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';
import '../../../../../widget/custom_button.dart';

class CardMultipleSections extends StatefulWidget {
  const CardMultipleSections({super.key});

  @override
  State<CardMultipleSections> createState() => _CardMultipleSectionsState();
}

class _CardMultipleSectionsState extends State<CardMultipleSections> {

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {

    notifier = Provider.of(context,listen: true);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: notifier.getBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 6),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: ClipOval(
              child: Image.asset(
                "assets/images/avatar-1-51c6502a 1.png"
              ),
            ),
            title: Text("Card with multiple sections"),
            titleTextStyle: TextStyle(
              fontFamily: "Outfit",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: notifier.text,
            ),
            subtitle: Text("Dog Breed"),
            subtitleTextStyle: TextStyle(
              fontFamily: "Outfit",
              fontSize: 17,
              color: notifier.greytext,
              fontWeight: FontWeight.w600,
            ),
          ),
          Image.network("https://cdn.pixabay.com/photo/2022/08/16/04/52/jewel-7389356_640.jpg"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "The Mateo Luca is the smallest of the six original and distinct spitz breeds of dog from Japan. A small, agile dog that copes very well with mountainous terrain, the Shiba Inu was originally bred for.",
              style: TextStyle(
                fontFamily: "Outfit",
                fontSize: 16,
                height: 2,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                CustomButton(
                  text: "LIKE",
                  onPressed: () {},
                  bgcolor: Color(0xFF0f79f3),
                ),
                SizedBox(width: 10),
                CustomButton(
                  text: "SHARE",
                  onPressed: () {},
                  bgcolor: Color(0xFFe74c3c),
                  fonatweidth: FontWeight.normal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
