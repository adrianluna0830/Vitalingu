import 'package:flutter/material.dart';
import 'package:vitalingu/features/chat/models/chat_conversation.dart';

class ChatMessagesListWidget extends StatelessWidget {
  const ChatMessagesListWidget(this.conversation, {super.key});
  final ChatConversation conversation;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: conversation.allMessages.length,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemBuilder: (context, index) {
        final message = conversation.allMessages[index];
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