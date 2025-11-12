import 'package:injectable/injectable.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {

  final List<Language> availableLanguages = getIt.findAll<Language>();

  SelectLanguageViewModel({required super.navigationService});

  void selectLanguage(Language language) {

    if (getIt.hasScope('language-session')) {
      getIt.popScope();
    }

    getIt.pushNewScope(
      scopeName: "language-session",
      init: (getIt) {
        getIt.registerSingleton<Language>(language);
      },
    );

    navigationService.goToLanguageView(language);
  }

  void goToSettings() {
    navigationService.goToSettings();
  }
}
