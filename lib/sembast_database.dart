import 'package:sembast/sembast.dart';
import 'package:vitalingu/database_interface.dart';

class SembastDatabase implements DatabaseInterface<String, String> {
  final Database _db;
  late final StoreRef<String, String> _store;
  final String _storeName;

  SembastDatabase({
    required Database database,
    required String storeName,
  }) : _db = database, _storeName = storeName {
    _store = StoreRef<String, String>(_storeName);
  }

  @override
  Future<void> open() async {
    // La base de datos ya está abierta, no se necesita hacer nada
  }

  @override
  Future<void> close() async {
    // No cerramos la base de datos aquí porque es compartida
    // La base de datos se cerrará cuando se cierre GetIt
  }

  @override
  Future<void> saveItem(String item, String key) async {
    await _store.record(key).put(_db, item);
  }

  @override
  Future<String?> getItem(String key) async {
    return await _store.record(key).get(_db);
  }

  @override
  Future<void> deleteItem(String key) async {
    await _store.record(key).delete(_db);
  }

  @override
  Future<List<String>> getAllItems() async {
    final records = await _store.find(_db);
    return records.map((snapshot) => snapshot.value).toList();
  }

  @override
  Future<void> clearDatabase() async {
    await _store.delete(_db);
  }
}