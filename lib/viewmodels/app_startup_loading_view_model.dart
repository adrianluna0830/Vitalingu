import 'package:injectable/injectable.dart';
import 'package:vitalingu/database/app_settings_database.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:vitalingu/services/pixabay_service.dart';
import 'package:vitalingu/viewmodels/view_model_base.dart';

@injectable
class AppStartupLoadingViewModel extends ViewModelBase {
  final AppSettingsDatabase appSettingsDatabase;
  AppStartupLoadingViewModel(
      {required this.appSettingsDatabase, required super.navigationService});

  Future<void> initializeApp() async {
    final String geminiApiKey = await appSettingsDatabase.getGeminiApiKey();
    final String pixabayApiKey = await appSettingsDatabase.getPixabayApiKey();
    if (geminiApiKey.isEmpty || pixabayApiKey.isEmpty) {
      navigationService.goToSettings();
      return;
    }
    getIt.registerSingleton<GeminiPromptService>(
        GeminiPromptService(geminiApiKey));
    getIt.registerSingleton<PixabayService>(PixabayService(pixabayApiKey));

    navigationService.goToSelectLanguageView();
  }
}
