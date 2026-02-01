import 'package:flutter/material.dart';
import 'package:vitalingu/core/models/chat_message_dto.dart';

class ChatMessagesListWidget extends StatelessWidget {
  const ChatMessagesListWidget(this.messages, {super.key});
  final List<ChatMessageDTO> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemBuilder: (context, index) {
        final message = messages[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0), 
          child: Align(
            alignment: message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: message.isUserMessage ? Colors.blueAccent : Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
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
        );
      },
    );
  }
}