import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ExpandableAnimatedContainer extends StatefulWidget {
  final bool isExpanded;
  final double expandedHeight;
  final Duration expansionDuration;
  final Duration innerAnimationDuration;
  final Duration delayBetweenAnimations;
  final double childInitialScale;
  final Widget child;

  const ExpandableAnimatedContainer({
    super.key,
    required this.isExpanded,
    required this.child,
    this.expandedHeight = 300.0,
    this.expansionDuration = const Duration(milliseconds: 300),
    this.innerAnimationDuration = const Duration(milliseconds: 300),
    this.delayBetweenAnimations = const Duration(milliseconds: 0),
    this.childInitialScale = .45,
  }) : assert(
          childInitialScale >= 0.0 && childInitialScale <= 1.0,
          'childInitialScale debe estar entre 0.0 y 1.0',
        );

  @override
  State<ExpandableAnimatedContainer> createState() =>
      _ExpandableAnimatedContainerState();
}

class _ExpandableAnimatedContainerState
    extends State<ExpandableAnimatedContainer> {
  bool _showInnerContent = false;
  bool _allowParentCollapse = true;

  @override
  void didUpdateWidget(ExpandableAnimatedContainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isExpanded && !oldWidget.isExpanded) {
      setState(() {
        _allowParentCollapse = true;
      });
      Future.delayed(
        widget.delayBetweenAnimations,
        () {
          if (mounted && widget.isExpanded) {
            setState(() {
              _showInnerContent = true;
            });
          }
        },
      );
    }

    if (!widget.isExpanded && oldWidget.isExpanded) {
      setState(() {
        _showInnerContent = false;
        _allowParentCollapse = false;
      });
      Future.delayed(
        widget.delayBetweenAnimations,
        () {
          if (mounted) {
            setState(() {
              _allowParentCollapse = true;
            });
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: widget.isExpanded || !_allowParentCollapse
          ? Control.play
          : Control.playReverse,
      tween: Tween<double>(begin: 0.0, end: widget.expandedHeight),
      duration: widget.expansionDuration,
      curve: Curves.easeInOut,
      builder: (context, height, _) {
        return SizedBox(
          height: height,
          width: double.infinity,
          child: height > 0
              ? ClipRect(
                  child: _buildInnerAnimation(),
                )
              : null,
        );
      },
    );
  }

  Widget _buildInnerAnimation() {
    return CustomAnimationBuilder<Movie>(
      control: _showInnerContent ? Control.play : Control.playReverse,
      tween: MovieTween()
        ..scene(
          duration: widget.innerAnimationDuration,
          curve: Curves.easeOut,
        )
            .tween('opacity', Tween<double>(begin: 0.0, end: 1.0))
            .tween('scale',
                Tween<double>(begin: widget.childInitialScale, end: 1.0)),
      duration: widget.innerAnimationDuration,
      builder: (context, value, _) {
        return Opacity(
          opacity: value.get('opacity'),
          child: Transform.scale(
            scale: value.get('scale'),
            child: widget.child,
          ),
        );
      },
    );
  }
}