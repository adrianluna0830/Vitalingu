import 'package:injectable/injectable.dart';
import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/topic_translation.dart';
import 'package:vitalingu/models/language/language_enum.dart';

@singleton
class TopicTranslationsRepository 
{
  final Isar isar;

  TopicTranslationsRepository(this.isar);

  Future<TopicTranslation?> getTranslations(int topicId, Language translationLanguage) async
  {
      final translation = await isar.topicTranslations.where().topicIdEqualTo(topicId).translationLanguageEqualTo(translationLanguage).findFirstAsync();
    
    return translation;
  }

  Future<TopicTranslation?> addTranslation(TopicTranslation translation) async
  {
    bool alreadyExists =
        await isar.topicTranslations
            .where()
            .topicIdEqualTo(translation.topicId)
            .translationLanguageEqualTo(translation.translationLanguage)
            .findFirstAsync() !=
        null;

    if (alreadyExists) return null;

    await isar.writeAsync((isar) async {
      translation.id = isar.topicTranslations.autoIncrement();
      isar.topicTranslations.put(translation);
    });
    return translation;
  }
}