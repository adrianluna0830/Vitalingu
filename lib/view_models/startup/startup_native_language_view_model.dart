import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/language.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';

class StartupNativeLanguageState extends BaseStartupState {
  final Language? nativeLanguage;
  final List<Language> supportedLanguages = Language.values;

  StartupNativeLanguageState({required this.nativeLanguage})
      : super(canContinue: nativeLanguage != null);
}

@injectable
class StartupNativeLanguageViewModel
    extends BaseStartupViewModel<StartupNativeLanguageState> {
  StartupNativeLanguageViewModel()
      : super(StartupNativeLanguageState(nativeLanguage: null));
  


  void setNativeLanguage(Language language) {
    updateState(StartupNativeLanguageState(nativeLanguage: language));
  }

}
