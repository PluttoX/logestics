// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Controllers/controllers.dart';
import 'Cards/cards_screen.dart';
import 'MaterialCards/material_cards_screen.dart';

class CardsandMaterialCardsScreen extends StatefulWidget {
  const CardsandMaterialCardsScreen({super.key});

  @override
  State<CardsandMaterialCardsScreen> createState() =>
      _CardsandMaterialCardsScreenState();
}

class _CardsandMaterialCardsScreenState
    extends State<CardsandMaterialCardsScreen> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: const [
              CardsScreen(),
              SizedBox(height: 20),
              MaterialCardsScreen(),
            ],
          ),
        );
      },
    );
  }
}
