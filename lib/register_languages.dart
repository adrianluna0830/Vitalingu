import 'package:vitalingu/injection.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/word/english_word.dart';
import 'package:vitalingu/word/german_word.dart';

void registerLanguages()
{
  getIt.registerSingleton<Language>(Language(bcp47Code: "en-US", nativeName: "English", languageWord: EnglishWord()),instanceName: "en-US");
    getIt.registerSingleton<Language>(Language(bcp47Code: "de-DE", nativeName: "German", languageWord: GermanWord()),instanceName: "de-DE");
}