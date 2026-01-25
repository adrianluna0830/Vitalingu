

import 'package:vitalingu/models/chat_message.dart';

class ChatConversation {
  final List<ChatMessage> _messages = [];



  void addModelMessage(String messageContent) {
    _messages.add(ChatMessage(
      content: messageContent,
      role: 'model',
    ));
  }

  void addUserMessage(String messageContent) {
    _messages.add(ChatMessage(
      content: messageContent,
      role: 'user',
    ));
  }

  List<ChatMessage> get allMessages => _messages;

  List<String> getUserMessages() {
    return _messages
        .where((msg) => msg.role == 'user')
        .map((msg) => msg.content)
        .toList();
  }

  List<String> getModelMessages() {
    return _messages
        .where((msg) => msg.role == 'model')
        .map((msg) => msg.content)
        .toList();
  }

  List<Map<String, dynamic>> toJsonList() {
    return _messages.map((msg) => msg.toJson()).toList();
  }
}
