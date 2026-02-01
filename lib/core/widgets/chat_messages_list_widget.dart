import 'package:flutter/material.dart';
import 'package:vitalingu/core/models/chat_message_dto.dart';

class ChatMessagesListWidget extends StatelessWidget {
  const ChatMessagesListWidget(
    this.messages, {
    super.key,
    this.userMessageColor = Colors.blueAccent,
    this.aiMessageColor = const Color.fromARGB(255, 212, 212, 212),
    required this.onMessageTap,
  });

  final List<ChatMessageDTO> messages;
  final Color userMessageColor;
  final Color aiMessageColor;
  final Function(ChatMessageDTO message) onMessageTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemBuilder: (context, index) {
        final message = messages[index];
        final backgroundColor = message.isUserMessage ? userMessageColor : aiMessageColor;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Align(
            alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onMessageTap(message),
                borderRadius: BorderRadius.circular(8.0),
                splashColor: Colors.black.withOpacity(0.1),
                highlightColor: Colors.black.withOpacity(0.05),
                hoverColor: Colors.black.withOpacity(0.05),
                child: Ink(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    child: Text(
                      message.content,
                      style: TextStyle(
                        color: message.isUserMessage ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}