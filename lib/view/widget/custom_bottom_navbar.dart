import 'package:flutter/material.dart';
import 'package:vkstore/controllers/navigation_controller.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.find<NavigationController>();

    return obx(
      ()=> BottomNavigationBar(
        items: [],)
    );
    
  }
}