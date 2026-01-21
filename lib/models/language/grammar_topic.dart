import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:isar_plus/isar_plus.dart';
part 'grammar_topic.g.dart';
@collection
@Index(composite: ['topicTitle', 'topicLearningOrder'])
class GrammarTopic {

  @Id() 
  int id = 0;
  int topicLearningOrder;
  CEFR cefrLevel;
  @Index()
  Language language;
  String topicTitle;


  GrammarTopic({required this.topicTitle, required this.topicLearningOrder, required this.cefrLevel, required this.language});
  
 
}