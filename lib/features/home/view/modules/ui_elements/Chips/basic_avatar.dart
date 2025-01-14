
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class BasicAvatar extends StatefulWidget {
  const BasicAvatar({super.key});

  @override
  State<BasicAvatar> createState() => _BasicAvatarState();
}

class _BasicAvatarState extends State<BasicAvatar> {
  
  late ColorNotifier notifier;
  
  List images = [
    "assets/images/avatar-7 1.png",
    "assets/images/avatar-8 1.png",
    "assets/images/avatar-6 1.png",
  ];

  List name = ["Mateo Luca", "Alina Smith", "James Andy"];

  @override
  Widget build(BuildContext context) {
    
    notifier = Provider.of(context,listen: true);
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.all(15),
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic Avatar",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var i = 0; i < images.length; i++)
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: notifier.getfillborder,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        overlayColor: notifier.text,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      icon: ClipOval(
                        child: Image.asset(
                          images[i],
                          height: 20,
                        ),
                      ),
                      label: Text(
                        name[i],
                        style: TextStyle(color: notifier.text),
                      ),
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
