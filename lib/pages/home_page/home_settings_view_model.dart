import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/user_app_settings.dart';
@injectable
class HomeSettingsViewModel {
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;
  final GeminiApiKeySignal geminiApiKeySignal;

  HomeSettingsViewModel(this.nativeLanguageSignal, this.targetLanguageSignal, this.geminiApiKeySignal);


  void updateNativeLanguage(Language language) {
    nativeLanguageSignal.value = language;
    
  }

  void updateTargetLanguage(Language language) {
    targetLanguageSignal.value = language;
  }

  void updateGeminiApiKey(String apiKey) {
    geminiApiKeySignal.value = apiKey;
  }
}
