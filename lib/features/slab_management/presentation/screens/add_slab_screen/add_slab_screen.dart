import 'package:flutter/material.dart';
import 'package:logestics/features/slab_management/presentation/controllers/slab_management_screen_controller.dart';
import 'package:get/get.dart';
class AddSlabScreen extends StatelessWidget {
  final  slabController = Get.find<SlabManagementScreenController>();
  final TextEditingController slabNameController = TextEditingController();

  AddSlabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Slab')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: slabNameController,
              decoration: InputDecoration(labelText: 'Slab Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                slabController.addSlab(slabNameController.text);
                if (slabNameController.text.isNotEmpty) {
                  Get.back();
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}