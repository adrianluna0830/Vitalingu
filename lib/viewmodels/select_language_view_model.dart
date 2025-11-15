import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/services/app_settings_service.dart';
import 'package:vitalingu/services/language_settings_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {
  final LanguageSettingsService _languageSessionService;
  final AppSettingsService _appSettingsService;
  List<Language> get availableLanguages => LanguageRegistry.languages;

  SelectLanguageViewModel({
    required LanguageSettingsService languageSessionService,
    required AppSettingsService appSettingsService,
    required super.navigationService,
    required super.scopeManagerService,
  }) : _languageSessionService = languageSessionService,
       _appSettingsService = appSettingsService;

  Future<void> selectLanguage(Language targetLanguage) async {
    final settings = await _appSettingsService.getSettings();
    if (settings == null) {
      throw Exception('App settings not found. Cannot proceed to language session.');
    }
    final languageSettings = await _languageSessionService.getOrCreateLanguageSettings(targetLanguage.bcp47Code);

    final nativeLanguage = settings.nativeLanguage;
    await scopeManagerService.createLanguageScope(nativeLanguage, targetLanguage, languageSettings, LanguageRegistry.getWordForLanguage( targetLanguage)!);

    await navigationService.goToLanguageView();
  }


  void goToSettings() {
    navigationService.goToSettings();
  }
}
