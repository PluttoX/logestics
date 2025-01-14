import 'package:flutter/material.dart';

class ColorNotifier with ChangeNotifier {
  bool isDark = false;

  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  get getIsDark => isDark;

  get mainBgColor => isDark ? const Color(0xFF131920) : const Color(0xFFeff3f9);

  get getBgColor => isDark ? const Color(0xff1B232D) : const Color(0xffFFFFFF);

  get text => isDark ? const Color(0xffFFFFFF) : const Color(0xFF475569);

  get greytext => isDark ? Colors.grey : Colors.black;

  //textDark -- const Color(0xff202020);

  get textFileColor => isDark ? const Color(0xFF2B333C) : const Color(0xFFF4F6FC);

  get getHoverColor => isDark ? const Color(0xFF2C343E) : const Color(0xffE7EFFC);

  get tablehader => isDark ? Color(0xFF131920) : Color(0xFFE7EFFC);

  get getfillborder => isDark
      ? const Color(0xff414141)
      : Color(0xFFe1e1e1); // Colors.grey.shade300;

  get lightbgcolor => isDark ? const Color(0xFF293543) : Color(0xFFF5F5F5);

  get chakboxborder => isDark ? Color(0xFF4D5358) : Color(0xFF838D9D);

  //   bckground light color
  get ligreenColor => isDark ? Color(0xFF1B3536) : Color(0xFFE7FBF2);

  get liredColor => isDark ? Color(0xFF2F272F) : Color(0xFFFCEDEB);

  get liyellowColor => isDark ? Color(0xFF30312E) : Color(0xFFFDF7EA);

  get liblueColor => isDark ? Color(0xFF1A2C42) : Color(0xFFE6F1FD);

  get lipurpleColor => isDark ? Color(0xFF474970) : Color(0xFFF0EFFF);

  get litealAccentColor => isDark ? Color(0xFF2A5C69) : Color(0xFFDFF9FC);
}
