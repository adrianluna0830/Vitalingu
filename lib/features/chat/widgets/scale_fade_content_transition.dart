import 'package:flutter/material.dart';

class ScaleFadeContentTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final double scaleBegin;
  final Curve scaleCurve;

  const ScaleFadeContentTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.switchInCurve = Curves.easeInOut,
    this.switchOutCurve = Curves.easeInOut,
    this.scaleBegin = 0.95,
    this.scaleCurve = Curves.easeInOutBack,
  });

  

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: (Widget child, Animation<double> animation) {
        final scaleAnimation = Tween<double>(
          begin: scaleBegin,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: scaleCurve,
        ));

        return ScaleTransition(
          scale: scaleAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }

}
