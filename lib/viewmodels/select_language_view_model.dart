import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/models/settings.dart';
import 'package:vitalingu/services/language_settings_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {
  final LanguageSettingsService _languageSettingsService;
  List<Language> get availableLanguages => LanguageRegistry.languages;

  final SessionTargetLanguage targetLanguage;
  final SessionWord sessionWord;

  SelectLanguageViewModel(
    this.targetLanguage,
    this.sessionWord, {
    required LanguageSettingsService languageSettingsService,
    required super.navigationService
  }) : _languageSettingsService = languageSettingsService;

  Future<void> selectLanguage(Language targetLanguage) async {
    this.targetLanguage.language = targetLanguage;
    this.targetLanguage.languageSettings = await getLanguageSettings(targetLanguage.bcp47Code);
    
    sessionWord.word = LanguageRegistry.getWordForLanguage(targetLanguage);
    sessionWord.fromJson = LanguageRegistry.getFromJsonForLanguage(targetLanguage);
    
    await navigationService.goToLanguageView();
  }

  Future<LanguageSettings> getLanguageSettings(String bcp47Code)  async{
    return await _languageSettingsService.getOrCreateLanguageSettings(bcp47Code);
  }

  Future<void> saveLanguageSettings(LanguageSettings settings, String bcp47Code) async
  {
    await _languageSettingsService.saveSettings(bcp47Code, settings);
  }

  void goToSettings() {
    navigationService.goToSettings();
  }
}
