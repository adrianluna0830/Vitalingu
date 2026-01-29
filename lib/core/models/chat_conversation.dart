import 'package:vitalingu/core/models/chat_message.dart';

class ChatConversation {
  final List<ChatMessage> _messages;

  ChatConversation([List<ChatMessage>? messages]) 
      : _messages = messages != null ? List.from(messages) : [];

  ChatConversation addModelMessage(String messageContent) {
    _messages.add(ChatMessage(
      content: messageContent,
      role: 'model',
      isUserMessage: false,
    ));
    return this;
  }

  ChatConversation addUserMessage(String messageContent) {
    _messages.add(ChatMessage(
      content: messageContent,
      role: 'user',
      isUserMessage: true,
    ));
    return this;
  }

  ChatConversation copyWith() {
    return ChatConversation(_messages);
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