import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/model/chat_message_dto.dart';
import 'package:vitalingu/features/chat/widgets/interactable_message_box.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages(
    this.messages, {
    super.key,
    this.userMessageColor = Colors.blueAccent,
    this.aiMessageColor = const Color.fromARGB(255, 212, 212, 212),
    required this.onMessageTap,
  });

  final List<ChatMessageWidgetModel> messages;
  final Color userMessageColor;
  final Color aiMessageColor;
  final Function(int messageId) onMessageTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemBuilder: (context, index) {
        final message = messages[index];
        final backgroundColor = message.isUserMessage ? userMessageColor : aiMessageColor;
        final textAlign = message.isUserMessage ? TextAlign.right : TextAlign.left;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Align(
            alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: InteractableMessageBox(
              messageId: message.id,
              message: message.content,
              backgroundColor: backgroundColor,
              textColor: message.isUserMessage ? Colors.white : Colors.black,
              onTap: onMessageTap,
              textAlign: textAlign,
            ),
          ),
        );
      },
    );
  }
}
