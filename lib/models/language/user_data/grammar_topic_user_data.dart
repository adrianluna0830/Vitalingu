import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';

class GrammarTopicUserData {
  double currentLocalMastery = 0;
  double globalMastery = 0;
  List<double> currentLocalMasteryHistory = [];

  final SupportedLanguagesBcp47 languageBcp47;
  final String topicId;

  GrammarTopicUserData({required this.topicId, required this.languageBcp47});
}