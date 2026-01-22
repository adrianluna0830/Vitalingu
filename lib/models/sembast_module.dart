import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart'; 

@module
abstract class SembastModule {
  
  @preResolve
  Future<Database> get database async {
final dir = await getApplicationDocumentsDirectory();
await dir.create(recursive: true);
final dbPath = join(dir.path, 'my_database.db');
final db = await databaseFactoryIo.openDatabase(dbPath);
    return db;
  }

}