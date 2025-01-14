// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';

class CustomClips extends StatefulWidget {
  const CustomClips({
    super.key,
    required this.title,
    this.showBlock,
    required this.text,
  });

  final String title;
  final List text;
  final bool? showBlock;

  @override
  State<CustomClips> createState() => _CustomClipsState();
}

class _CustomClipsState extends State<CustomClips> {
  
  late ColorNotifier notifier;
  
  List bgColor = [
    Color(0xFF0f79f3),
    Color(0xFF0f79f3),
    Color(0xFF796df6),
    Color(0xFFe74c3c),
  ];

  int selectedChipIndex = -1;

  void _handleChipSelection(int index) {
    setState(() {
      selectedChipIndex = index;
    });
  }

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
                widget.title,
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
                  for (var i = 0; i < widget.text.length; i++)
                    buildChoiceChip(widget.text[i], i, bgColor[i],
                        isWarnChip: widget.showBlock ?? false),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildChoiceChip(String label, int index, Color selectColor,
      {bool isWarnChip = false}) {
    notifier = Provider.of(context,listen: true);
    return ChoiceChip(
      label: isWarnChip == true ? Row(children: [Text(label)]) : Text(label),
      selected: selectedChipIndex == index,
      checkmarkColor: Colors.white,
      selectedColor: selectColor,
      backgroundColor: notifier.getBgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: BorderSide(
        color: notifier.getfillborder,
      ),
      labelStyle: TextStyle(
        color: selectedChipIndex == index ? Colors.white : notifier.text,
      ),
      onSelected: (bool selected) {
        _handleChipSelection(selected ? index : -1);
      },
    );
  }
}


// InkWell(
//   onTap: () {
//     setState(() {
//       isSelected[i] = !isSelected[i];
//     });
//   },
//   child: Container(
//     width: 130,
//     height: 40,
//     padding:
//         EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//     decoration: BoxDecoration(
//       color: isSelected[i] != true
//           ? Colors.transparent
//           : bgColor[i],
//       borderRadius: BorderRadius.circular(5),
//       border: Border.all(
//         color: Color(0xFFe1e1e1),
//       ),
//     ),
//     child: Row(
//       children: [
//         isSelected[i] != true
//             ? Container()
//             : Icon(
//                 Icons.check,
//                 color: Colors.white,
//               ),
//         isSelected[i] != true
//             ? Container()
//             : SizedBox(width: 10),
//         Text(
//           text[i],
//           style: TextStyle(
//             color: isSelected[i] == true
//                 ? Colors.white
//                 : Color(0xFF595f6a),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),


// SizedBox(
//   // width: constraints.maxWidth,
//   child: ChoiceChip(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(5),
//     ),
//     side: BorderSide(
//       color: Color(0xFFe1e1e1),
//     ),
//     checkmarkColor: Colors.white,
//     color: MaterialStateProperty.all<Color>(
//       isSelected[i] ? bgColor[i] : Colors.white,
//     ),
//     label: Text(
//       text[i],
//       style: TextStyle(
//         color: isSelected[i]
//             ? Colors.white
//             : Color(0xFF595f6a),
//       ),
//     ),
//     selected: isSelected[i],
//     onSelected: (value) {
//       setState(() {
//         isSelected[i] = value;
//       });
//       // setState(() {
//       //   for (int s = 0; s < isSelected.length; s++) {
//       //     isSelected[s] = !isSelected[s];
//       //     s = selectedChipIndex;
//       //   }
//       // });
//     },
//   ),
// ),