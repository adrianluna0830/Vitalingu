import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/widgets/message_bubble.dart';

class TextMessageBubble extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

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
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return MessageBubble(
      onLongPress: onLongPress,
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