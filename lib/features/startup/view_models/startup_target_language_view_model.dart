import 'package:injectable/injectable.dart';
import 'package:signals/signals.dart';
import 'package:vitalingu/core/router/app_router.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/core/models/settings/user_app_settings.dart';

@injectable
class StartupTargetLanguageViewModel {
  final TargetLanguageSignal targetLanguageSignal;
  final NativeLanguageSignal nativeLanguageSignal;
  final AppRouter _appRouter;
  
  
  StartupTargetLanguageViewModel(
    this.targetLanguageSignal,
    this._appRouter, {
    required this.nativeLanguageSignal,
  }) {
    if (targetLanguageSignal.value == nativeLanguageSignal.value) {
      targetLanguageSignal.value = supportedLanguages.value.first;
    }
  }
  
  
  late final supportedLanguages = computed(() {
    return Language.values
        .where((lang) => lang != nativeLanguageSignal.value)
        .toList();
  });
  
  void selectTargetLanguage(Language lang)  {
    targetLanguageSignal.value = lang;
  }
  
  void goToLevelSelectionPage() {
    _appRouter.push(StartupLevelConfigureRoute());
  }
  
  void goToNativeLanguageSelectionPage() {
    _appRouter.pop();
  }
}