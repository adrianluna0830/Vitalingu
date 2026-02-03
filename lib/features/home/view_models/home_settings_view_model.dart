import 'package:injectable/injectable.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/core/models/settings/user_app_settings.dart';
@injectable
class HomeSettingsViewModel {
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;
  final GeminiApiKeySignal geminiApiKeySignal;
  final AlwaysTranslateSignal alwaysTranslateSignal;
  HomeSettingsViewModel(this.nativeLanguageSignal, this.targetLanguageSignal, this.geminiApiKeySignal, this.alwaysTranslateSignal);


  void updateNativeLanguage(Language language) {
    nativeLanguageSignal.value = language;
    
  }

  void updateTargetLanguage(Language language) {
    targetLanguageSignal.value = language;
  }

  void updateGeminiApiKey(String apiKey) {
    geminiApiKeySignal.value = apiKey;
  }

  void updateAlwaysTranslate(bool alwaysTranslate) {
    alwaysTranslateSignal.value = alwaysTranslate;
  }
} 
