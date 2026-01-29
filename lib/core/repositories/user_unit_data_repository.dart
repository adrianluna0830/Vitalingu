import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:vitalingu/core/models/language/user_data/user_unit_data.dart';

@singleton
class UserUnitDataRepository {
  final Database _db;
  final _store = intMapStoreFactory.store('user_topic_data');

  UserUnitDataRepository(this._db);

  Future<UserUnitData> getOrCreate(String unitCode) async {
    return await _db.transaction((txn) async {
      final finder = Finder(filter: Filter.equals('unitCode', unitCode));
      var existing = await _store.findFirst(txn, finder: finder);

      if (existing != null) {
        return UserUnitData.fromJson(existing.value, existing.key);
      } else {
        final newProgress = UserUnitData(unitCode: unitCode);
        final newKey = await _store.add(txn, newProgress.toJson());
        newProgress.id = newKey;
        return newProgress;
      }
    });
  }

  Future<UserUnitData?> get(int id) async {
    final record = await _store.record(id).get(_db);
    if (record != null) {
      return UserUnitData.fromJson(record, id);
    }
    return null;
  }

  Future<UserUnitData?> update(UserUnitData progress) async {
    if (progress.id == null) {
      return null;
    }

    final updatedRecord =
        await _store.record(progress.id!).update(_db, progress.toJson());

    if (updatedRecord != null) {
      return UserUnitData.fromJson(updatedRecord, progress.id!);
    } else {
      return null;
    }
  }

  Future<List<UserUnitData>> getOrCreateMany(List<String> unitCodes) async {
    final finder = Finder(filter: Filter.inList('unitCode', unitCodes));
    final existingSnapshots = await _store.find(_db, finder: finder);

    final existingProgressMap = <String, UserUnitData>{};
    for (final snapshot in existingSnapshots) {
      final progress = UserUnitData.fromJson(snapshot.value, snapshot.key);
      existingProgressMap[progress.unitCode] = progress;
    }

    final results = <UserUnitData>[];

    for (final unitCode in unitCodes) {
      if (existingProgressMap.containsKey(unitCode)) {
        results.add(existingProgressMap[unitCode]!);
      } else {
        final newProgress = UserUnitData(unitCode: unitCode);
        final newKey = await _store.add(_db, newProgress.toJson());
        newProgress.id = newKey;
        results.add(newProgress);
      }
    }
    return results;
  }

  Future<List<UserUnitData>?> updateMany(
      List<UserUnitData> progresses) async {
    try {
      final updatedList = await _db.transaction((txn) async {
        final List<UserUnitData> result = [];
        for (final progress in progresses) {
          if (progress.id == null) {
            throw ArgumentError(
                'One of the UserUnitData objects has a null ID.');
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
