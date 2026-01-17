import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';
import 'package:vitalingu/repository/user_settings.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';

class StartupTargetLanguageState extends BaseStartupState {
  final SupportedLanguagesBcp47? targetLanguage;

  StartupTargetLanguageState({required this.targetLanguage})
      : super(canContinue: targetLanguage != null);
}

@injectable
class StartupTargetLanguageViewModel
    extends BaseStartupViewModel<StartupTargetLanguageState> {
  StartupTargetLanguageViewModel(this.userSettings)
      : super(StartupTargetLanguageState(targetLanguage: null));

  final UserSettings userSettings;

  SupportedLanguagesBcp47? get targetLanguage => state.value.targetLanguage;

  List<SupportedLanguagesBcp47> getSupportedLanguagesExcludingNative(
      SupportedLanguagesBcp47 previousLanguage) {
    return SupportedLanguagesBcp47.values
        .where((lang) => lang != previousLanguage)
        .toList();
  }

  Future<void> confirmLanguages(SupportedLanguagesBcp47 target, SupportedLanguagesBcp47 native) async {
    await userSettings.saveTargetLanguage(target);
    await userSettings.saveNativeLanguage(native);
    updateState(StartupTargetLanguageState(targetLanguage: target));
  }


}
