import 'package:flutter/material.dart';
import 'package:portfolio/models/navbar_model.dart';

class FloatingAppBarItem extends StatelessWidget {
  const FloatingAppBarItem({
    super.key,
    required this.active,
    required this.item,
  });

  final bool active;
  final NavbarModel item;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF1E2D40) : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(item.icon,
              color: active ? Colors.white : Colors.white38,
              size: 16),
          if (active) ...[
            const SizedBox(width: 6),
            Text(
              item.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

