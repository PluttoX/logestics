
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';

class DialogAnimations extends StatefulWidget {
  const DialogAnimations({super.key});

  @override
  State<DialogAnimations> createState() => _DialogAnimationsState();
}

class _DialogAnimationsState extends State<DialogAnimations> {
  
  late ColorNotifier notifier;
  
  @override
  Widget build(BuildContext context) {
   
    notifier = Provider.of(context,listen: true);
   
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
                "Dialog Animations",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  CustomButton(
                    text: "Open dialog without animation",
                    onPressed: () {
                      showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: notifier.getBgColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text("Delete file"),
                            titleTextStyle: TextStyle(
                              fontFamily: "Outfit",
                              fontSize: 25,
                              color: notifier.text,
                            ),
                            content: Text(
                              "Would you like to delete \ncat.jpeg?",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            actions: [
                              CustomButton(
                                text: "No ",
                                bgcolor: Color(0xFFe74c3c),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CustomButton(
                                text: "Ok",
                                bgcolor: Color(0xFF0f79f3),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                    bgcolor: Color(0xFF0f79f3),
                  ),
                  // SizedBox(width: 20),
                  CustomButton(
                    text: "Open dialog slowly",
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        transitionDuration: const Duration(seconds: 2),
                        barrierDismissible: false,
                        transitionBuilder: (context, a1, a2, widget) {
                          return StatefulBuilder(builder: (context, setState) {
                            return ScaleTransition(
                                scale: Tween<double>(begin: 0.5, end: 1.0)
                                    .animate(a1),
                                child: Transform.scale(
                                  scale: a1.value,
                                  child: AlertDialog(
                                    backgroundColor: notifier.getBgColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    title: Text("Delete file"),
                                    titleTextStyle: TextStyle(
                                      fontFamily: "Outfit",
                                      fontSize: 25,
                                      color: notifier.text,
                                    ),
                                    content: Text(
                                      "Would you like to delete \ncat.jpeg?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    actions: [
                                      CustomButton(
                                        text: "No",
                                        bgcolor: Color(0xFFe74c3c),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                      CustomButton(
                                        text: "Ok",
                                        bgcolor: Color(0xFF0f79f3),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                ));
                          });
                        },
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return Container();
                        },
                      );
                    },
                    bgcolor: Color(0xFF796df6),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
