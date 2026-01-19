import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/language.dart';
import 'package:isar_plus/isar_plus.dart';
part 'grammar_topic.g.dart';
@collection
@Index(composite: ['topicSubject', 'topicLearningOrder'])
class GrammarTopic {

  @Id() 
  int id = 0;
  int topicLearningOrder;
  CEFR cefrLevel;
  @Index()
  Language targetLanguage;
  String topicSubject;


  GrammarTopic({required this.topicSubject, required this.topicLearningOrder, required this.cefrLevel, required this.targetLanguage});
  
 
}