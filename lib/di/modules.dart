import 'package:injectable/injectable.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vitalingu/database/app_settings_database.dart';
import 'package:vitalingu/database/sembast_database.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/services/pixabay_service.dart';

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

  @lazySingleton
    @preResolve

  Future<GeminiPromptService> geminiPromptService(AppSettingsDatabase appSettingsDatabase) async {
    final String apiKey = await  appSettingsDatabase.getGeminiApiKey();
    return GeminiPromptService(apiKey);
  }

  @lazySingleton
    @preResolve

  Future<PixabayService> pixabayService(AppSettingsDatabase appSettingsDatabase) async {
    final String apiKey = await appSettingsDatabase.getPixabayApiKey();
    return PixabayService(apiKey);
  }


}
