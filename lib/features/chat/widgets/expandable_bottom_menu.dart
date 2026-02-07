import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:vitalingu/features/chat/widgets/bottom_menu_background.dart';
import 'package:vitalingu/features/chat/widgets/scale_fade_content_transition.dart';


class ExpandableBottomMenu extends StatelessWidget {
  final Widget child;
  final bool isExpanded;
  final VoidCallback onClose;
  final double expandedHeight;
  final Duration animationDuration;

  const ExpandableBottomMenu({
    super.key,
    required this.isExpanded,
    required this.onClose,
    this.expandedHeight = 100.0,
    this.animationDuration = const Duration(milliseconds: 400),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: isExpanded ? Control.play : Control.playReverse,
      tween: Tween<double>(begin: 0.0, end: expandedHeight),
      duration: animationDuration,
      curve: Curves.easeInOut,
      builder: (context, height, _) {
        return SizedBox(
          width: double.infinity,
          height: height,
          child: height > 0
              ? OverflowBox(
                  alignment: Alignment.topCenter,
                  minHeight: 0,
                  maxHeight: expandedHeight,
                  child: SizedBox(
                    height: expandedHeight,
                    child: BottomMenuBackground(
                      onClose: onClose,
                      child: ScaleFadeContentTransition(
                        child: child,
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
