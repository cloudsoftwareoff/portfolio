import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/controllers/main_screen_controller.dart';
import 'package:portfolio/core/resources/app_colors.dart';
import 'floating_app_bar_item.dart';

class FloatingNavBar extends GetView<MainScreenController> {
  FloatingNavBar({super.key});

  final List<(String, IconData)> _items = [
    ('Home', Icons.home_outlined),
    ('About', Icons.person_outline),
    ('Skills', Icons.auto_awesome_outlined),
    ('Projects', Icons.hexagon_outlined),
    ('Experience', Icons.visibility_outlined),
    ('Contact', Icons.mail_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.outline.withValues(alpha: 0.5)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(_items.length, (index) {
              return Obx(() {
                final isSelected = controller.currentIndex.value == index;
                return FloatingAppBarItem(
                  label: _items[index].$1,
                  icon: _items[index].$2,
                  isSelected: isSelected,
                  onTap: () => controller.changeIndex(index),
                );
              });
            }),
          ),
        ),
      ),
    );
  }
}
