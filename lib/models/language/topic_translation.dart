import 'package:vitalingu/models/language/language_enum.dart';
class TopicTranslation {
  int id = 0;
  String translation;
  Language translationLanguage;
  int topicId;

  TopicTranslation({required this.topicId, required this.translationLanguage, required this.translation}); 
}