import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/app_settings_database.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/app_settings.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/services/pixabay_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';

@injectable
class AppStartupLoadingViewModel extends ViewModelBase {
  final AppSettingsDatabase appSettingsDatabase;
  AppStartupLoadingViewModel(
      {required this.appSettingsDatabase, required super.navigationService});

  Future<void> initializeApp() async {
    final hasSettings = await appSettingsDatabase.hasAppSettings();
    
    if (!hasSettings) {
      await navigationService.goToSettings();
      return;
    }

    final appSettings = await appSettingsDatabase.getAppSettings();
    
    if (appSettings == null) {
      await navigationService.goToSettings();
      return;
    }

    if (getIt.hasScope('user-config-session')) {
      await getIt.popScope();
    }

    await getIt.pushNewScopeAsync(
      scopeName: "user-config-session",
      init: (getIt) async {
        getIt.registerSingleton<AppSettings>(appSettings);
        getIt.registerSingleton<GeminiPromptService>(
            GeminiPromptService(appSettings.geminiApiKey));
        getIt.registerSingleton<PixabayService>(
            PixabayService(appSettings.pixabayApiKey));
      },
    );

    await navigationService.replaceWithSelectLanguageView();
  }
}
