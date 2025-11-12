import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/app_settings_database.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';

@injectable
class AppStartupLoadingViewModel extends ViewModelBase {
  final AppSettingsDatabase appSettingsDatabase;
  
  AppStartupLoadingViewModel({
    required this.appSettingsDatabase,
    required super.navigationService,
    required super.scopeManagerService,
  });

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

    await scopeManagerService.createUserConfigScope(appSettings);

    await navigationService.replaceWithSelectLanguageView();
  }
}
