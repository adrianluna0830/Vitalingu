import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
part 'word.g.dart';
@JsonSerializable()
class WordExample {
  String untranslatedExample =
      "A untranslated sentence example of the word in the target language";
  String translatedExample =
      "The same untranslated sentence translated to the specified native language";
factory WordExample.fromJson(Map<String, dynamic> json) =>
      _$WordExampleFromJson(json);

  Map<String, dynamic> toJson() => _$WordExampleToJson(this);
  WordExample();
}

abstract class WordDefinition {
  String meaning = "Meaning of this word in this specific context";
  String partOfSpeech = "Part of speech of the word in this specific context";
  List<WordExample> examples = [WordExample()];

  Widget getDefinitionWidget(String word);
}

abstract class Word<T extends WordDefinition> {
  String wordLema = "Base form of the word";
  List<T> definitions = [];

  

  List<Widget> getWordWidgets() {
    return definitions
        .map((definition) => definition.getDefinitionWidget(wordLema))
        .toList();
  }
}
