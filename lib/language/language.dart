import 'package:vitalingu/word/word.dart';

class Language {
  final String bcp47Code;
  final String nativeName;
  final Word languageWord;

  Language({required this.bcp47Code, required this.nativeName, required this.languageWord});
}