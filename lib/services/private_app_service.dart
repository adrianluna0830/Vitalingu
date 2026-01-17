import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class PrivateAppService {
  static const _isFirstLaunchKey = 'isFirstLaunch';
  static const _hasLoadedInitialDataKey = 'hasLoadedInitialData';

  Future<bool> get isFirstLaunch async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstLaunchKey) ?? true;
  }

  Future<void> setIsFirstLaunch(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstLaunchKey, value);
  }

  Future<bool> get hasLoadedInitialData async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasLoadedInitialDataKey) ?? false;
  }

  Future<void> setHasLoadedInitialData(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasLoadedInitialDataKey, value);
  }
}