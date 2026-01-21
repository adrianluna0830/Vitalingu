import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/user_app_settings.dart';
@injectable
class HomeSettingsViewModel {
  final NativeLanguageSignal nativeLanguageSignal;
  final TargetLanguageSignal targetLanguageSignal;

  HomeSettingsViewModel({required this.nativeLanguageSignal, required this.targetLanguageSignal});

  void updateNativeLanguage(Language language) {
    nativeLanguageSignal.value = language;
    
    print('Native language updated to: ${nativeLanguageSignal.value}');
  }

  void updateTargetLanguage(Language language) {
    targetLanguageSignal.value = language;
  }
}
