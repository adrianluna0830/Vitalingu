import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';

class UserLanguageSkillsData {
  final Languages language;
  double normalizedListeningProgress = 0;
  double normalizedSpeakingProgress = 0;
  double normalizedReadingProgress = 0;
  double normalizedWritingProgress = 0;

  UserLanguageSkillsData({required this.language});
}