
import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  final Widget child;
  const PageScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        // bottom padding so content never hides behind floating navbar
        padding: const EdgeInsets.only(bottom: 80),
        child: child,
      ),
    );
  }
}
