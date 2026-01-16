import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/injection.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/repository/user_settings.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';

class StartupNativeLanguageState extends BaseStartupState {
  final SupportedLanguagesBcp47? nativeLanguage;

  StartupNativeLanguageState({required this.nativeLanguage})
      : super(canContinue: nativeLanguage != null);
}

@injectable
class StartupNativeLanguageViewModel
    extends BaseStartupViewModel<StartupNativeLanguageState> {
  StartupNativeLanguageViewModel()
      : super(StartupNativeLanguageState(nativeLanguage: null));
  

  SupportedLanguagesBcp47? get nativeLanguage => state.value.nativeLanguage;

  List<SupportedLanguagesBcp47> getAllSupportedLanguages() {
    return SupportedLanguagesBcp47.values;
  }

  void setNativeLanguage(SupportedLanguagesBcp47 language) {
    updateState(StartupNativeLanguageState(nativeLanguage: language));
  }

    @override
  void navigateNext(TabsRouter tabsRouter) {
    tabsRouter.navigate(StartupTargetLanguageRoute(initialLanguage: nativeLanguage));
  }
}
