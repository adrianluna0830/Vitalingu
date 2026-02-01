import 'package:vitalingu/core/models/chat_message.dart';

class ChatMessageDTO {
  final String content;
  final bool isUserMessage;

  ChatMessageDTO({
    required this.content,
    required this.isUserMessage,
  });

  factory ChatMessageDTO.fromChatMessage(ChatMessage message) {
    return ChatMessageDTO(
      content: message.content,
      isUserMessage: message.isUserMessage,
    );
  }
}
