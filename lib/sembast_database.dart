import 'package:sembast/sembast_io.dart';
import 'package:vitalingu/database_interface.dart';

class SembastDatabase implements DatabaseInterface<String, String> {
  Database? _db;
  late final StoreRef<String, String> _store;
  final String _dbPath;
  final String _storeName;

  SembastDatabase({
    required String dbPath,
    String storeName = 'main_store',
  }) : _dbPath = dbPath, _storeName = storeName {
    _store = StoreRef<String, String>(_storeName);
  }

  @override
  Future<void> open() async {
    if (_db != null) return;
    _db = await databaseFactoryIo.openDatabase(_dbPath);
  }

  @override
  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _db = null;
    }
  }

  @override
  Future<void> saveItem(String item, String key) async {
    if (_db == null) throw StateError('Database not opened');
    await _store.record(key).put(_db!, item);
  }

  @override
  Future<String?> getItem(String key) async {
    if (_db == null) throw StateError('Database not opened');
    return await _store.record(key).get(_db!);
  }

  @override
  Future<void> deleteItem(String key) async {
    if (_db == null) throw StateError('Database not opened');
    await _store.record(key).delete(_db!);
  }

  @override
  Future<List<String>> getAllItems() async {
    if (_db == null) throw StateError('Database not opened');
    final records = await _store.find(_db!);
    return records.map((snapshot) => snapshot.value).toList();
  }

  @override
  Future<void> clearDatabase() async {
    if (_db == null) throw StateError('Database not opened');
    await _store.delete(_db!);
  }
}