import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/model/chat_message_dto.dart';
import 'package:vitalingu/features/chat/widgets/message_bubble.dart';
import 'package:vitalingu/features/chat/widgets/text_message_bubble.dart';
import 'package:vitalingu/features/chat/widgets/typing_indicator.dart';
import 'package:simple_animations/simple_animations.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages(
    this.messages, {
    super.key,
    this.userMessageColor = const Color(0xFF2563EB),
    this.aiMessageColor = const Color(0xFFE0BBE4),
    this.userTextColor = Colors.white,
    this.aiTextColor = const Color(0xFF5A189A),
    required this.onMessageTap,
    this.messageSpacing = 1.15,
    this.minWidthFactor = 0.06,
    this.maxWidthFactor = 0.7,
    this.minHeightFactor = 0.035,
    required this.showIsTyping,
    this.typingAnimationDuration = const Duration(milliseconds: 250),
  });

  final List<ChatMessageWidgetModel> messages;
  final Color userMessageColor;
  final Color aiMessageColor;
  final Color userTextColor;
  final Color aiTextColor;
  final ValueChanged<int> onMessageTap;
  final double messageSpacing;
  final double minWidthFactor;
  final double maxWidthFactor;
  final double minHeightFactor;
  final bool showIsTyping;
  final Duration typingAnimationDuration;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    final messagesReversed = widget.messages.reversed.toList();
    final screenSize = MediaQuery.of(context).size;

    return CustomScrollView(
      clipBehavior: Clip.none,
      reverse: true,
      slivers: [
        SliverToBoxAdapter(
          child: CustomAnimationBuilder<Movie>(
            control: widget.showIsTyping ? Control.play : Control.playReverse,
            tween: MovieTween()
              ..tween('opacity', Tween<double>(begin: 0.0, end: 1.0),
                  duration: widget.typingAnimationDuration)
              ..tween('translateY', Tween<double>(begin: 20.0, end: 0.0),
                  duration: widget.typingAnimationDuration,
                  curve: Curves.easeOut),
            duration: widget.typingAnimationDuration,
            builder: (context, value, child) {
              return Opacity(
                opacity: value.get('opacity'),
                child: Transform.translate(
                  offset: Offset(0, value.get('translateY')),
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: widget.messageSpacing,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: screenSize.width * widget.minWidthFactor,
                  height: screenSize.height * widget.minHeightFactor,
                  child: MessageBubble(
                    alignment: BubbleInnerDesignAlignment.left,
                    backgroundColor: widget.aiMessageColor,
                    child: TypingIndicator(
                      radius: 3.5,
                      spacing: 2.5,
                      amplitude: 2,
                      startPositionIncrement: 0.125,
                      animationDuration: const Duration(seconds: 1, milliseconds: 200),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Messages list
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final message = messagesReversed[index];

            final backgroundColor = message.isUserMessage
                ? widget.userMessageColor
                : widget.aiMessageColor;

            final textColor = message.isUserMessage
                ? widget.userTextColor
                : widget.aiTextColor;

            final hasTail =
                index == messagesReversed.length - 1 ||
                messagesReversed[index + 1].isUserMessage !=
                    message.isUserMessage;

            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: widget.messageSpacing,
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
                    textStyle: TextStyle(color: textColor, fontSize: 17),
                    onTap: () {},
                    onLongPress: () => {},
                  ),
                ),
              ),
            );
          }, childCount: messagesReversed.length),
        ),
      ],
    );
  }
}
