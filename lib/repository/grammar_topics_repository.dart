import 'package:injectable/injectable.dart';
import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/language.dart';

@singleton
class GrammarTopicsRepository 
{
  final Isar isar;

  GrammarTopicsRepository(this.isar);

  Future<List<GrammarTopic>> getAllGrammarTopics(Language language) async {
    final topics =  await isar.grammarTopics.where().targetLanguageEqualTo(language).findAllAsync();
    return topics;
  }

  Future<GrammarTopic?> getGrammarTopic(Language language, int learningOrder) async
  {
    final topic = await isar.grammarTopics.where().targetLanguageEqualTo(language).topicLearningOrderEqualTo(learningOrder).findFirstAsync();
    return  topic;
  }

  Future<GrammarTopic?> addGrammarTopic(GrammarTopic topic) async
  {
    bool alreadyExists =
        await isar.grammarTopics
            .where()
            .targetLanguageEqualTo(topic.targetLanguage)
            .topicLearningOrderEqualTo(topic.topicLearningOrder)
            .or()
            .targetLanguageEqualTo(topic.targetLanguage)
            .topicSubjectEqualTo(topic.topicSubject)
            .findFirstAsync() !=
        null;

    if (alreadyExists) return null;

    await isar.writeAsync((isar) async {
      topic.id = isar.grammarTopics.autoIncrement();
      isar.grammarTopics.put(topic);
    });
    return topic;
  }
}