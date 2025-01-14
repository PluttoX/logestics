
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class CustomPlaceholder extends StatefulWidget {
  const CustomPlaceholder({super.key});

  @override
  State<CustomPlaceholder> createState() => _CustomPlaceholderState();
}

class _CustomPlaceholderState extends State<CustomPlaceholder> {
  late ColorNotifier notifier;

  final List<String> episodes = [
    'Episode I - The Phantom Menace',
    'Episode II - Attack of the Clones',
    'Episode III - Revenge of the Sith',
    'Episode IV - A New Hope',
    'Episode V - The Empire Strikes Back',
    'Episode VI - Return of the Jedi',
    'Episode VII - The Force Awakens',
    'Episode VIII - The Last Jedi',
    'Episode IX - The Rise of Skywalker',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

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
                "Drag & Drop Custom Placeholder",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 400,
                width: width / 3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: notifier.getfillborder,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ReorderableListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    for (final episode in episodes)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 11.6,
                        ),
                        key: ValueKey(episode),
                        decoration: BoxDecoration(
                          color: notifier.getBgColor,
                          // border: Border.all(
                          //   color: Color(0xFFdfe4ee),
                          // ),
                          border: Border(
                            bottom: BorderSide(
                              color: episode == "8"
                                  ? Colors.transparent
                                  : notifier.getfillborder,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              episode,
                              style: TextStyle(color: notifier.text),
                            ),
                          ],
                        ),
                      ),
                  ],
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final item = episodes.removeAt(oldIndex);
                      episodes.insert(newIndex, item);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
