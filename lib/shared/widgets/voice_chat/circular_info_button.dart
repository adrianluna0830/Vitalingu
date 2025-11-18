import 'package:flutter/material.dart';

class CircularInfoButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double iconSize;
  final Color backgroundColor;
  final Color? iconColor;
  final double shadowBlurRadius;
  final Color shadowColor;

  const CircularInfoButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconSize = 28.0,
    this.backgroundColor = Colors.white,
    this.iconColor,
    this.shadowBlurRadius = 4.0,
    this.shadowColor = Colors.black26,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: shadowBlurRadius,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
