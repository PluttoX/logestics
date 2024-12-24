import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tab 1 Content',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
