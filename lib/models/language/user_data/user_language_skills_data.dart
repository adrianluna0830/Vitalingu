import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/language_enum.dart';
part 'user_language_skills_data.g.dart';
@collection
class UserLanguageSkillsData {
  @Id() 
  int id = 0;
  Language language;
  double normalizedListeningProgress;
  double normalizedSpeakingProgress;
  double normalizedReadingProgress;
  double normalizedWritingProgress;

  UserLanguageSkillsData({required this.language, required this.normalizedListeningProgress, required this.normalizedSpeakingProgress, required this.normalizedReadingProgress, required this.normalizedWritingProgress});
}