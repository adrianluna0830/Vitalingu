import 'package:flutter/material.dart';
import 'package:vitalingu/core/widgets/message_input_bottom_bar_widget.dart';

class ChatBottomPanel extends StatelessWidget {
  const ChatBottomPanel({
    required this.expanded,
    required this.onToggleExpanded,
    required this.expandableContent,
    this.expandedHeight = 300.0,
    this.borderRadius = 30.0,
    this.animationDuration = const Duration(milliseconds: 300),
    this.opacityDuration = const Duration(milliseconds: 200),
    this.padding = 16.0,
  });

  final bool expanded;
  final VoidCallback onToggleExpanded;
  final Widget expandableContent;
  final double expandedHeight;
  final double borderRadius;
  final Duration animationDuration;
  final Duration opacityDuration;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: animationDuration,
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MessageInputRow(
              onToggleExpanded: onToggleExpanded,
              expanded: expanded,
              padding: padding,
              borderRadius: borderRadius,
            ),
            _ExpandableArea(
              expanded: expanded,
              padding: padding,
              expandedHeight: expandedHeight,
              borderRadius: borderRadius,
              animationDuration: animationDuration,
              opacityDuration: opacityDuration,
              child: expandableContent,
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageInputRow extends StatelessWidget {
  const _MessageInputRow({
    required this.onToggleExpanded,
    required this.expanded,
    required this.padding,
    required this.borderRadius,
  });

  final VoidCallback onToggleExpanded;
  final bool expanded;
  final double padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: MessageInputBottomBarWidget(
                onSend: (String arg) {},
                canType: true,
                borderRadius: borderRadius,
              ),
            ),
            const SizedBox(width: 8.0),
            AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onToggleExpanded,
                  icon: Icon(
                    expanded
                        ? Icons.arrow_downward_rounded
                        : Icons.arrow_upward_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpandableArea extends StatelessWidget {
  const _ExpandableArea({
    required this.expanded,
    required this.padding,
    required this.expandedHeight,
    required this.borderRadius,
    required this.animationDuration,
    required this.opacityDuration,
    required this.child,
  });

  final bool expanded;
  final double padding;
  final double expandedHeight;
  final double borderRadius;
  final Duration animationDuration;
  final Duration opacityDuration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      curve: Curves.easeInOut,
      height: expanded ? expandedHeight + padding : 0,
      child: AnimatedOpacity(
        duration: opacityDuration,
        curve: Curves.easeInOut,
        opacity: expanded ? 1.0 : 0.0,
        child: Padding(
          padding: EdgeInsets.only(
            left: padding,
            right: padding,
            bottom: padding,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: OverflowBox(
              minHeight: expandedHeight,
              maxHeight: expandedHeight,
              alignment: Alignment.topCenter,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}