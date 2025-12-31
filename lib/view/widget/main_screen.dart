import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:vkstore/controllers/navigation_controller.dart';
import 'package:vkstore/controllers/theme_controller.dart';
import 'package:vkstore/view/account_screeen.dart';
import 'package:vkstore/view/home_screen.dart';
import 'package:vkstore/view/shopping_screen.dart';
import 'package:vkstore/view/widget/custom_bottom_navbar.dart';
import 'package:vkstore/view/wishlist_screeen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

@override
Widget build(BuildContext context) {
  final NavigationController navigationController =
      Get.put(NavigationController());

  return GetBuilder<ThemeController>(
    builder: (themeController) => Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Obx(
          () => IndexedStack(
            key: ValueKey(
              navigationController.currentIndex.value,
            ),
            index: navigationController.currentIndex.value,
            children: [
              HomeScreen(),
              ShoppingScreen(),
              WishlistScreeen(),
              AccountScreeen(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(),
    ),
  );
}
}