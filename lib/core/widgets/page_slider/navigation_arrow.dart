import 'package:flutter/material.dart';

class NavigationArrow extends StatelessWidget {
  final IconData icon;
  final bool isVisible;
  final VoidCallback onPressed;
  final double iconSize;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;

  const NavigationArrow({super.key, 
    required this.icon,
    required this.isVisible,
    required this.onPressed,
    this.iconSize = 1,
    required this.isActive,
    this.activeColor = const Color.fromARGB(255, 0, 0, 0),
    this.inactiveColor = const Color.fromARGB(255, 131, 131, 131),
  });

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              icon,
              color: isActive ? activeColor : inactiveColor,
              size: iconSize,
            ),
            onPressed: onPressed,
          )
        : const SizedBox.expand();
  }
}
