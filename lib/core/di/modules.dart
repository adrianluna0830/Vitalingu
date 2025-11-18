import 'package:injectable/injectable.dart';
import 'package:vitalingu/core/database/database_interface.dart';
import 'package:vitalingu/core/database/sembast_database.dart';
import 'package:vitalingu/features/language_management/data/model/language_settings.dart';

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

