class LanguageSettings {
  final bool imagesEnabled;
  final bool examplesUntranslatedSpeechEnabled;
  final bool examplesTranslatedSpeechEnabled;
  final bool dynamicGenerativeFrontcards;
  final int numberOfExamples;
  final String maleVoiceCode;
  final String femaleVoiceCode;

  const LanguageSettings({ required this.examplesTranslatedSpeechEnabled,
    required this.imagesEnabled,
    required this.examplesUntranslatedSpeechEnabled,
    required this.dynamicGenerativeFrontcards,
    required this.numberOfExamples,
    required this.maleVoiceCode,
    required this.femaleVoiceCode,
  });

  factory LanguageSettings.fromJson(Map<String, dynamic> json) {
    return LanguageSettings(
      imagesEnabled: json['imagesEnabled'] as bool,
      examplesUntranslatedSpeechEnabled: json['examplesUntranslatedSpeechEnabled'] as bool,
      examplesTranslatedSpeechEnabled: json['examplesTranslatedSpeechEnabled'] as bool,
      dynamicGenerativeFrontcards: json['dynamicGenerativeFrontcards'] as bool,
      numberOfExamples: json['numberOfExamples'] as int,
      maleVoiceCode: json['maleVoiceCode'] as String,
      femaleVoiceCode: json['femaleVoiceCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagesEnabled': imagesEnabled,
      'examplesUntranslatedSpeechEnabled': examplesUntranslatedSpeechEnabled,
      'examplesTranslatedSpeechEnabled': examplesTranslatedSpeechEnabled,
      'dynamicGenerativeFrontcards': dynamicGenerativeFrontcards,
      'numberOfExamples': numberOfExamples,
      'maleVoiceCode': maleVoiceCode,
      'femaleVoiceCode': femaleVoiceCode,
    };
  }

  @override
  String toString() {
    return 'LanguageSettings(imagesEnabled: $imagesEnabled, examplesUntranslatedSpeechEnabled: $examplesUntranslatedSpeechEnabled, examplesTranslatedSpeechEnabled: $examplesTranslatedSpeechEnabled, dynamicGenerativeFrontcards: $dynamicGenerativeFrontcards, numberOfExamples: $numberOfExamples, maleVoiceCode: $maleVoiceCode, femaleVoiceCode: $femaleVoiceCode)';
  }
}
