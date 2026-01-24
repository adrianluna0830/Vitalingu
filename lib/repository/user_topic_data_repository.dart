import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:vitalingu/models/language/user_data/user_topic_data.dart';

@singleton
class UserTopicDataRepository {
  final Database _db;
  final _store = intMapStoreFactory.store('user_topic_data');

  UserTopicDataRepository(this._db);

  Future<UserTopicData> getOrCreate(String topicCode) async {
    return await _db.transaction((txn) async {
      final finder = Finder(filter: Filter.equals('topicCode', topicCode));
      var existing = await _store.findFirst(txn, finder: finder);

      if (existing != null) {
        return UserTopicData.fromJson(existing.value, existing.key);
      } else {
        final newProgress = UserTopicData(topicCode: topicCode);
        final newKey = await _store.add(txn, newProgress.toJson());
        newProgress.id = newKey;
        return newProgress;
      }
    });
  }

  Future<UserTopicData?> get(int id) async {
    final record = await _store.record(id).get(_db);
    if (record != null) {
      return UserTopicData.fromJson(record, id);
    }
    return null;
  }

  Future<UserTopicData?> update(UserTopicData progress) async {
    if (progress.id == null) {
      return null;
    }

    final updatedRecord =
        await _store.record(progress.id!).update(_db, progress.toJson());

    if (updatedRecord != null) {
      return UserTopicData.fromJson(updatedRecord, progress.id!);
    } else {
      return null;
    }
  }

  Future<List<UserTopicData>> getOrCreateMany(List<String> topicCodes) async {
    final finder = Finder(filter: Filter.inList('topicCode', topicCodes));
    final existingSnapshots = await _store.find(_db, finder: finder);

    final existingProgressMap = <String, UserTopicData>{};
    for (final snapshot in existingSnapshots) {
      final progress = UserTopicData.fromJson(snapshot.value, snapshot.key);
      existingProgressMap[progress.topicCode] = progress;
    }

    final results = <UserTopicData>[];

    for (final topicCode in topicCodes) {
      if (existingProgressMap.containsKey(topicCode)) {
        results.add(existingProgressMap[topicCode]!);
      } else {
        final newProgress = UserTopicData(topicCode: topicCode);
        final newKey = await _store.add(_db, newProgress.toJson());
        newProgress.id = newKey;
        results.add(newProgress);
      }
    }
    return results;
  }

  Future<List<UserTopicData>?> updateMany(
      List<UserTopicData> progresses) async {
    try {
      final updatedList = await _db.transaction((txn) async {
        final List<UserTopicData> result = [];
        for (final progress in progresses) {
          if (progress.id == null) {
            throw ArgumentError(
                'One of the UserTopicData objects has a null ID.');
          }
          await _store.record(progress.id!).update(txn, progress.toJson());
          result.add(progress);
        }
        return result;
      });
      return updatedList;
    } catch (e) {
      return null;
    }
  }
}
