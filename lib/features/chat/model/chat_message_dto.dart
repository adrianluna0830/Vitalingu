
import 'package:vitalingu/core/models/ai/chat_message.dart';

class ChatMessageWidgetModel {
  final String content;
  final bool isUserMessage;
  final int id;
  ChatMessageWidgetModel({
    required this.content,
    required this.isUserMessage,
    required this.id,
  });

  factory ChatMessageWidgetModel.fromChatMessage(ChatMessage message, int id) {
    return ChatMessageWidgetModel(
      content: message.content,
      isUserMessage: message.isUserMessage,
      id: id,
    );
  }

}
