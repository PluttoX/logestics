import 'package:flutter/material.dart';
class SlabDetailsScreen extends StatelessWidget {
  final String slabName;
  const SlabDetailsScreen({super.key, required this.slabName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slab Details')),
      body: Center(
        child: Text(
          'Details for $slabName',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
