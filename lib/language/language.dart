import 'package:vitalingu/word/word.dart';

class Language {
  final String bcp47Code;
  final String nativeName;
  final Word languageWord;

  const Language({
    required this.bcp47Code,
    required this.nativeName,
    required this.languageWord,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Language && other.bcp47Code == bcp47Code;
  }

  @override
  int get hashCode => bcp47Code.hashCode;
}