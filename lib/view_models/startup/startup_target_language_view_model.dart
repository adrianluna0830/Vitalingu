import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';

class StartupTargetLanguageState extends BaseStartupState {
  final Languages? targetLanguage;
  final List<Languages> supportedLanguages = Languages.values;

  StartupTargetLanguageState({required this.targetLanguage})
      : super(canContinue: targetLanguage != null);
}

@injectable
class StartupTargetLanguageViewModel
    extends BaseStartupViewModel<StartupTargetLanguageState> {
  StartupTargetLanguageViewModel()
      : super(StartupTargetLanguageState(targetLanguage: null));




  Future<void> confirmLanguages(Languages target) async {
    updateState(StartupTargetLanguageState(targetLanguage: target));
  }


}
