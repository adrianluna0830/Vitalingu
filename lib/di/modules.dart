import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class DatabaseModule {

  @preResolve
  @singleton
  Future<String> get applicationDocumentsPath async {
    final appDir = await getApplicationDocumentsDirectory();
    return appDir.path;
  }

}
