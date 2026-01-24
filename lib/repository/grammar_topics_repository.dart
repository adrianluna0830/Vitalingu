import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/language_enum.dart';

@singleton
class GrammarTopicsRepository {
  final Database _db;
  final _store = intMapStoreFactory.store('grammar_topics');

  GrammarTopicsRepository(this._db);

  Future<List<GrammarTopic>> getAllGrammarTopicsSortedWithOrder(
      Language language) async {
    return _db.transaction((txn) async {
      final finder = Finder(
          filter: Filter.equals('language', language.name),
          sortOrders: [SortOrder('topicLearningOrder')]);
      final snapshots = await _store.find(txn, finder: finder);

      return snapshots.map((snapshot) {
        return GrammarTopic.fromJson(snapshot.value, snapshot.key);
      }).toList();
    });
  }

  Future<GrammarTopic?> getGrammarTopicByOrder(
      {required Language language, required int topicOrder}) async {
    final finder = Finder(
        filter: Filter.and([
      Filter.equals('language', language.name),
      Filter.equals('topicLearningOrder', topicOrder)
    ]));
    final snapshot = await _store.findFirst(_db, finder: finder);

    if (snapshot == null) {
      return null;
    }

    return GrammarTopic.fromJson(snapshot.value, snapshot.key);
  }

  Future<List<GrammarTopic?>> getManyGrammarTopics(
      Language language, List<int> learningOrders) async {
    return _db.transaction((txn) async {
      final finder = Finder(
          filter: Filter.and([
        Filter.equals('language', language.name),
        Filter.inList('topicLearningOrder', learningOrders)
      ]));
      final snapshots = await _store.find(txn, finder: finder);

      final topicsMap = {
        for (var snapshot in snapshots)
          snapshot.value['topicLearningOrder'] as int:
              GrammarTopic.fromJson(snapshot.value, snapshot.key)
      };

      return learningOrders.map((order) => topicsMap[order]).toList();
    });
  }

  Future<GrammarTopic?> getGrammarTopicById(int id) async {
    final record = await _store.record(id).get(_db);
    if (record == null) {
      return null;
    }
    return GrammarTopic.fromJson(record, id);
  }

  Future<GrammarTopic?> addGrammarTopic(GrammarTopic topic) async {
    final finder = Finder(
        filter: Filter.and([
      Filter.equals('language', topic.language.name),
      Filter.or([
        Filter.equals('topicLearningOrder', topic.topicLearningOrder),
        Filter.equals('topicTitle', topic.topicTitle)
      ])
    ]));

    var existing = await _store.findFirst(_db, finder: finder);

    if (existing != null) {
      return GrammarTopic.fromJson(existing.value, existing.key);
    }

    final key = await _store.add(_db, topic.toJson());
    topic.id = key;
    return topic;
  }

  Future<void> addGrammarTopics(List<GrammarTopic> topics) async {
    await _db.transaction((txn) async {
      for (final topic in topics) {
        final finder = Finder(
            filter: Filter.and([
          Filter.equals('language', topic.language.name),
          Filter.or([
            Filter.equals('topicCode', topic.topicCode),
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