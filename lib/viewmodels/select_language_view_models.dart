import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/services/word_prompts_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {

  List<Language> get availableLanguages => LanguageRegistry.languages;

  SelectLanguageViewModel({required super.navigationService});

  Future<void> selectLanguage(Language language) async {
    if (!getIt.isRegistered<AppSettings>()) {
      await navigationService.goToSettings();
      return;
    }

    if (getIt.hasScope('language-session')) {
      await getIt.popScope();
    }

    await getIt.pushNewScopeAsync(
      scopeName: "language-session",
      init: (getIt) async {
        getIt.registerSingleton<Language>(language);
        WordPromptsService wordPromptsService = WordPromptsService(
          nativeLanguage: getIt<AppSettings>().nativeLanguage,
          targetLanguage: language,
          geminiPromptService: getIt());
        getIt.registerSingleton<WordPromptsService>(wordPromptsService);
      },
    );

    await navigationService.goToLanguageView(language);
  }

  void goToSettings() {
    navigationService.goToSettings();
  }
}
