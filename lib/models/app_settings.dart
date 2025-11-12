import 'package:vitalingu/language/language.dart';

class AppSettings {
  final String geminiApiKey;
  final String pixabayApiKey;
  final String microsoftSpeechApiKey;
  final String microsoftSpeechRegion;
  final Language nativeLanguage;

  const AppSettings({
    required this.geminiApiKey,
    required this.pixabayApiKey,
    required this.microsoftSpeechApiKey,
    required this.microsoftSpeechRegion,
    required this.nativeLanguage,
  });
}