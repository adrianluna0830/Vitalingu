import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_translation.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';

@singleton
class TopicTranslationsRepository {
  final Database _db;
  final GrammarTopicsRepository _grammarTopicsRepository;
  final _store = intMapStoreFactory.store('topic_translations');

  TopicTranslationsRepository(this._db, this._grammarTopicsRepository);

  Future<List<TopicTranslation>> getTranslationsByTopicCode(
      String topicCode) async {
    final finder = Finder(filter: Filter.equals('topicCode', topicCode));
    final snapshots = await _store.find(_db, finder: finder);

    return snapshots.map((snapshot) {
      return TopicTranslation.fromJson(snapshot.value, snapshot.key);
    }).toList();
  }

  Future<List<TopicTranslation>> getTranslationsByTopicCodes(
      List<String> topicCodes) async {
    final finder = Finder(filter: Filter.inList('topicCode', topicCodes));
    final snapshots = await _store.find(_db, finder: finder);

    return snapshots.map((snapshot) {
      return TopicTranslation.fromJson(snapshot.value, snapshot.key);
    }).toList();
  }

  Future<List<TopicTranslation>> getAllTranslationsForLanguage(
      Language language) async {
    final finder =
        Finder(filter: Filter.equals('translationLanguage', language.name));
    final snapshots = await _store.find(_db, finder: finder);

    return snapshots.map((snapshot) {
      return TopicTranslation.fromJson(snapshot.value, snapshot.key);
    }).toList();
  }

  Future<TopicTranslation?> addTranslation(TopicTranslation translation) async {
    final finder = Finder(
        filter: Filter.and([
      Filter.equals('topicCode', translation.topicCode),
      Filter.equals('translationLanguage', translation.translationLanguage.name)
    ]));

    var existing = await _store.findFirst(_db, finder: finder);

    if (existing != null) {
      return TopicTranslation.fromJson(existing.value, existing.key);
    }

    final key = await _store.add(_db, translation.toJson());
    translation.id = key;
    return translation;
  }

  Future<void> addTranslations(List<TopicTranslation> translations) async {
    await _db.transaction((txn) async {
      for (final translation in translations) {
        final finder = Finder(
            filter: Filter.and([
          Filter.equals('topicCode', translation.topicCode),
          Filter.equals(
              'translationLanguage', translation.translationLanguage.name)
        ]));

        var existing = await _store.findFirst(txn, finder: finder);

        if (existing == null) {
          await _store.add(txn, translation.toJson());
        }
      }
    });
  }

  Future<TopicTranslation?> addTranslationByLearningOrder(
      {required Language topicLanguage,
      required int topicLearningOrder,
      required Language translationLanguage,
      required String translationText}) async {
    final grammarTopic = await _grammarTopicsRepository.getGrammarTopicByOrder(
        language: topicLanguage, topicOrder: topicLearningOrder);

    if (grammarTopic == null) {
      return null;
    }

    final translation = TopicTranslation(
      topicCode: grammarTopic.topicCode,
      translationLanguage: translationLanguage,
      translation: translationText,
    );

    return addTranslation(translation);
  }

  Future<List<TopicTranslation>> addManyTranslationsByLearningOrder(
      {required Language topicLanguage,
      required List<Map<String, dynamic>> translationsData}) async {
    final grammarTopicList = await _grammarTopicsRepository
        .getAllGrammarTopicsSortedWithOrder(topicLanguage);
    final Map<int, String> learningOrderToTopicCode = {
      for (var topic in grammarTopicList)
        topic.topicLearningOrder: topic.topicCode
    };

    final List<TopicTranslation> newTranslations = [];
    for (final data in translationsData) {
      final order = data['topicLearningOrder'] as int;
      final translationLang =
          Language.values.byName(data['translationLanguage']);
      final text = data['translation'] as String;

      if (learningOrderToTopicCode.containsKey(order)) {
        newTranslations.add(TopicTranslation(
          topicCode: learningOrderToTopicCode[order]!,
          translationLanguage: translationLang,
          translation: text,
        ));
      }
    }

    await addTranslations(newTranslations);
    return newTranslations;
  }
}
