import 'package:vitalingu/features/chat/model/fluency_suggestion.dart';
import 'package:vitalingu/features/chat/model/grammar_correction.dart';


class AIMessageExtraData  {
  String? translation;
}


class UserMessageExtraData {
  final GrammarCorrection? grammarCorrection;
  final FluencySuggestion? fluencySuggestion;

  UserMessageExtraData(this.grammarCorrection, this.fluencySuggestion);

  factory UserMessageExtraData.fromJson(Map<String, dynamic> json) {
    return UserMessageExtraData(
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
          "description":
              "ONLY provide if there are actual grammar errors. DO NOT provide if grammatically valid.",
        },
        "fluency_suggestion": {
          "type": ["object", "null"],
          ...FluencySuggestion.getJsonSchema(),
          "description":
              "ONLY provide if there are significant opportunities for improvement. DO NOT provide for minor changes.",
        },
      },
    };
  }
}
