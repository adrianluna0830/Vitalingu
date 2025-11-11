import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/word/english_word.dart';
import 'package:vitalingu/word/german_word.dart';

@injectable
class SelectLanguageViewModel extends ViewModelBase {

  final List<Language> languages = [
    Language(
        bcp47Code: "de-DE", nativeName: "Deutsch", languageWord: GermanWord()),
    Language(bcp47Code: "en-US", nativeName: "English", languageWord: EnglishWord()),
  ];

  SelectLanguageViewModel({required super.navigationService});

  void selectLanguage(Language language) {
    navigationService.goToLanguageView(language);
  }

    void goToSettings() {
    navigationService.goToSettings();
  }


}
