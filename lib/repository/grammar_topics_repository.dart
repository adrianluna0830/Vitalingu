// import 'package:injectable/injectable.dart';
// import 'package:isar_plus/isar_plus.dart';
// import 'package:vitalingu/models/language/grammar_topic.dart';
// import 'package:vitalingu/models/language/language_enum.dart';

// @singleton
// class GrammarTopicsRepository 
// {
//   final Isar isar;

//   GrammarTopicsRepository(this.isar);

//   Future<List<GrammarTopic>> getAllGrammarTopics(Language language) async {
//     final topics =  await isar.grammarTopics.where().languageEqualTo(language).findAllAsync();
//     return topics;
//   }

//   Future<GrammarTopic?> getGrammarTopic(Language language, int learningOrder) async
//   {
//     final topic = await isar.grammarTopics.where().languageEqualTo(language).topicLearningOrderEqualTo(learningOrder).findFirstAsync();
//     return  topic;
//   }

//   Future<GrammarTopic?> addGrammarTopic(GrammarTopic topic) async
//   {
//     bool alreadyExists =
//         await isar.grammarTopics
//             .where()
//             .languageEqualTo(topic.language)
//             .topicLearningOrderEqualTo(topic.topicLearningOrder)
//             .or()
//             .languageEqualTo(topic.language)
//             .topicTitleEqualTo(topic.topicTitle)
//             .findFirstAsync() !=
//         null;

//     if (alreadyExists) return null;

//     await isar.writeAsync((isar) async {
//       topic.id = isar.grammarTopics.autoIncrement();
//       isar.grammarTopics.put(topic);
//     });
//     return topic;
//   }
// }