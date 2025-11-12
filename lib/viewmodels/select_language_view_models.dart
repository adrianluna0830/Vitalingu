import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/register_languages.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {

  List<Language> get availableLanguages => LanguageRegistry.languages;

  SelectLanguageViewModel({
    required super.navigationService,
    required super.scopeManagerService,
  });

  Future<void> selectLanguage(Language language) async {
    if (!getIt.isRegistered<AppSettings>()) {
      await navigationService.goToSettings();
      return;
    }

    await scopeManagerService.createLanguageScope(language);

    await navigationService.goToLanguageView(language);
  }

  void goToSettings() {
    navigationService.goToSettings();
  }
}
