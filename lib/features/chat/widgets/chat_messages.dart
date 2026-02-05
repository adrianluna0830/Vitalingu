import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/message_bubble.dart';
import 'package:vitalingu/features/chat/model/chat_message_dto.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages(
    this.messages, {
    super.key,
    this.userMessageColor = const Color(0xFF2563EB),
    this.aiMessageColor = const Color(0xFFF1F5F9),
    this.userTextColor = Colors.white, // Added user text color parameter
    this.aiTextColor = const Color(0xFF0F172A), // Added AI text color parameter
    required this.onMessageTap,
    this.messageSpacing = 2.0,
    this.horizontalPadding = 6.0,
    this.minWidthFactor = 0.05,
    this.maxWidthFactor = 0.45,
    this.minHeightFactor = 0,
  });

  final List<ChatMessageWidgetModel> messages;
  final Color userMessageColor;
  final Color aiMessageColor;
  final Color userTextColor; // Added user text color field
  final Color aiTextColor; // Added AI text color field
  final ValueChanged<int> onMessageTap;
  final double messageSpacing;
  final double horizontalPadding;
  final double minWidthFactor;
  final double maxWidthFactor;
  final double minHeightFactor;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    final messagesReversed = widget.messages.reversed.toList();
    final screenSize = MediaQuery.of(context).size;

    return ListView.builder(
      reverse: true,
      itemCount: messagesReversed.length,
      itemBuilder: (context, index) {
        final message = messagesReversed[index];

        final backgroundColor = message.isUserMessage
            ? widget.userMessageColor
            : widget.aiMessageColor;

        final textColor = message.isUserMessage
            ? widget.userTextColor // Use user text color
            : widget.aiTextColor; // Use AI text color

        final hasTail = index == messagesReversed.length - 1 ||
            messagesReversed[index + 1].isUserMessage !=
                message.isUserMessage;

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: widget.messageSpacing,
            horizontal: widget.horizontalPadding,
          ),
          child: Align(
            alignment: message.isUserMessage
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: screenSize.width * widget.minWidthFactor,
                maxWidth: screenSize.width * widget.maxWidthFactor,
                minHeight: screenSize.height * widget.minHeightFactor,
              ),
              child: TextMessageBubble(
                text: message.content,
                alignment: message.isUserMessage
                    ? BubbleInnerDesignAlignment.right
                    : BubbleInnerDesignAlignment.left,
                backgroundColor: backgroundColor,
                hasTail: hasTail,
                textStyle: TextStyle(
                  color: textColor, // Use the new text color parameter
                  fontSize: 17,
                ),
                onTap: () => widget.onMessageTap(index),
              ),
            ),
          ),
        );
      },
    );
  }
}
