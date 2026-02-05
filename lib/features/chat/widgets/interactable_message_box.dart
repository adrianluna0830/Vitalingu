import 'package:flutter/material.dart';

class InteractableMessageBox extends StatelessWidget {
  final int messageId;
  final String message;
  final Color backgroundColor;
  final Function(int messageId) onTap;
  final double minWidth;
  final double maxWidth;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final EdgeInsets contentPadding;

  InteractableMessageBox({
    super.key,
    required this.messageId,
    required this.message,
    required this.backgroundColor,
    required this.onTap,
    required this.textAlign,
    this.minWidth = 0.0,
    this.maxWidth = 300.0,
    this.textStyle = const TextStyle(color: Colors.black),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  }) : assert(
         message.trim().isNotEmpty,
         'InteractableMessageBox: message no puede estar vacío',
       );
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth, maxWidth: maxWidth),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(messageId),
          borderRadius: BorderRadius.circular(8.0),
          splashColor: Colors.black.withOpacity(0.1),
          highlightColor: Colors.black.withOpacity(0.05),
          hoverColor: Colors.black.withOpacity(0.05),
          child: Ink(
            padding: contentPadding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              textAlign: textAlign,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
