import 'package:vitalingu/models/language/language_enum.dart';

class TopicTranslation {
  int? id;
  String translation;
  Language translationLanguage;
  String topicCode;

  TopicTranslation(
      {this.id,
      required this.topicCode,
      required this.translationLanguage,
      required this.translation});

  Map<String, dynamic> toJson() {
    return {
      'topicCode': topicCode,
      'translationLanguage': translationLanguage.name,
      'translation': translation,
    };
  }

  factory TopicTranslation.fromJson(Map<String, dynamic> json, int id) {
    return TopicTranslation(
      id: id,
      topicCode: json['topicCode'],
      translationLanguage: Language.values.byName(json['translationLanguage']),
      translation: json['translation'],
    );
  }
}