import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logestics/features/slab_management/presentation/controllers/slab_management_screen_controller.dart';

import '../slab_details_screen/slab_details_screen.dart';
class SlabManagementScreen extends StatelessWidget {
  final  controller = Get.put(SlabManagementScreenController());

  SlabManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slab Management')),
      body: Obx(() => controller.slabs.isEmpty
          ? Center(child: Text('No slabs available. Add one!'))
          : ListView.builder(
        itemCount: controller.slabs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(controller.slabs[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.removeSlab(index),
              ),
              onTap: () => Get.to(SlabDetailsScreen(slabName: controller.slabs[index])),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(()),
        child: Icon(Icons.add),
      ),
    );
  }
}
