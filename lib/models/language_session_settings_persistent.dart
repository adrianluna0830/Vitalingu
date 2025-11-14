class LanguageSessionSettings {
  final bool imagesEnabled;
  final bool examplesUntranslatedSpeechEnabled;
  final bool examplesTranslatedSpeechEnabled;
  final bool dynamicGenerativeFrontcards;
  final int numberOfExamples;
  final String maleVoiceCode;
  final String femaleVoiceCode;

  const LanguageSessionSettings({ required this.examplesTranslatedSpeechEnabled,
    required this.imagesEnabled,
    required this.examplesUntranslatedSpeechEnabled,
    required this.dynamicGenerativeFrontcards,
    required this.numberOfExamples,
    required this.maleVoiceCode,
    required this.femaleVoiceCode,
  });
}
