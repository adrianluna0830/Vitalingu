import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/app_settings_database.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';
@injectable
class AppStartupLoadingViewModel extends ViewModelBase {
  final AppSettingsDatabase appSettingsDatabase;
  AppStartupLoadingViewModel({required this.appSettingsDatabase, required super.navigationService});

  Future<void> initializeApp() async {
    final String geminiApiKey = await appSettingsDatabase.getGeminiApiKey();
    final String pixabayApiKey = await appSettingsDatabase.getPixabayApiKey();
    if (geminiApiKey.isEmpty || pixabayApiKey.isEmpty) {
      navigationService.goToSettings();
    } else {
      navigationService.goToSelectLanguageView();
    }
  }
}