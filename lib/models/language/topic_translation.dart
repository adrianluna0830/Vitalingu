import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/language_enum.dart';
part 'topic_translation.g.dart';
@collection
class TopicTranslation {
  @Id() 
  int id = 0;
  String translation;
  Language translationLanguage;
  int topicId;

  TopicTranslation({required this.topicId, required this.translationLanguage, required this.translation}); 
}