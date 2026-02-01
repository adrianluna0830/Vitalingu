

import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/core/models/ai_client.dart';
import 'package:vitalingu/core/models/chat_conversation.dart';
import 'package:vitalingu/core/models/chat_message_dto.dart';
import 'package:vitalingu/core/models/result.dart';

class GrammarCorrection {
  final String correction;
  final String explanation;

  GrammarCorrection(this.correction, this.explanation);

  factory GrammarCorrection.fromJson(Map<String, dynamic> json) {
    return GrammarCorrection(
      json['correction'] as String,
      json['explanation'] as String,
    );
  }

  static Map<String, dynamic> getJsonSchema() {
    return {
      "type": "object",
      "properties": {
        "correction": {
          "type": "string",
          "description": "The corrected text with proper grammar.",
        },
        "explanation": {
          "type": "string",
          "description": "Brief explanation of what was grammatically wrong.",
        },
      },
      "required": ["correction", "explanation"],
    };
  }
}

class FluencySuggestion {
  final String suggestion;
  final String explanation;

  FluencySuggestion(this.suggestion, this.explanation);

  factory FluencySuggestion.fromJson(Map<String, dynamic> json) {
    return FluencySuggestion(
      json['suggestion'] as String,
      json['explanation'] as String,
    );
  }

  static Map<String, dynamic> getJsonSchema() {
    return {
      "type": "object",
      "properties": {
        "suggestion": {
          "type": "string",
          "description": "A more natural way to say it.",
        },
        "explanation": {
          "type": "string",
          "description": "Brief explanation of what specific words, phrases, or structures make this version sound more native.",
        },
      },
      "required": ["suggestion", "explanation"],
    };
  }
}

class MessageExtraData {
  final GrammarCorrection? grammarCorrection;
  final FluencySuggestion? fluencySuggestion;

  MessageExtraData(this.grammarCorrection, this.fluencySuggestion);

  factory MessageExtraData.fromJson(Map<String, dynamic> json) {
    return MessageExtraData(
      json['grammar_correction'] != null
          ? GrammarCorrection.fromJson(json['grammar_correction'])
          : null,
      json['fluency_suggestion'] != null
          ? FluencySuggestion.fromJson(json['fluency_suggestion'])
          : null,
    );
  }

  static Map<String, dynamic> getJsonSchema() {
    return {
      "type": "object",
      "properties": {
        "grammar_correction": {
          "type": ["object", "null"],
          ...GrammarCorrection.getJsonSchema(),
          "description": "ONLY provide if there are actual grammar errors. DO NOT provide if grammatically valid.",
        },
        "fluency_suggestion": {
          "type": ["object", "null"],
          ...FluencySuggestion.getJsonSchema(),
          "description": "ONLY provide if there are significant opportunities for improvement. DO NOT provide for minor changes.",
        },
      },
    };
  }
}


@injectable
class ChatViewModel {
  final AiClient _aiClient;
  ChatConversation _conversation = ChatConversation();

  ChatViewModel(this._aiClient);

  final messagesSignal = listSignal(<ChatMessageDTO>[]);

  Future<void> sendMessage(String content) async {
    _conversation.addUserMessage(content);
    messagesSignal.add(ChatMessageDTO.fromChatMessage(_conversation.allMessages.last));

    final result = await _aiClient.generateContent(content,outputJsonSchema: MessageExtraData.getJsonSchema());

    switch (result) {
      case Ok(:final value):
        _conversation = _conversation..addModelMessage(value);
       messagesSignal.add(ChatMessageDTO.fromChatMessage(_conversation.allMessages.last));
      case Err(:final error):
        throw error;
    }

  }

}
