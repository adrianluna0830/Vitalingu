import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/word/word.dart';

@lazySingleton
class GeminiSettings {
  String apiKey = '';
}

@lazySingleton
class PixabaySettings {
  String apiKey = '';
}

@lazySingleton
class MicrosoftSpeechSettings {
  String apiKey = '';
  String region = '';
}

@lazySingleton
class NativeLanguage {
  Language? language;

}

@lazySingleton
class SessionTargetLanguage {
  Language? language;
  LanguageSettings? languageSettings;

}

