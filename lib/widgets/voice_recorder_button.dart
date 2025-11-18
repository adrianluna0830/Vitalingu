import 'package:flutter/material.dart';

class VoiceRecorderButton extends StatelessWidget {
  final Color borderColor;
  final double borderWidth;
  final Color innerCircleColor;
  final double innerPadding;
  final Duration animationDuration;
  final double transformedSizePercentage; 
  final bool isCircle; 
  final VoidCallback onTap; 

  const VoiceRecorderButton({
    Key? key,
    this.borderColor = Colors.grey,
    this.borderWidth = 5.5,
    this.innerCircleColor = Colors.red,
    this.innerPadding = 10,
    this.animationDuration = const Duration(milliseconds: 250),
    this.transformedSizePercentage = 60.0,
    required this.isCircle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Usar el menor valor entre ancho y alto para mantener forma circular
          final size = constraints.maxWidth < constraints.maxHeight
              ? constraints.maxWidth
              : constraints.maxHeight;
          
          // Calcular tamaños de forma estática
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
                    : BorderRadius.circular(transformedSize / 4),
              ),
            ),
          );
        },
      ),
    );
  }
}