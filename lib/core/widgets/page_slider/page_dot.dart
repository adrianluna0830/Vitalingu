import 'package:flutter/material.dart';

class PageDot extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;

  const PageDot({super.key, 
    required this.isActive,
    this.activeColor = const Color.fromARGB(255, 0, 0, 0),
    this.inactiveColor = const Color.fromARGB(255, 131, 131, 131),
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? activeColor : inactiveColor,
      ),
    );
  }
}