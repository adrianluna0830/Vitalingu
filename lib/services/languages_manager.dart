import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/word/german_word.dart';
@singleton
List<Language> languages = [
  Language(bcp47Code: "de-DE", nativeName: "Deutsch", languageWord: GermanWord() ),
];