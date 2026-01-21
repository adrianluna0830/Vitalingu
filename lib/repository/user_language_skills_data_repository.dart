import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/user_data/user_language_skills_data.dart';

class UserLanguageSkillsDataRepository {
    final Isar isar;

  UserLanguageSkillsDataRepository({required this.isar});

  Future<UserLanguageSkillsData?> getUserLanguageSkillsData(Language language) async {
    final data = await isar.userLanguageSkillsDatas
        .where()
        .languageEqualTo(language)
        .findFirstAsync();
    return data;
  }

  Future<UserLanguageSkillsData?> addUserLanguageSkillsData(UserLanguageSkillsData data) async {
    bool alreadyExists =
        await isar.userLanguageSkillsDatas
            .where()
            .languageEqualTo(data.language)
            .findFirstAsync() !=
        null;

    if (alreadyExists) return null;
    
    await isar.writeAsync((isar) async {
      data.id = isar.userLanguageSkillsDatas.autoIncrement();
      isar.userLanguageSkillsDatas.put(data);
    });
    return data;
  }

    Future<bool> updateSkillsData(UserLanguageSkillsData data) async {
    final existingData = await getUserLanguageSkillsData(data.language);
    if (existingData == null) {
      return false;
    }

    await isar.writeAsync((isar) async {
      data.id = isar.userLanguageSkillsDatas.autoIncrement();
      isar.userLanguageSkillsDatas.put(data);
    });
    return true;
  }
}