import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/language_enum.dart';
class GrammarTopic {

  int? id;
  int topicLearningOrder;
  CEFR cefrLevel;
  Language language;
  String topicTitle;


  GrammarTopic({this.id, required this.topicTitle, required this.topicLearningOrder, required this.cefrLevel, required this.language});
  
  Map<String, dynamic> toJson() {
    return {
      'topicLearningOrder': topicLearningOrder,
      'cefrLevel': cefrLevel.name,
      'language': language.name,
      'topicTitle': topicTitle,
    };
  }

  factory GrammarTopic.fromJson(Map<String, dynamic> json, int id) {
    return GrammarTopic(
      id: id,
      topicTitle: json['topicTitle'],
      topicLearningOrder: json['topicLearningOrder'],
      cefrLevel: CEFR.values.byName(json['cefrLevel']),
      language: Language.values.byName(json['language']),
    );
  }
}