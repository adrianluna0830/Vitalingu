
import 'package:vitalingu/core/models/ai/chat_message.dart';

class ChatMessageWidgetModel {
  final String content;
  final bool isUserMessage;
  ChatMessageWidgetModel({
    required this.content,
    required this.isUserMessage,
  });

  factory ChatMessageWidgetModel.fromChatMessage(ChatMessage message) {
    return ChatMessageWidgetModel(
      content: message.content,
      isUserMessage: message.isUserMessage,
    );
  }

}
