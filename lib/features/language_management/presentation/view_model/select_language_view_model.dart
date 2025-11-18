import 'package:injectable/injectable.dart';
import 'package:vitalingu/features/language_management/data/model/language.dart';
import 'package:vitalingu/features/language_management/data/model/language_settings.dart';
import 'package:vitalingu/features/settings/data/model/settings.dart';
import 'package:vitalingu/core/services/language_settings_service.dart';
import 'package:vitalingu/core/base/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {
  final LanguageSettingsService _languageSettingsService;
  List<Language> get availableLanguages => LanguageRegistry.languages;

  final SessionTargetLanguage targetLanguage;

  SelectLanguageViewModel(
    this.targetLanguage, {
    required LanguageSettingsService languageSettingsService,
    required super.navigationService
  }) : _languageSettingsService = languageSettingsService;

  Future<void> selectLanguage(Language targetLanguage) async {
    this.targetLanguage.language = targetLanguage;
    this.targetLanguage.languageSettings = await getLanguageSettings(targetLanguage.bcp47Code);

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

  Future<void> playVoice(String voiceCode) async {
    throw UnimplementedError('playVoice not yet implemented');
  }

  List<String> getAvailableVoices(String bcp47Code) {
    final language = LanguageRegistry.getLanguageByCode(bcp47Code);
    return language?.voices ?? [];
  }
}

