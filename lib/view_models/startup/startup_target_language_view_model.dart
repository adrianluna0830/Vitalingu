import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/language.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';

class StartupTargetLanguageState extends BaseStartupState {
  final Language? targetLanguage;
  final List<Language> supportedLanguages = Language.values;

  StartupTargetLanguageState({required this.targetLanguage})
      : super(canContinue: targetLanguage != null);
}

@injectable
class StartupTargetLanguageViewModel
    extends BaseStartupViewModel<StartupTargetLanguageState> {
  StartupTargetLanguageViewModel()
      : super(StartupTargetLanguageState(targetLanguage: null));




  Future<void> confirmLanguages(Language target) async {
    updateState(StartupTargetLanguageState(targetLanguage: target));
  }


}
