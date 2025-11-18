import 'package:flutter/material.dart';

class AnimatedVoiceButton extends StatelessWidget {
  final Color borderColor;
  final double borderWidth;
  final Color innerCircleColor;
  final double innerPadding;
  final Duration animationDuration;
  final double transformedSizePercentage; 
  final double transformedBorderRadiusFactor;
  final bool isCircle; 
  final VoidCallback onTap; 

  const AnimatedVoiceButton({
    super.key,
    this.borderColor = Colors.grey,
    this.borderWidth = 5.5,
    this.innerCircleColor = Colors.red,
    this.innerPadding = 10,
    this.animationDuration = const Duration(milliseconds: 235),
    this.transformedSizePercentage = 60.0,
    this.transformedBorderRadiusFactor = 3.5,
    required this.isCircle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxWidth < constraints.maxHeight
              ? constraints.maxWidth
              : constraints.maxHeight;
          
          final availableSize = size - (innerPadding * 2) - (borderWidth * 2);
          final transformedSize = (transformedSizePercentage / 100) * availableSize;
          
          return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: borderColor,
                width: borderWidth,
              ),
            ),
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.easeInOut,
              width: isCircle ? availableSize : transformedSize,
              height: isCircle ? availableSize : transformedSize,
              decoration: BoxDecoration(
                color: innerCircleColor,
                borderRadius: isCircle
                    ? BorderRadius.circular(availableSize / 2)
                    : BorderRadius.circular(transformedSize / transformedBorderRadiusFactor),
              ),
            ),
          );
        },
      ),
    );
  }
}
