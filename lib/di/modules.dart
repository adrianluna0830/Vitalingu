import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/hive_database.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/models/language_settings.dart';
import 'package:vitalingu/database/app_settings_database.dart';
import 'package:vitalingu/database/language_session_settings_database.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @singleton
  Future<AppSettingsDatabase> provideAppSettingsDatabase() async {
    final hiveDatabase = await HiveDatabase.create<String, AppSettings>();
    return AppSettingsDatabase(database: hiveDatabase);
  }

  @preResolve
  @singleton
  Future<LanguageSettingsDatabase> provideLanguageSettingsDatabase() async {
    final hiveDatabase = await HiveDatabase.create<String, LanguageSettings>();
    return LanguageSettingsDatabase(database: hiveDatabase);
  }
}
