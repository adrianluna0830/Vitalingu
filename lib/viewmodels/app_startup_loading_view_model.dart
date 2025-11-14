import 'package:injectable/injectable.dart';
import 'package:vitalingu/services/app_settings_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';

@injectable
class AppStartupLoadingViewModel extends ViewModelBase {
  final AppSettingsService _appSettingsService;

  AppStartupLoadingViewModel({
    required AppSettingsService appSettingsService,
    required super.navigationService,
    required super.scopeManagerService,
  }) : _appSettingsService = appSettingsService;

  Future<void> initializeApp() async {
    final appSettings = await _appSettingsService.getSettings();

    if (appSettings == null) {
      await navigationService.goToSettings();
      return;
    }

    await scopeManagerService.createUserConfigScope();

    await navigationService.replaceWithSelectLanguageView();
  }
}
