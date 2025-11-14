import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/services/app_settings_service.dart';
import 'package:vitalingu/services/language_settings_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {
  final LanguageSettingsService _languageSessionService;

  List<Language> get availableLanguages => LanguageRegistry.languages;

  SelectLanguageViewModel({
    required LanguageSettingsService languageSessionService,
    required super.navigationService,
    required super.scopeManagerService,
  }) : _languageSessionService = languageSessionService;

  Future<void> selectLanguage(Language targetLanguage) async {
    var settings = await getIt<AppSettingsService>().getSettings();
    if (settings == null) {
      throw Exception('App settings not found. Cannot proceed to language session.');
    }
    final languageSettings = await _languageSessionService.getOrCreateLanguageSettings(targetLanguage.bcp47Code);

    final nativeLanguage = settings.nativeLanguage;
    await scopeManagerService.createLanguageScope(nativeLanguage, targetLanguage, languageSettings, LanguageRegistry.getWordForLanguage( targetLanguage)!);

    await navigationService.goToLanguageView(targetLanguage);
  }

  void goToSettings() {
    navigationService.goToSettings();
  }
}
