
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';

class DialogLaunchedFromAMenu extends StatefulWidget {
  const DialogLaunchedFromAMenu({super.key});

  @override
  State<DialogLaunchedFromAMenu> createState() =>
      _DialogLaunchedFromAMenuState();
}

class _DialogLaunchedFromAMenuState extends State<DialogLaunchedFromAMenu> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dialog Launched From a Menu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              PopupMenuButton(
                offset: Offset(10, 45),
                color: notifier.getBgColor,
                tooltip: "",
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: InkWell(
                      onTap: () {
                        _showDialogbox();
                      },
                      child: Text(
                        "Open dialog",
                        style: TextStyle(color: notifier.text),
                      ),
                    ),
                  ),
                ],
                child: Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFe74c3c),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      "Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _showDialogbox() {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: notifier.getBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text("This is a dialog"),
          titleTextStyle: TextStyle(
            fontFamily: "Outfit",
            fontSize: 16,
            color: Colors.grey,
          ),
          content: Divider(color: notifier.getfillborder),
          actions: [
            CustomButton(
              text: "Okay",
              bgcolor: Color(0xFF0f79f3).withOpacity(0.1),
              width: 100,
              textcolor: notifier.text,
              hovercolor: Color(0xFF0f79f3),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
