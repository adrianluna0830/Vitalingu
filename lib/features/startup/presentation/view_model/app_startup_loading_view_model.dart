import 'package:injectable/injectable.dart';
import 'package:vitalingu/core/services/settings_service.dart';
import 'package:vitalingu/core/base/view_model_base.dart';

@injectable
class AppStartupLoadingViewModel extends ViewModelBase {
  final SettingsService _settingsService;
  AppStartupLoadingViewModel({
    required SettingsService settingsService,
    required super.navigationService,
  }) : _settingsService = settingsService;

  Future<void> initializeApp() async {
    await _settingsService.loadAllSettings();
    if (!_settingsService.areSettingsComplete()) {
      await navigationService.goToSettings();
      return;
    }

    await navigationService.replaceWithSelectLanguageView();
  }
}

