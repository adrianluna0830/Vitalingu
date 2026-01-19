import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/language.dart';
part 'user_language_skills_data.g.dart';
@collection
class UserLanguageSkillsData {
  @Id() 
  int id = 0;
  Language language;
  double normalizedListeningProgress = 0;
  double normalizedSpeakingProgress = 0;
  double normalizedReadingProgress = 0;
  double normalizedWritingProgress = 0;

  UserLanguageSkillsData({required this.language});
}