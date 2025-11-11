import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vitalingu/sembast_database.dart';
import 'package:vitalingu/database/app_settings_database.dart';

@module
abstract class DatabaseModule {
  @preResolve
  @singleton
  Future<Database> get database async {
    final appDirPath = await applicationDocumentsPath;
    final dbPath = join(appDirPath, 'app_database.db');
    return databaseFactoryIo.openDatabase(dbPath);
  }

  @preResolve
  @singleton
  Future<String> get applicationDocumentsPath async {
    final appDir = await getApplicationDocumentsDirectory();
    return appDir.path;
  }

  @singleton
  SembastDatabase wordDatabase(Database database) {
    return SembastDatabase(
      database: database,
      storeName: 'word_store',
    );
  }

  @preResolve
  @singleton
  Future<AppSettingsDatabase> get appSettingsDatabase async {
    final sembastDb = SembastDatabase(
      database: await database,
      storeName: 'settings_store',
    );
    return AppSettingsDatabase(database: sembastDb);
  }
}
