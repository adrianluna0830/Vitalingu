import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/widgets/triangle_painter.dart';

enum BubbleInnerDesignAlignment { left, right }

class MessageBubble extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  final BubbleInnerDesignAlignment alignment;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double triangleOffset;
  final double triangleWidth;
  final double triangleHeight;
  final bool showTriangle;

  const MessageBubble({
    super.key,
    required this.child,
    this.triangleWidth = 8.0,
    this.triangleHeight = 12.0,
    this.borderRadius = 11.0,
    this.alignment = BubbleInnerDesignAlignment.left,
    this.backgroundColor = const Color.fromARGB(255, 114, 114, 114),
    this.onTap,
    this.onLongPress,
    this.triangleOffset = 7,
    this.showTriangle = true,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  @override
  Widget build(BuildContext context) {
    final BorderRadius effectiveBorderRadius =
        widget.alignment == BubbleInnerDesignAlignment.left
            ? BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.circular(widget.borderRadius),
                bottomLeft: Radius.circular(widget.borderRadius),
                bottomRight: Radius.circular(widget.borderRadius),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(widget.borderRadius),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(widget.borderRadius),
                bottomRight: Radius.circular(widget.borderRadius),
              );

    final double triangleWidth = widget.triangleWidth;
    final double triangleHeight = widget.triangleHeight;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.alignment == BubbleInnerDesignAlignment.left)
          widget.showTriangle
              ? CustomPaint(
                  size: Size(triangleWidth, triangleHeight),
                  painter: TrianglePainter(
                    color: widget.backgroundColor,
                    isLeft: true,
                  ),
                )
              : SizedBox(width: triangleWidth),
        Flexible(
          child: Material(
            color: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: widget.showTriangle
                    ? effectiveBorderRadius
                    : BorderRadius.circular(widget.borderRadius),
              ),
              child: InkWell(
                borderRadius: widget.showTriangle
                    ? effectiveBorderRadius
                    : BorderRadius.circular(widget.borderRadius),
                onTap: widget.onTap,
                onLongPress: widget.onLongPress,
                child: widget.child,
              ),
            ),
          ),
        ),
        if (widget.alignment == BubbleInnerDesignAlignment.right)
          widget.showTriangle
              ? CustomPaint(
                  size: Size(triangleWidth, triangleHeight),
                  painter: TrianglePainter(
                    color: widget.backgroundColor,
                    isLeft: false,
                  ),
                )
              : SizedBox(width: triangleWidth),
      ],
    );
  }
}
