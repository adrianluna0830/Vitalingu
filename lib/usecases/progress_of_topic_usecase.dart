import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/grammar_topic.dart';
import 'package:vitalingu/models/language/language.dart';
import 'package:vitalingu/models/language/user_data/user_topic_progress.dart';
import 'package:vitalingu/repository/grammar_topics_repository.dart';
import 'package:vitalingu/repository/user_topic_progress_repository.dart';

@injectable
class ProgressOfTopicUsecase {
  final UserTopicProgressRepository userTopicProgressRepository;
  final GrammarTopicsRepository grammarTopicsRepository;

  ProgressOfTopicUsecase({required this.userTopicProgressRepository, required this.grammarTopicsRepository});

  Future<UserTopicProgress> getOrCreateUserTopicProgress(int topicId) async {
    var progress = await userTopicProgressRepository.getUserTopicProgress(topicId);
    if (progress != null) {
      return progress;
    }

    progress = UserTopicProgress(topicId: topicId);
    await userTopicProgressRepository.addProgress(progress);
    return progress;
  }

}