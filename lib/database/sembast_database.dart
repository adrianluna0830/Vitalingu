import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:vitalingu/interfaces/database_interface.dart';

@LazySingleton(as: DatabaseInterface)
class SembastDatabase implements DatabaseInterface<String, String> {
  final Database database;
  final String storeName;
  late final StoreRef<String, String> _store;

  SembastDatabase({
    required this.database,
    required this.storeName,
  }) {
    _store = StoreRef<String, String>(storeName);
  }

  @override
  Future<void> saveItem(String value, String key) async {
    await _store.record(key).put(database, value);
  }

  @override
  Future<String?> getItem(String key) async {
    return await _store.record(key).get(database);
  }

  @override
  Future<void> deleteItem(String key) async {
    await _store.record(key).delete(database);
  }

  @override
  Future<void> clearAll() async {
    await _store.delete(database);
  }
}