import 'package:flutter/material.dart';

enum BubbleInnerDesignAlignment { left, right, none }

class MessageBubble extends StatelessWidget {
  final Widget child;
  final double triangleWidth;
  final double triangleHeight;
  final BorderRadius borderRadius;
  final BubbleInnerDesignAlignment alignment;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const MessageBubble({
    super.key,
    required this.child,
    this.triangleWidth = 22.0,
    this.triangleHeight = 22.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
    this.alignment = BubbleInnerDesignAlignment.left,
    this.backgroundColor = const Color.fromARGB(255, 114, 114, 114),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isLeft = alignment == BubbleInnerDesignAlignment.left;
    final isNone = alignment == BubbleInnerDesignAlignment.none;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              if (!isNone)
                Positioned(
                  left: isLeft ? -(triangleWidth/2) : null,
                  right: isLeft ? null : -(triangleWidth/2),
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
                        borderRadius: borderRadius,
                        child: InkWell(
                          onTap: onTap,
                          borderRadius: borderRadius,
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
                          borderRadius: borderRadius,
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

class TrianglePainter extends CustomPainter {
  final Color color;
  final bool isLeft;
  TrianglePainter({required this.color, required this.isLeft});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    
    if (isLeft) {
      // Triángulo apuntando hacia la izquierda (lado opuesto)
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, 0);
    } else {
      // Triángulo apuntando hacia la derecha (lado opuesto)
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, 0);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class TextMessageBubble extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final BubbleInnerDesignAlignment alignment;
  final Color backgroundColor;
  final bool hasTail;

  const TextMessageBubble({
    this.hasTail = true,
    super.key,
    required this.text,
    this.textStyle = const TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 16,leadingDistribution: TextLeadingDistribution.even),
    this.onTap,
    required this.alignment,
    this.backgroundColor = const Color.fromARGB(255, 91, 91, 91),
  });

  @override
  Widget build(BuildContext context) {
    return MessageBubble(
      onTap: onTap,
      alignment: !hasTail ?  BubbleInnerDesignAlignment.none : alignment,
      backgroundColor: backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          left: 11.0,
          right: 11.0,
          top: 2.5,
          bottom: 7.0,
        ),
        child: Text(
          text,
          style: textStyle,
          textAlign: alignment == BubbleInnerDesignAlignment.left ? TextAlign.right : TextAlign.left ,
        ),
      ),
      
    );
  }
}