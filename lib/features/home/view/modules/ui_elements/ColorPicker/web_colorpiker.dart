// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:web_color_picker/web_color_picker.dart';

// class WebColorpiker extends StatefulWidget {
//   WebColorpiker({
//     super.key,
//     required this.title,
//     this.selectedColor,
//   });
//   final String title;
//   Color? selectedColor;

//   @override
//   State<WebColorpiker> createState() => _WebColorpikerState();
// }

// class _WebColorpikerState extends State<WebColorpiker> {
//   // create some values
//   // Color pickerColor = Color(0xFFFFFFFF);
//   // Color currentColor = Color(0xff443a49);

//   // ValueChanged<Color> callback
//   void changeColor(Color color) {
//     setState(() => widget.selectedColor = color);
//   }

//   TextEditingController textEditingController = TextEditingController();

//   // Color selectedColor = Colors.white; // Default color

//   // Function to convert hex string to Color
//   Color colorFromHex(String hexString) {
//     final buffer = StringBuffer();
//     if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
//     buffer.write(hexString.replaceFirst('#', ''));
//     return Color(int.parse(buffer.toString(), radix: 16));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Container(
//           width: constraints.maxWidth,
//           padding: EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.title,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xFF475569),
//                 ),
//               ),
//               SizedBox(height: 15),
//               WebColorPicker.builder(
//                 initialColor: widget.selectedColor,
//                 builder: (context, selectedColor) {
//                   return TextField(
//                     cursorColor: Colors.black,
//                     controller: textEditingController,
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: widget.selectedColor,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: BorderSide(
//                           width: 0.3,
//                           color: Color(0xFF848484),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: BorderSide(
//                           width: 0.3,
//                           color: Color(0xFF848484),
//                         ),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: BorderSide(
//                           color: Color(0xFF848484),
//                           width: 0.3,
//                         ),
//                       ),
//                     ),
//                     onSubmitted: (value) {
//                       setState(() {
//                         // Convert the input string to a color and set it to selectedColor
//                         try {
//                           widget.selectedColor =
//                               colorFromHex(textEditingController.text);
//                         } catch (e) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Invalid color code!')),
//                           );
//                         }
//                       });
//                     },
//                   );
//                 },
//                 onInput: (color, event) {
//                   setState(() {
//                     widget.selectedColor = color;
//                   });
//                 },
//                 onChange: (color, event) {
//                   setState(() {
//                     widget.selectedColor = color;
//                   });
//                 },
//               ),
//               SizedBox(height: 15),
//               Text(
//                 "Click in the input field.",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
