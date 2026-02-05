import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

class TypingIndicator extends StatelessWidget {
  final double dotSizeRatio; // 0.0 a 1.0 (porcentaje del height del padre)
  final int dots; // número de dots
  final double
  speed; // multiplicador de velocidad (1.0 = normal, 2.0 = doble velocidad, 0.5 = mitad)
  final double delayIncrement; // delay entre cada dot (0.0 a 1.0)

  const TypingIndicator({
    super.key,
    this.dotSizeRatio = 0.5, // por defecto 30% del height
    this.dots = 3, // 3 dots por defecto
    this.speed = 1.25, // velocidad normal
    this.delayIncrement = 0.135, // ~33% de delay entre cada uno
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final availableWidth = constraints.maxWidth;

        // Tamaño del dot basado en el ratio del height
        final dotSize = availableHeight * dotSizeRatio;

        // La amplitud máxima es la mitad del espacio restante vertical
        final maxAmplitude = (availableHeight - dotSize) / 2;

        // Calcular gap size para que los dots toquen los bordes horizontalmente
        // availableWidth = (dots * dotSize) + ((dots - 1) * gap)
        // gap = (availableWidth - (dots * dotSize)) / (dots - 1)
        final gapSize = dots > 1
            ? (availableWidth - (dots * dotSize)) / (dots - 1)
            : 0.0;

        // Calcular duración basada en la velocidad
        final duration = Duration(milliseconds: (1400 / speed).round());

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(dots, (index) {
            // Calcular start position para cada dot
            final startPosition = (index * delayIncrement) % 1.0;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BouncingDot(
                  startPosition: startPosition,
                  size: dotSize,
                  amplitude: maxAmplitude,
                  duration: duration,
                ),
                // Agregar gap excepto después del último dot
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
  final double size;
  final double amplitude;
  final Duration duration;

  const BouncingDot({
    super.key,
    required this.startPosition,
    required this.size,
    required this.amplitude,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: Control.loop,
      tween: Tween<double>(begin: 0.0, end: 2 * pi),
      duration: duration,
      startPosition: startPosition,
      builder: (context, value, child) {
        // Movimiento sinusoidal con la amplitud calculada
        double yOffset = amplitude * sin(value);

        return Transform.translate(
          offset: Offset(0, yOffset),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
