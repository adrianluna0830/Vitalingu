import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/widgets/triangle_painter.dart';

enum BubbleInnerDesignAlignment { left, right, none }

class MessageBubble extends StatelessWidget {
  final Widget child;
  final double triangleWidth;
  final double triangleHeight;
  final double borderRadius;
  final BubbleInnerDesignAlignment alignment;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double triangleOffset; 

  const MessageBubble({
    super.key,
    required this.child,
    this.triangleWidth = 20.0,
    this.triangleHeight =35.0,
    this.borderRadius = 11.0,
    this.alignment = BubbleInnerDesignAlignment.left,
    this.backgroundColor = const Color.fromARGB(255, 114, 114, 114),
    this.onTap,
    this.onLongPress,
    this.triangleOffset = 7, 
  });

  @override
  Widget build(BuildContext context) {
    final isLeft = alignment == BubbleInnerDesignAlignment.left;
    final isNone = alignment == BubbleInnerDesignAlignment.none;

    final BorderRadius effectiveBorderRadius = isNone
        ? BorderRadius.all(Radius.circular(borderRadius))
        : isLeft
            ? BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.circular(borderRadius),
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.zero,
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              );

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (!isNone)
                Positioned(
                  left: isLeft ? -triangleOffset : null,
                  right: isLeft ? null : -triangleOffset,
                  top: 0,
                  child: CustomPaint(
                    size: Size(triangleWidth, triangleHeight),
                    painter: TrianglePainter(
                      color: backgroundColor,
                      isLeft: isLeft,
                    ),
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: onTap != null
                    ? Material(
                        color: backgroundColor,
                        borderRadius: effectiveBorderRadius,
                        child: InkWell(
                          onLongPress: onLongPress,
                          onTap: onTap,
                          borderRadius: effectiveBorderRadius,
                          splashColor: Colors.black.withOpacity(0.1),
                          highlightColor: Colors.black.withOpacity(0.05),
                          hoverColor: Colors.black.withOpacity(0.05),
                          child: child,
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: effectiveBorderRadius,
                        ),
                        child: child,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
