
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/theme.dart';
import '../../../../../widget/custom_button.dart';

class CardWithFooter extends StatefulWidget {
  const CardWithFooter({super.key});

  @override
  State<CardWithFooter> createState() => _CardWithFooterState();
}

class _CardWithFooterState extends State<CardWithFooter> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: constraints.maxWidth,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Card with footer",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: notifier.greytext,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Mateo Luca",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: notifier.text,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This card has divider and indeterminate progress as footer",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      height: 2,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "The Mateo Luca is the smallest of the six original and distinct spitz breeds of dog from Japan. A small, agile dog that copes very well with mountainous terrain, the Shiba Inu was originally bred for.",
                    style: TextStyle(
                      fontFamily: "Outfit",
                      fontSize: 16,
                      height: 2,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(color: notifier.getfillborder),
                  ),
                  Row(
                    children: [
                      CustomButton(
                        text: "LIKE",
                        onPressed: () {},
                        bgcolor:
                            notifier.isDark ? Colors.black : Color(0xFF475569),
                      ),
                      SizedBox(width: 10),
                      CustomButton(
                        text: "SHARE",
                        onPressed: () {},
                        bgcolor:
                            notifier.isDark ? Colors.black : Color(0xFF475569),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              backgroundColor: notifier.lightbgcolor,
              valueColor: AlwaysStoppedAnimation(Color(0xFF0f79f3)),
              minHeight: 5,
            ),
          ],
        );
      },
    );
  }
}
