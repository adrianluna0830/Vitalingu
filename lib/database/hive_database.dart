import 'package:hive_ce/hive.dart';
import 'package:vitalingu/interfaces/database_interface.dart';

class HiveDatabase<K, V> implements DatabaseInterface<K, V> {
  late Box<V> _box;
  final String _boxName;
  static bool _isInitialized = false;

  HiveDatabase._(this._boxName);

  static Future<HiveDatabase<K, V>> create<K, V>({String? boxName}) async {
    final instance = HiveDatabase<K, V>._(boxName ?? '${V.toString()}_box');
    await instance.initialize();
    return instance;
  }

  @override
  Future<void> initialize() async {
    if (!_isInitialized) {
      Hive.init('hive_database');
      _isInitialized = true;
    }
    
    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox<V>(_boxName);
    } else {
      _box = Hive.box<V>(_boxName);
    }
  }

  @override
  Future<void> clearAll() async {
    await _box.clear();
  }

  @override
  Future<void> deleteItem(K key) async {
    await _box.delete(key);
  }

  @override
  Future<List<V>> getAllItems() async {
    return _box.values.toList();
  }

  @override
  Future<V?> getItem(K key) async {
    return _box.get(key);
  }

  @override
  Future<int> getItemCount() async {
    return _box.length;
  }

  @override
  Future<void> saveItem(V value, K key) async {
    await _box.put(key, value);
  }
}