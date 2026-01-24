import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';

@singleton
class GetGrammarTopicFromUserTopicDataUseCase {
  final GrammarTopicsRepository _grammarTopicsRepository;

  GetGrammarTopicFromUserTopicDataUseCase(
    this._grammarTopicsRepository,
  );

  Future<GrammarTopic?> call(int userTopicProgressId) async {
    return _grammarTopicsRepository.getGrammarTopicById(userTopicProgressId);
  }
}
