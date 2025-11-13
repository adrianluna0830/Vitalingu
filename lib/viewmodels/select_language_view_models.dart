import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/services/language_session_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {
  final LanguageSessionService _languageSessionService;

  List<Language> get availableLanguages => LanguageRegistry.languages;

  SelectLanguageViewModel({
    required LanguageSessionService languageSessionService,
    required super.navigationService,
    required super.scopeManagerService,
  }) : _languageSessionService = languageSessionService;

  Future<void> selectLanguage(Language language) async {
    final sessionSettings = await _languageSessionService.getOrCreateSessionSettings(language);

    await scopeManagerService.createLanguageScope(sessionSettings);

    await navigationService.goToLanguageView(language);
  }

  void goToSettings() {
    navigationService.goToSettings();
  }
}
