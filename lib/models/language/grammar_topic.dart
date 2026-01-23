import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/language_enum.dart';
class GrammarTopic {

  int id = 0;
  int topicLearningOrder;
  CEFR cefrLevel;
  Language language;
  String topicTitle;


  GrammarTopic({required this.topicTitle, required this.topicLearningOrder, required this.cefrLevel, required this.language});
  
 
}