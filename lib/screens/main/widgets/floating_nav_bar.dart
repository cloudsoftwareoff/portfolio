import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/main_screen_controller.dart';
import 'package:portfolio/models/navbar_model.dart';
import 'package:portfolio/screens/main/widgets/floating_app_bar_item.dart';

class FloatingNavBar extends GetView<MainScreenController> {
  const FloatingNavBar({super.key});

  static const _items = [
    NavbarModel(icon: Icons.home_outlined, title: 'Home'),
    NavbarModel(icon: Icons.person_outline, title: 'About'),
    NavbarModel(icon: Icons.bolt_outlined, title: 'Skills'),
    NavbarModel(icon: Icons.folder_outlined, title: 'Projects'),
    NavbarModel(icon: Icons.work_history_outlined, title: 'Experience'),
    NavbarModel(icon: Icons.mail_outline, title: 'Contact'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF111827).withOpacity(0.85),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final active = controller.currentIndex.value == index;
            return GestureDetector(
              onTap: () => controller.changeIndex(index),
              child: FloatingAppBarItem(active: active, item: item),
            );
          }),
        ),
      ),
    );
  }
}
