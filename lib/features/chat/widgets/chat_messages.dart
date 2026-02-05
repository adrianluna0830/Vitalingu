import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/model/chat_message_dto.dart';
import 'package:vitalingu/features/chat/widgets/message_bubble.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages(
    this.messages, {
    super.key,
    this.userMessageColor = const Color(0xFF2563EB),
    this.aiMessageColor = const Color(0xFFF1F5F9),
    this.userTextColor = Colors.white,
    this.aiTextColor = const Color(0xFF0F172A),
    required this.onMessageTap,
    this.messageSpacing = 1.15,
    this.horizontalPadding = 6.0,
    this.minWidthFactor = 0.1,
    this.maxWidthFactor = 0.7,
    this.minHeightFactor = 0,
  });

  final List<ChatMessageWidgetModel> messages;
  final Color userMessageColor;
  final Color aiMessageColor;
  final Color userTextColor;
  final Color aiTextColor;
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
            ? widget.userTextColor
            : widget.aiTextColor;

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
                  color: textColor,
                  fontSize: 17,
                ),
                onTap: () {
                },
                onLongPress: () => {
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
