
class LanguageSettings {
  final bool imagesEnabled;
  final bool examplesSpeechEnabled;
  final bool dynamicGenerativeFrontcards;
  final int numberOfExamples;
  final String maleVoiceCode;
  final String femaleVoiceCode;

  LanguageSettings({ this.imagesEnabled = true, this.examplesSpeechEnabled = true, this.dynamicGenerativeFrontcards = true, this.numberOfExamples = 3, required this.maleVoiceCode, required this.femaleVoiceCode});
}