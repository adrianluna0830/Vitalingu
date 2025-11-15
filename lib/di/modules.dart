import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/database_interface.dart';
import 'package:vitalingu/database/sembast_database.dart';
import 'package:vitalingu/models/language_settings.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<DatabaseInterface<LanguageSettings>> get languageSettingsDatabase =>
      SembastDatabase.create(
        toJson: (settings) => settings.toJson(),
        fromJson: (json) => LanguageSettings.fromJson(json),
        storeName: 'language_settings',
      ); 

}
