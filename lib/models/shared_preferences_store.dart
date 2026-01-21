import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


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

