
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../slab_management/presentation/screens/slab_management_screen/slab_management_screen.dart';
import '../../controllers/dashboard_screen_controller.dart';
import '../home_screen/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  final  controller =Get.find<DashboardScreenController>();

   DashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Obx(() => NavigationRail(
              useIndicator: true,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (int index) {
                controller.updateIndex(index);
              },
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.rate_review),
                  label: Text('Slabs'),
                ),
              ],
              trailing: TextButton(onPressed: (){
                controller.signOut();
              }, child: Column(
                children: [
                  Icon(Icons.logout),
                  Text('Logout')
                ],
              )),
            )),
            const VerticalDivider(thickness: 1, width: 1),
           Obx(() => Expanded(
             child: IndexedStack(
                  index: controller.selectedIndex.value,
                  children: [
                    HomeScreen(),
                    SlabManagementScreen(),
                  ],
                ),
           ),
           ),

          ],
        ),
      ),
    );
  }
}
