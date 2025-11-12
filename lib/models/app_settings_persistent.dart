class AppSettingsPersistent {
  final String geminiApiKey;
  final String pixabayApiKey;
  final String microsoftSpeechApiKey;
  final String microsoftSpeechRegion;
  final String nativeLanguageBcp47;

  const AppSettingsPersistent({
    required this.geminiApiKey,
    required this.pixabayApiKey,
    required this.microsoftSpeechApiKey,
    required this.microsoftSpeechRegion,
    required this.nativeLanguageBcp47,
  });
}
