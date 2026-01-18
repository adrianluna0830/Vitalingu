import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';

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

