import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:isar_plus/isar_plus.dart';
part 'grammar_topic.g.dart';
@collection
@Index(composite: ['grammarSubject', 'topicLearningOrder'])
class GrammarTopic {

  @Id() 
  int id = 0;
  int topicLearningOrder;
  CEFR cefrLevel;
  @Index()
  Language grammarLanguage;
  String grammarSubject;


  GrammarTopic({required this.grammarSubject, required this.topicLearningOrder, required this.cefrLevel, required this.grammarLanguage});
  
 
}