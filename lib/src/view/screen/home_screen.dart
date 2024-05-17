import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hungry_hund/core/app_color.dart';
import 'package:hungry_hund/core/app_data.dart';
import 'package:hungry_hund/src/view/screen/cart_screen.dart';
import 'package:hungry_hund/src/view/screen/profile_screen.dart';
import 'package:hungry_hund/src/view/screen/favorite_screen.dart';
import 'package:hungry_hund/src/controller/office_furniture_controller.dart';
import 'package:hungry_hund/src/view/screen/office_furniture_list_screen.dart';

final OfficeFurnitureController controller =
    Get.put(OfficeFurnitureController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> screens = const [
    OfficeFurnitureListScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            currentIndex: controller.currentBottomNavItemIndex.value,
            showUnselectedLabels: true,
            onTap: controller.switchBetweenBottomNavigationItems,
            fixedColor: AppColor.lightBlack,
            items: AppData.bottomNavigationItems
                .map(
                  (element) => BottomNavigationBarItem(
                      icon: element.icon, label: element.label),
                )
                .toList(),
          );
        },
      ),
      body: Obx(() => screens[controller.currentBottomNavItemIndex.value]),
    );
  }
}
