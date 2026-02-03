import 'package:vitalingu/core/models/chat_conversation.dart';
import 'package:vitalingu/core/models/result.dart';

abstract interface class AiClient {
  Future<Either<AIClientException, String>> generateContent(String prompt,{String? systemInstructions, Map<String, dynamic>? outputJsonSchema,bool think = false});
  Future<Either<AIClientException, ChatConversation>> generateChatResponse(
      ChatConversation conversation,
      {String? systemInstructions,
      Map<String, dynamic>? outputJsonSchema,
      bool think = false});
}

sealed class AIClientException implements Exception {
  final String message;
  AIClientException(this.message);

  @override
  String toString() => message;
}

class AIConfigurationException extends AIClientException {
  AIConfigurationException(super.message);
}

class AIRequestException extends AIClientException {
  AIRequestException(super.message);
}
