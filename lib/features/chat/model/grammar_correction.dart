
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
