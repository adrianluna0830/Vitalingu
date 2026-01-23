import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/language_enum.dart';

@singleton
class GrammarTopicsRepository {
  final Database _db;
  final _store = intMapStoreFactory.store('grammar_topics');

  GrammarTopicsRepository(this._db);

  Future<List<GrammarTopic>> getAllGrammarTopics(Language language) async {
    final finder = Finder(
        filter: Filter.equals('language', language.name),
        sortOrders: [SortOrder('topicLearningOrder')]);
    final snapshots = await _store.find(_db, finder: finder);

    return snapshots.map((snapshot) {
      return GrammarTopic.fromJson(snapshot.value, snapshot.key);
    }).toList();
  }

  Future<GrammarTopic?> getGrammarTopic(
      Language language, int learningOrder) async {
    final finder = Finder(
        filter: Filter.and([
      Filter.equals('language', language.name),
      Filter.equals('topicLearningOrder', learningOrder)
    ]));
    final snapshot = await _store.findFirst(_db, finder: finder);

    if (snapshot == null) {
      return null;
    }

    return GrammarTopic.fromJson(snapshot.value, snapshot.key);
  }

  Future<GrammarTopic?> addGrammarTopic(GrammarTopic topic) async {
    return await _db.transaction((txn) async {
      final finder = Finder(
          filter: Filter.and([
        Filter.equals('language', topic.language.name),
        Filter.or([
          Filter.equals('topicLearningOrder', topic.topicLearningOrder),
          Filter.equals('topicTitle', topic.topicTitle)
        ])
      ]));

      var existing = await _store.findFirst(txn, finder: finder);

      if (existing != null) {
        return GrammarTopic.fromJson(existing.value, existing.key);
      }

      final key = await _store.add(txn, topic.toJson());
      topic.id = key;
      return topic;
    });
  }

  Future<void> addGrammarTopics(List<GrammarTopic> topics) async {
    await _db.transaction((txn) async {
      for (final topic in topics) {
        final finder = Finder(
            filter: Filter.and([
          Filter.equals('language', topic.language.name),
          Filter.or([
            Filter.equals('topicLearningOrder', topic.topicLearningOrder),
            Filter.equals('topicTitle', topic.topicTitle)
          ])
        ]));

        var existing = await _store.findFirst(txn, finder: finder);

        if (existing == null) {
          await _store.add(txn, topic.toJson());
        }
      }
    });
  }
}