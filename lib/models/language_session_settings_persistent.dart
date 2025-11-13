class LanguageSessionSettingsPersistent {
  final String targetLanguageBcp47;
  final bool imagesEnabled;
  final bool examplesSpeechEnabled;
  final bool dynamicGenerativeFrontcards;
  final int numberOfExamples;
  final String maleVoiceCode;
  final String femaleVoiceCode;

  const LanguageSessionSettingsPersistent({
    required this.targetLanguageBcp47,
    required this.imagesEnabled,
    required this.examplesSpeechEnabled,
    required this.dynamicGenerativeFrontcards,
    required this.numberOfExamples,
    required this.maleVoiceCode,
    required this.femaleVoiceCode,
  });
}
