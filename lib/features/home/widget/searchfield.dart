
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class Searchfield extends StatefulWidget {
  const Searchfield({super.key});

  @override
  State<Searchfield> createState() => _SearchfieldState();
}

class _SearchfieldState extends State<Searchfield> {

  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {

    notifier=Provider.of(context,listen: true);

    return TextField(
      cursorColor: notifier.text,
      style: TextStyle(color: notifier.text),
      decoration: InputDecoration(
        filled: true,
        fillColor: notifier.textFileColor,
        hintText: 'Search here...',
        prefixIcon: Image.asset(
          'assets/images/search.png',
          scale: 1.5,
          color: notifier.text,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: "Outfit",
        ),
        contentPadding: const EdgeInsets.only(left: 20, right: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
