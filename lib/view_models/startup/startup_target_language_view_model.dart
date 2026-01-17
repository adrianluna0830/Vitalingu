import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/repository/user_settings.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';

class StartupTargetLanguageState extends BaseStartupState {
  final SupportedLanguagesBcp47? targetLanguage;
  final List<SupportedLanguagesBcp47> supportedLanguages = SupportedLanguagesBcp47.values;

  StartupTargetLanguageState({required this.targetLanguage})
      : super(canContinue: targetLanguage != null);
}

@injectable
class StartupTargetLanguageViewModel
    extends BaseStartupViewModel<StartupTargetLanguageState> {
  StartupTargetLanguageViewModel(this.userSettings)
      : super(StartupTargetLanguageState(targetLanguage: null));

  final UserSettings userSettings;



  Future<void> confirmLanguages(SupportedLanguagesBcp47 target) async {
    updateState(StartupTargetLanguageState(targetLanguage: target));
  }


}
