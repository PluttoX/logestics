
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class Heading extends StatefulWidget {
  const Heading({super.key});

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  
  late ColorNotifier notifier;
  
  List headings = [
    "Heading One",
    "Heading Two",
    "Heading Three",
    "Heading Four",
    "Heading Five",
    "Heading Six",
  ];
  List<double> headingSize = [35, 30, 25, 22, 18, 14];
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
              for (var i = 0; i < headings.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headings[i],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: notifier.text,
                        fontSize: headingSize[i],
                      ),
                    ),
                    i == 5
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Divider(color: notifier.getfillborder),
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
