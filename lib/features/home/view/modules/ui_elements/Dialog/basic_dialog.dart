
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';
import '../../../../widget/my_text_field.dart';

class BasicDialog extends StatefulWidget {
  const BasicDialog({super.key});

  @override
  State<BasicDialog> createState() => _BasicDialogState();
}

class _BasicDialogState extends State<BasicDialog> {
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
                "Basic Dialog",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              CustomButton(
                text: "Pick Me!",
                bgcolor: Color(0xFF0f79f3),
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
                        title: Text("Hi Mateo Luca"),
                        titleTextStyle: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 25,
                          color: notifier.text,
                        ),
                        content: SizedBox(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "What's your favorite animal?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 15),
                              MyTextFormField(
                                labelText: "Favotite Animal",
                                hintText: "",
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          CustomButton(
                            text: "No Thanks",
                            bgcolor: Color(0xFFe74c3c),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            width: 150,
                          ),
                          CustomButton(
                            text: "Ok",
                            bgcolor: Color(0xFF0f79f3),
                            width: 100,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                width: 150,
                fonatweidth: FontWeight.w600,
              ),
            ],
          ),
        );
      },
    );
  }
}
