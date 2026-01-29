import 'package:vitalingu/models/chat_conversation.dart';

abstract interface class AiClient {
  Future<String> sendMessage(String message);
  Future<String> thinkAndSendMessage(String message);

  Future<ChatConversation> sendMessageFromConversation(ChatConversation conversation);
}
