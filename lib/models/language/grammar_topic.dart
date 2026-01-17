import 'package:vitalingu/interfaces/i_identifiable.dart';
import 'package:vitalingu/models/language/cefr_enum.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';

class GrammarTopic extends IIdentifiable {
  final String topicDescriptionId;
  final List<String> topicDescriptions;
  final int topicOrder;
  final CEFR cefrLevel;
  final SupportedLanguagesBcp47 bcp47;
  
  @override
  String get id => '${bcp47.name}-$topicDescriptionId';

  GrammarTopic({required this.topicDescriptionId, required this.topicDescriptions, required this.cefrLevel, required this.bcp47, required this.topicOrder});
}