import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

class TypingIndicator extends StatelessWidget {
  final double radius;
  final int dots;
  final Duration animationDuration;
  final double spacing;
  final double amplitude;
  final double startPositionIncrement;
  final Color dotColor;

  const TypingIndicator({
    super.key,
    this.radius = 10.0,
    this.dots = 3,
    this.animationDuration = const Duration(seconds: 1, milliseconds: 350),
    this.spacing = 10.0,
    this.amplitude = 10.0,
    this.startPositionIncrement = 0.5,
    this.dotColor = const Color.fromARGB(255, 122, 122, 122),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final gapSize = dots > 1 ? spacing : 0.0;

        return Row(
          crossAxisAlignment:  CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: List.generate(dots, (index) {
            final startPosition = (index * startPositionIncrement) % 1.0;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BouncingDot(
                  startPosition: startPosition,
                  radius: radius,
                  amplitude: amplitude,
                  duration: animationDuration,
                  color: dotColor,
                ),
                if (index < dots - 1) SizedBox(width: gapSize),
              ],
            );
          }),
        );
      },
    );
  }
}

class BouncingDot extends StatelessWidget {
  final double startPosition;
  final double radius;
  final double amplitude;
  final Duration duration;
  final Color color;

  const BouncingDot({
    super.key,
    required this.startPosition,
    required this.radius,
    required this.amplitude,
    required this.duration,
    this.color = const Color.fromARGB(255, 122, 122, 122),
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: Control.loop,
      tween: Tween<double>(begin: 0.0, end: 2 * pi),
      duration: duration,
      startPosition: startPosition,
      builder: (context, value, child) {
        double yOffset = amplitude * sin(value);

        return Transform.translate(
          offset: Offset(0, yOffset),
          child: Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}

