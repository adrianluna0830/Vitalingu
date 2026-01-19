import 'package:injectable/injectable.dart';
import 'package:isar_plus/isar_plus.dart';
import 'package:vitalingu/models/language/user_data/user_topic_progress.dart';

@singleton
class UserTopicProgressRepository {
  final Isar isar;

  UserTopicProgressRepository(this.isar);

  Future<UserTopicProgress?> getUserTopicProgress(int topicId) async {
    final progress = await isar.userTopicProgress
        .where()
        .topicIdEqualTo(topicId)
        .findFirstAsync();
    return progress;
  }

  Future<UserTopicProgress?> addProgress(UserTopicProgress progress) async {
    bool alreadyExists =
        await isar.userTopicProgress
            .where()
            .topicIdEqualTo(progress.topicId)
            .findFirstAsync() !=
        null;

    if (alreadyExists) return null;

    await isar.writeAsync((isar) async {
      progress.id = isar.userTopicProgress.autoIncrement();
      isar.userTopicProgress.put(progress);
    });
    return progress;
  }

  Future<bool> updateProgress(UserTopicProgress progress) async {
    final existingProgress = await getUserTopicProgress(progress.topicId);
    if (existingProgress == null) {
      return false;
    }

    await isar.writeAsync((isar) async {
      isar.userTopicProgress.put(progress);
    });
    return true;
  }
}
