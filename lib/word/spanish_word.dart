import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vitalingu/word/word.dart';
part 'spanish_word.g.dart';
@JsonSerializable()
class SpanishWordDefinition extends WordDefinition {
  SpanishWordDefinition(); 

  @override
  Widget getDefinitionWidget(String word) {
    return Text('Definition of $word: $meaning');
  }

  factory SpanishWordDefinition.fromJson(Map<String, dynamic> json) =>
      _$SpanishWordDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$SpanishWordDefinitionToJson(this);
}
@JsonSerializable()
class SpanishWord extends Word<SpanishWordDefinition> {
    SpanishWord();
  static String jsonWordPrompt() {
    SpanishWord sampleWord = SpanishWord();
    sampleWord.definitions = [SpanishWordDefinition()];
    return sampleWord.toJson().toString();
  }

  static Word fromJsonStatic(String json) {
    return SpanishWord.fromJson(
        Map<String, dynamic>.from(jsonDecode(json)));
  }


  factory SpanishWord.fromJson(Map<String, dynamic> json) =>
      _$SpanishWordFromJson(json);


  Map<String, dynamic> toJson() => _$SpanishWordToJson(this);
}