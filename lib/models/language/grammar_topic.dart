import 'package:vitalingu/models/language/cefr_enum.dart';

class GrammarTopic {
  final String topicDescriptionId;
  final List<String> subtopicDetails;
  final CEFR cefrLevel;

  GrammarTopic({required this.topicDescriptionId, required this.subtopicDetails, required this.cefrLevel});
}