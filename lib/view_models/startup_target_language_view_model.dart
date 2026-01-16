import 'package:injectable/injectable.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/view_models/base_startup_view_model.dart';

class StartupTargetLanguageState extends BaseStartupState {
  final SupportedLanguagesBcp47? targetLanguage;

  StartupTargetLanguageState({required this.targetLanguage})
      : super(canContinue: targetLanguage != null);
}

@injectable
class StartupTargetLanguageViewModel
    extends BaseStartupViewModel<StartupTargetLanguageState> {
  StartupTargetLanguageViewModel()
      : super(StartupTargetLanguageState(targetLanguage: null));

  SupportedLanguagesBcp47? get targetLanguage => state.value.targetLanguage;

  SupportedLanguagesBcp47? getNativeLanguage() {
    return SupportedLanguagesBcp47.en;
  }

  List<SupportedLanguagesBcp47> getSupportedLanguagesExcludingNative() {
    final native = getNativeLanguage();
    return SupportedLanguagesBcp47.values
        .where((lang) => lang != native)
        .toList();
  }

  void setTargetLanguage(SupportedLanguagesBcp47 language) {
    updateState(StartupTargetLanguageState(targetLanguage: language));
  }
}
