import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';

class GrammarTopicUserData {
  
  double normalizedProgress = 0;
  final SupportedLanguagesBcp47 language;
  final int topicId;

  GrammarTopicUserData({required this.topicId, required this.language});
}