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
          "description":
              "Brief explanation of what specific words, phrases, or structures make this version sound more native.",
        },
      },
      "required": ["suggestion", "explanation"],
    };
  }
}
