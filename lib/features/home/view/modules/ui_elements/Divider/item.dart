
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late ColorNotifier notifier;

    List item = ["Item 1", "Item 2", "Item 3"];
    notifier = Provider.of(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < item.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item[i],
                      style: TextStyle(
                        color: notifier.text,
                        fontSize: 16,
                      ),
                    ),
                    i == 2
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
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
