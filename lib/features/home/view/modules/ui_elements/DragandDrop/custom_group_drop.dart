// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class CustomKanBen extends StatefulWidget {
  const CustomKanBen({
    super.key,
    required this.titleh,
    required this.subtitle1,
    required this.subtitle2,
    required this.list1,
    required this.list2,
  });

  final String titleh;
  final String subtitle1;
  final String subtitle2;
  final List<String> list1;
  final List<String> list2;

  @override
  State<CustomKanBen> createState() => _CustomKanBenState();
}

class _CustomKanBenState extends State<CustomKanBen> {
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    notifier = Provider.of(context, listen: true);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          // height: 580,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.titleh,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width / 5,
                    child: _buildList(widget.subtitle1, widget.list1),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: width / 5,
                    child: _buildList(widget.subtitle2, widget.list2),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildList(String title, List<String> items) {
    notifier = Provider.of(context, listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: notifier.text,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          child: DragTarget<String>(
            onAccept: (item) {
              setState(() {
                if (title == widget.subtitle1) {
                  widget.list1.add(item);
                  widget.list2.remove(item);
                } else {
                  widget.list1.remove(item);
                  widget.list2.add(item);
                }
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: notifier.getfillborder,
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Draggable<String>(
                      data: items[index],
                      feedback: Material(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: notifier.getfillborder),
                        ),
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            _buildListItem(items[index], isDragging: true),
                          ],
                        ),
                      ),
                      childWhenDragging: Container(),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: notifier.getfillborder),
                          ),
                        ),
                        child: Row(
                          children: [
                            _buildListItem(items[index]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(String item, {bool isDragging = false}) {

    notifier=Provider.of(context,listen: true);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // border: Border(bottom: BorderSide(color: Color(0xFFdfe4ee))),
      ),
      child: Text(
        item,
        style: TextStyle(
          fontSize: 16,
          color: isDragging ? Colors.grey : notifier.text,
        ),
      ),
    );
  }
}
