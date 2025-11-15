import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'database_interface.dart';

class SembastDatabase<T> implements DatabaseInterface<T> {
  final Map<String, dynamic> Function(T) toJson;
  final T Function(Map<String, dynamic>) fromJson;
  final StoreRef<String, dynamic> _store;
  Database? _db;

  SembastDatabase._({
    required this.toJson,
    required this.fromJson,
    required String storeName,
  }) : _store = StoreRef<String, dynamic>(storeName);

  static Future<SembastDatabase<T>> create<T>({
    required Map<String, dynamic> Function(T) toJson,
    required T Function(Map<String, dynamic>) fromJson,
    String? storeName,
  }) async {
    final finalStoreName = storeName ?? T.toString().toLowerCase();
    final instance = SembastDatabase._(
      toJson: toJson,
      fromJson: fromJson,
      storeName: finalStoreName,
    );
    await instance._init();
    return instance;
  }

  Database get db {
    if (_db == null) throw StateError('Database not initialized');
    return _db!;
  }

  Future<void> _init() async {
    if (_db != null) return;
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = join(dir.path, 'app_database.db');
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }

  @override
  Future<void> save(String key, T value) async {
    await _store.record(key).put(db, toJson(value));
  }

  @override
  Future<T?> get(String key) async {
    final data = await _store.record(key).get(db);
    if (data == null) return null;
    if (data is Map<String, dynamic>) {
      return fromJson(data);
    }
    if (data is Map) {
      return fromJson(Map<String, dynamic>.from(data));
    }
    throw StateError('Stored data is not a Map: ${data.runtimeType}');
  }

  @override
  Future<void> delete(String key) async {
    await _store.record(key).delete(db);
  }

  @override
  Future<void> deleteAll() async {
    await _store.delete(db);
  }

  @override
  Future<List<T>> getAll() async {
    final records = await _store.find(db);
    return records.map((record) {
      final value = record.value;
      if (value is Map<String, dynamic>) {
        return fromJson(value);
      }
      if (value is Map) {
        return fromJson(Map<String, dynamic>.from(value));
      }
      throw StateError('Stored data is not a Map: ${value.runtimeType}');
    }).toList();
  }

  @override
  Future<int> count() async {
    return await _store.count(db);
  }

  @override
  Future<void> close() async {
    await _db?.close();
    _db = null;
  }
}