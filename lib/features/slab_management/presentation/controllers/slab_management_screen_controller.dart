import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlabManagementScreenController extends GetxController{
  var slabs = <String>[].obs;

  void addSlab(String slabName) {
    if (slabName.isNotEmpty) {
      slabs.add(slabName);
    } else {
      Get.snackbar('Error', 'Slab name cannot be empty!',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  void removeSlab(int index) {
    slabs.removeAt(index);
  }

}