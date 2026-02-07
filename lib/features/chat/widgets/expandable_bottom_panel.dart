import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:vitalingu/features/chat/widgets/scale_fade_content_transition.dart';

class ExpandableBottomPanel extends StatelessWidget {
  final Widget child;
  final bool isExpanded;
  final VoidCallback onClose;
  final double expandedHeight;
  final Duration animationDuration;
  final String? tapRegionGroupId;

  const ExpandableBottomPanel({
    super.key,
    required this.isExpanded,
    required this.onClose,
    this.expandedHeight = 100.0,
    this.animationDuration = const Duration(milliseconds: 400),
    required this.child,
    this.tapRegionGroupId,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableAnimation(
      isExpanded: isExpanded,
      expandedHeight: expandedHeight,
      animationDuration: animationDuration,
      builder: (context, height) {
        return SizedBox(
          width: double.infinity,
          height: height,
          child: height > 0
              ? TapRegion(
                  groupId: tapRegionGroupId,
                  onTapOutside: (_) => onClose(),
                  child: OverflowBox(
                    alignment: Alignment.topCenter,
                    minHeight: 0,
                    maxHeight: expandedHeight,
                    child: SizedBox(
                      height: expandedHeight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Material(
                                  color: Colors.brown[200],
                                  borderRadius: BorderRadius.circular(12),
                                  child: InkWell(
                                    onTap: onClose,
                                    borderRadius: BorderRadius.circular(12),
                                    hoverColor: Colors.brown[300],
                                    splashColor: Colors.brown[400],
                                    highlightColor: Colors.brown[100],
                                    child: Container(
                                      width: 60,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: ScaleFadeContentTransition(
                                child: child,
                              ),
                            ),
                          ],
                        ),
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

class ExpandableAnimation extends StatelessWidget {
  final bool isExpanded;
  final double expandedHeight;
  final Duration animationDuration;
  final Widget Function(BuildContext, double) builder;

  const ExpandableAnimation({
    super.key,
    required this.isExpanded,
    required this.expandedHeight,
    required this.animationDuration,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: isExpanded ? Control.play : Control.playReverse,
      tween: Tween<double>(begin: 0.0, end: expandedHeight),
      duration: animationDuration,
      curve: Curves.easeInOut,
      builder: (context, height, _) {
        return builder(context, height);
      },
    );
  }
}
