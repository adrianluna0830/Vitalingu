import 'package:injectable/injectable.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vitalingu/models/language/language_enum.dart';


@injectable
class SharedPreferencesStore implements SignalsKeyValueStore {
  SharedPreferencesStore();

  SharedPreferences? prefs;

  Future<SharedPreferences> init() async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs!;
  }

  @override
  Future<String?> getItem(String key) async {
    final prefs = await init();
    return prefs.getString(key);
  }

  @override
  Future<void> removeItem(String key) async {
    final prefs = await init();
    prefs.remove(key);
  }

  @override
  Future<void> setItem(String key, String value) async {
    final prefs = await init();
    prefs.setString(key, value);
  }
}
class SembastLanguageSpecificStore implements SignalsKeyValueStore
{
  final Database db;
  final Language targetLanguage;
  SembastLanguageSpecificStore({
    required this.db,
     required this.targetLanguage,
  });
  
  StoreRef<String, String> get _store => StoreRef<String, String>(targetLanguage.name);

  @override
  Future<String?> getItem(String key) async {
    final record = _store.record(key);
    return await record.get(db);
  }

  @override
  Future<void> removeItem(String key) async {
    final record = _store.record(key);
    await record.delete(db);
  }

  @override
  Future<void> setItem(String key, String value) async {
    final record = _store.record(key);
    await record.put(db, value);
  }
}

@injectable
class EncryptedSharedPreferencesStore implements SignalsKeyValueStore {
  EncryptedSharedPreferencesStore();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<String?> getItem(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> setItem(String key, String value) async {
    await _storage.write(
      key: key,
      value: value,
    );
  }

  @override
  Future<void> removeItem(String key) async {
    await _storage.delete(key: key);
  }
}

