import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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
}
