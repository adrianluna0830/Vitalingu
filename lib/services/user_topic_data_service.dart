import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/language_enum.dart';
import 'package:vitalingu/models/language/topic_learning_status_enum.dart';
import 'package:vitalingu/models/language/user_data/user_topic_data.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';
import 'package:vitalingu/repository/user_topic_data_repository.dart';

import 'package:vitalingu/models/language/grammar_topic.dart';

@injectable
class UserTopicDataService {
  final UserTopicDataRepository _userTopicDataRepository;
  final GrammarTopicsRepository _grammarTopicsRepository;

  UserTopicDataService(
    this._userTopicDataRepository,
    this._grammarTopicsRepository,
  );

  Future<UserTopicData> getFromGrammarTopicId(int grammarTopicId) {
    return _userTopicDataRepository.getOrCreate(grammarTopicId);
  }

  Future<List<UserTopicData>> getManyFromGrammarTopicIds(
    List<int> grammarTopicIds,
  ) {
    return _userTopicDataRepository.getOrCreateMany(grammarTopicIds);
  }

  Future<UserTopicData?> getFromTopicOrder({
    required Language language,
    required int topicOrder,
  }) async {
    final grammarTopic = await _grammarTopicsRepository.getGrammarTopicByOrder(
      language: language,
      topicOrder: topicOrder,
    );

    if (grammarTopic == null) {
      return null;
    }

    return _userTopicDataRepository.getOrCreate(grammarTopic.id!);
  }

  Future<List<(GrammarTopic, UserTopicData)>> getGrammarTopicsWithDataSorted(
      Language language) async {
    final grammarTopics = await _grammarTopicsRepository
        .getAllGrammarTopicsSortedWithOrder(language);
    final topicIds = grammarTopics.map((e) => e.id!).toList();
    final userTopicData = await getManyFromGrammarTopicIds(topicIds);

    final userTopicDataMap = {
      for (var data in userTopicData) data.topicId: data
    };

    final result = <(GrammarTopic, UserTopicData)>[];
    for (var topic in grammarTopics) {
      final data = userTopicDataMap[topic.id];
      if (data != null) {
        result.add((topic, data));
      }
    }

    return result;
  }

  Future<void> updateTopicStatus(int topicId, TopicLearningStatus newStatus) async {
    final userTopicData = await getFromGrammarTopicId(topicId);
    userTopicData.topicLearningStatus = newStatus;
    await _userTopicDataRepository.update(userTopicData);
  }
}
