import 'package:flutter/material.dart';
import 'package:vitalingu/widgets/page_slider/navigation_arrow.dart';
import 'package:vitalingu/widgets/page_slider/page_indicators.dart';

class NavigationControls extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final double arrowButtonSize;
  final double arrowButtonSpacing;
  final double dotSize;
  final double dotSpacing;
  final double arrowFillFactor;
  final Color arrowActiveColor;
  final Color arrowInactiveColor;
  final Color dotActiveColor;
  final Color dotInactiveColor;
  final bool showArrows; 

  const NavigationControls({super.key, 
    required this.currentIndex,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
    this.arrowButtonSize = 18.0,
    this.arrowButtonSpacing = 4.0,
    this.dotSize = 16.0,
    this.dotSpacing = 8.0,
    this.arrowFillFactor = 1,
    this.arrowActiveColor = const Color.fromARGB(255, 0, 0, 0),
    this.arrowInactiveColor = const Color.fromARGB(255, 131, 131, 131),
    this.dotActiveColor = const Color.fromARGB(255, 0, 0, 0),
    this.dotInactiveColor = const Color.fromARGB(255, 131, 131, 131),
    this.showArrows = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showArrows)
          SizedBox(
            width: arrowButtonSize,
            height: arrowButtonSize,
            child: NavigationArrow(
              icon: Icons.arrow_back_ios,
              isVisible: currentIndex > 0,
              onPressed: onPrevious,
              iconSize: arrowButtonSize * arrowFillFactor,
              isActive: currentIndex > 0,
              activeColor: arrowActiveColor,
              inactiveColor: arrowInactiveColor,
            ),
          ),
        if (showArrows) SizedBox(width: arrowButtonSpacing),
        PageIndicators(
          currentIndex: currentIndex,
          totalPages: totalPages,
          dotSize: dotSize,
          dotSpacing: dotSpacing,
          activeColor: dotActiveColor,
          inactiveColor: dotInactiveColor,
        ),
        if (showArrows) SizedBox(width: arrowButtonSpacing),
        if (showArrows)
          SizedBox(
            width: arrowButtonSize,
            height: arrowButtonSize,
            child: NavigationArrow(
              icon: Icons.arrow_forward_ios,
              isVisible: currentIndex < totalPages - 1,
              onPressed: onNext,
              iconSize: arrowButtonSize * arrowFillFactor,
              isActive: currentIndex < totalPages - 1,
              activeColor: arrowActiveColor,
              inactiveColor: arrowInactiveColor,
            ),
          ),
      ],
    );
  }
}
