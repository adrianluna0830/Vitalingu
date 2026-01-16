import 'package:vitalingu/models/language/cefr_enum.dart';

class GrammarTopic {
  final String topicDescription;
  final List<String> subtopicDescriptions;
  final CEFR level;

  GrammarTopic({required this.topicDescription, required this.subtopicDescriptions, required this.level});
}