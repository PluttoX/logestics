import 'package:flutter/material.dart';


class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator while deciding
      ),
    );
  }
}
