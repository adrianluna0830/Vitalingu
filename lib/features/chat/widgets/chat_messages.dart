import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/model/chat_message_dto.dart';
import 'package:vitalingu/features/chat/widgets/message_bubble.dart';
import 'package:vitalingu/features/chat/widgets/text_message_bubble.dart';
import 'package:vitalingu/features/chat/widgets/typing_indicator.dart';
import 'package:simple_animations/simple_animations.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages(
    this.messagesInSendOrder, {
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    this.userMessageColor = const Color(0xFF2563EB),
    this.aiMessageColor = const Color(0xFFE0BBE4),
    this.userTextColor = Colors.white,
    this.aiTextColor = const Color(0xFF5A189A),
    required this.onMessageTap,
    this.messageSpacing = 2,
    this.minWidthFactor = 0.01,
    this.maxWidthFactor = 0.7,
    required this.showIsTyping,
    this.typingAnimationDuration = const Duration(milliseconds: 250),
    this.typingIndicatorHeight = 35.0,
    this.typingIndicatorWidth = 60.0,
  });

  final List<ChatMessageWidgetModel> messagesInSendOrder;
  final double screenWidth;
  final double screenHeight;
  final Color userMessageColor;
  final Color aiMessageColor;
  final Color userTextColor;
  final Color aiTextColor;
  final ValueChanged<int> onMessageTap;
  final double messageSpacing;
  final double minWidthFactor;
  final double maxWidthFactor;
  final bool showIsTyping;
  final Duration typingAnimationDuration;
  final double typingIndicatorHeight;
  final double typingIndicatorWidth;

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    final messagesReversed = widget.messagesInSendOrder.reversed.toList();

    return CustomScrollView(
      clipBehavior: Clip.none,
      reverse: true,
      slivers: [
        _buildTypingIndicator(),
        _buildMessageList(messagesReversed),
      ],
    );
  }

  Widget _buildTypingIndicator() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: widget.messageSpacing),
          CustomAnimationBuilder<Movie>(
            control: widget.showIsTyping
                ? Control.play
                : Control.playReverse,
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: widget.typingIndicatorWidth,
                height: widget.typingIndicatorHeight,
                child: MessageBubble(
                  alignment: BubbleInnerDesignAlignment.left,
                  backgroundColor: widget.aiMessageColor,
                  child: SizedBox.expand(
                    child: TypingIndicator(
                      radius: 3.25,
                      spacing: 3,
                      amplitude: 1.85,
                      startPositionIncrement: 0.2,
                      animationDuration: const Duration(seconds: 1, milliseconds: 200),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(List<ChatMessageWidgetModel> messagesReversed) {
    return SliverList(
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
            messagesReversed[index + 1].isUserMessage != message.isUserMessage;

        return Column(
          children: [
            SizedBox(height: widget.messageSpacing),
            Align(
              alignment: message.isUserMessage
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: widget.screenWidth * widget.minWidthFactor,
                  maxWidth: widget.screenWidth * widget.maxWidthFactor,
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
          ],
        );
      }, childCount: messagesReversed.length),
    );
  }
}
