import 'package:flutter/material.dart';
import 'package:vitalingu/widgets/page_slider/page_dot.dart';

class PageIndicators extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final double dotSize;
  final double dotSpacing;
  final Color activeColor;
  final Color inactiveColor;

  const PageIndicators({super.key, 
    required this.currentIndex,
    required this.totalPages,
    this.dotSize = 14.0,
    this.dotSpacing = 4.0,
    this.activeColor = const Color.fromARGB(255, 0, 0, 0),
    this.inactiveColor = const Color.fromARGB(255, 131, 131, 131),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalPages,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: dotSpacing),
          child: SizedBox(
            width: dotSize,
            height: dotSize,
            child: PageDot(
              isActive: currentIndex == index,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
            ),
          ),
        ),
      ),
    );
  }
}
