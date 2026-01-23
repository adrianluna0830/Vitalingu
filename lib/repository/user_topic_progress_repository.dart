import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:vitalingu/models/language/user_data/user_topic_progress.dart';

@singleton
class UserTopicProgressRepository {
  final Database _db;
  final _store = intMapStoreFactory.store('user_topic_progress');

  UserTopicProgressRepository(this._db);

  Future<UserTopicProgress> getOrCreate(int grammarTopicId) async {
    return await _db.transaction((txn) async {
      final finder = Finder(filter: Filter.equals('topicId', grammarTopicId));
      var existing = await _store.findFirst(txn, finder: finder);

      if (existing != null) {
        return UserTopicProgress.fromJson(existing.value, existing.key);
      } else {
        final newProgress = UserTopicProgress(topicId: grammarTopicId);
        final newKey = await _store.add(txn, newProgress.toJson());
        newProgress.id = newKey;
        return newProgress;
      }
    });
  }

  Future<UserTopicProgress?> update(UserTopicProgress progress) async {
    if (progress.id == null) {
      return null;
    }
    
    final updatedRecord = await _store.record(progress.id!).update(_db, progress.toJson());

    if (updatedRecord != null) {
      return UserTopicProgress.fromJson(updatedRecord, progress.id!);
    } else {
      return null;
    }
  }

  Future<List<UserTopicProgress>> getOrCreateMany(List<int> grammarTopicIds) async {
    return await _db.transaction((txn) async {
      final finder = Finder(filter: Filter.inList('topicId', grammarTopicIds));
      final existingSnapshots = await _store.find(txn, finder: finder);

      final existingProgressMap = <int, UserTopicProgress>{};
      for (final snapshot in existingSnapshots) {
        final progress = UserTopicProgress.fromJson(snapshot.value, snapshot.key);
        existingProgressMap[progress.topicId] = progress;
      }

      final results = <UserTopicProgress>[];

      for (final topicId in grammarTopicIds) {
        if (existingProgressMap.containsKey(topicId)) {
          results.add(existingProgressMap[topicId]!);
        } else {
          final newProgress = UserTopicProgress(topicId: topicId);
          final newKey = await _store.add(txn, newProgress.toJson());
          newProgress.id = newKey;
          results.add(newProgress);
        }
      }
      return results;
    });
  }
}
