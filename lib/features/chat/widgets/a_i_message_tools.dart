import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitalingu/features/chat/pages/chat_page.dart';

class AIMessageTools extends StatefulWidget {
  final double internalPadding;
  final double borderRadius;
  final Widget? child;
  final VoidCallback onTranslation;
  final VoidCallback onSegmentedTranslation;
  final VoidCallback onDoubt;
  final VoidCallback onWordInfo;

  AIMessageTools({
    super.key,
    this.child,
    required this.onTranslation,
    required this.onSegmentedTranslation,
    required this.onDoubt,
    required this.onWordInfo,
    this.borderRadius = 16.0,
    this.internalPadding = 16.0,
  });

  @override
  State<AIMessageTools> createState() => AIMessageToolsState();
}

class AIMessageToolsState extends State<AIMessageTools> {
  AIMessageAction selectedAction = AIMessageAction.translation;

  Widget _shimmerLine({required double maxWidth, double widthFactor = 1.0, double height = 14.0}) {
    return Shimmer(
      color: Colors.white,
      colorOpacity: 0.4,
      duration: const Duration(seconds: 2),
      child: Container(
        width: maxWidth * widthFactor,
        height: height,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 215, 215, 215),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _shimmerBlock({required double maxWidth, double widthFactor = 1.0, double height = 14.0}) {
    return Shimmer(
      color: Colors.white,
      colorOpacity: 0.4,
      duration: const Duration(seconds: 2),
      child: Container(
        width: maxWidth * widthFactor,
        height: height,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 215, 215, 215),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

  Widget _skeletonTranslation(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _shimmerLine(maxWidth: maxWidth, widthFactor: 0.4, height: 12),
        const SizedBox(height: 8),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 1.0),
        const SizedBox(height: 6),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 1.0),
        const SizedBox(height: 6),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 0.7),
        const SizedBox(height: 24),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 0.4, height: 12),
        const SizedBox(height: 8),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 1.0),
        const SizedBox(height: 6),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 1.0),
        const SizedBox(height: 6),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 0.55),
      ],
    );
  }

  Widget _skeletonSegmentedTranslation(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _shimmerBlock(maxWidth: maxWidth, widthFactor: 0.08, height: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.6),
                  const SizedBox(height: 6),
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.45),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _shimmerBlock(maxWidth: maxWidth, widthFactor: 0.08, height: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.75),
                  const SizedBox(height: 6),
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.5),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _shimmerBlock(maxWidth: maxWidth, widthFactor: 0.08, height: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.55),
                  const SizedBox(height: 6),
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.4),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _shimmerBlock(maxWidth: maxWidth, widthFactor: 0.08, height: 28),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.65),
                  const SizedBox(height: 6),
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.35),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _skeletonDoubt(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _shimmerBlock(maxWidth: maxWidth, widthFactor: 1.0, height: 56),
        const SizedBox(height: 20),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 0.35, height: 12),
        const SizedBox(height: 10),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 1.0),
        const SizedBox(height: 6),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 1.0),
        const SizedBox(height: 6),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 0.8),
        const SizedBox(height: 6),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 1.0),
        const SizedBox(height: 6),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 0.6),
      ],
    );
  }

  Widget _skeletonWordInfo(double maxWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _shimmerBlock(maxWidth: maxWidth, widthFactor: 0.35, height: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.5, height: 12),
                  const SizedBox(height: 6),
                  _shimmerLine(maxWidth: maxWidth, widthFactor: 0.7, height: 12),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _shimmerLine(maxWidth: maxWidth, widthFactor: 0.25, height: 12),
        const SizedBox(height: 10),
        _shimmerBlock(maxWidth: maxWidth, widthFactor: 1.0, height: 36),
        const SizedBox(height: 12),
        _shimmerBlock(maxWidth: maxWidth, widthFactor: 1.0, height: 36),
        const SizedBox(height: 12),
        _shimmerBlock(maxWidth: maxWidth, widthFactor: 1.0, height: 36),
      ],
    );
  }

  Widget _currentSkeleton(double maxWidth) {
    switch (selectedAction) {
      case AIMessageAction.translation:
        return _skeletonTranslation(maxWidth);
      case AIMessageAction.segmentedTranslation:
        return _skeletonSegmentedTranslation(maxWidth);
      case AIMessageAction.doubt:
        return _skeletonDoubt(maxWidth);
      case AIMessageAction.wordInfo:
        return _skeletonWordInfo(maxWidth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.internalPadding,
                right: widget.internalPadding,
                left: widget.internalPadding,
              ),
              child: widget.child ??
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return _currentSkeleton(constraints.maxWidth);
                    },
                  ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(widget.internalPadding),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<AIMessageAction>(
                segments: const [
                  ButtonSegment(
                    value: AIMessageAction.translation,
                    label: Text('Translate'),
                  ),
                  ButtonSegment(
                    value: AIMessageAction.segmentedTranslation,
                    label: Text('Segmented'),
                  ),
                  ButtonSegment(
                    value: AIMessageAction.doubt,
                    label: Text('Doubt'),
                  ),
                  ButtonSegment(
                    value: AIMessageAction.wordInfo,
                    label: Text('Word Info'),
                  ),
                ],
                selected: {selectedAction},
                showSelectedIcon: false,
                onSelectionChanged: (newSelection) {
                  final action = newSelection.first;
                  setState(() {
                    selectedAction = action;
                  });
                  switch (action) {
                    case AIMessageAction.translation:
                      widget.onTranslation();
                      break;
                    case AIMessageAction.segmentedTranslation:
                      widget.onSegmentedTranslation();
                      break;
                    case AIMessageAction.doubt:
                      widget.onDoubt();
                      break;
                    case AIMessageAction.wordInfo:
                      widget.onWordInfo();
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}