
import 'package:flutter/material.dart';
import 'package:logestics/features/home/view/appbar/profilepopup.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';
import '../../widget/Searchfield.dart';
import '../apps/chat/messages/messages.dart';
import 'language.dart';
import 'notification.dart';

class AppBarView extends StatefulWidget {
  const AppBarView({super.key});

  @override
  State<AppBarView> createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    if (width < 800) {
      return PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: Column(
          children: [
            AppBar(
              iconTheme: IconThemeData(color: notifier.text),
              titleSpacing: 0,
              scrolledUnderElevation: 0,
              excludeHeaderSemantics: false,
              backgroundColor: notifier.getBgColor,
              title: Container(
                width: width,
                height: 45,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Searchfield(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: notifier.getBgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Language(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          notifier.setIsDark = !notifier.getIsDark;
                        });
                      },
                      child: Image.asset(
                        height: 30,
                        notifier.isDark
                            ? "assets/images/sun.png"
                            : "assets/images/moon.png",
                        color: notifier.text,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/calendar-empty-alt.png",
                      color: notifier.text,
                    ),
                  ),
                  //Messages(),
                  const NotificationView(),
                  const Profilepopup(),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: notifier.getBgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: notifier.getBgColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width / 4,
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Searchfield(),
            ),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  const Language(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          notifier.setIsDark = !notifier.getIsDark;
                        });
                      },
                      child: Image.asset(
                        height: 30,
                        notifier.isDark
                            ? "assets/images/sun.png"
                            : "assets/images/moon.png",
                        color: notifier.text,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/calendar-empty-alt.png",
                      color: notifier.text,
                    ),
                  ),
                 // Messages(),
                  const NotificationView(),
                  const Profilepopup(),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
