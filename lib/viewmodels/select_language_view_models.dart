import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
import 'package:vitalingu/word/german_word.dart';

class SelectLanguageViewModel extends ViewModelBase {

  final List<Language> languages = [
    Language(
        bcp47Code: "de-DE", nativeName: "Deutsch", languageWord: GermanWord())
  ];

  SelectLanguageViewModel({required super.navigationService});
}
