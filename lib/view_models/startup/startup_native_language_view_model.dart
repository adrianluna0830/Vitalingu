import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:vitalingu/app_router.dart';
import 'package:vitalingu/models/language/supported_languages_bcp47_enum.dart';
import 'package:vitalingu/view_models/startup/base_startup_view_model.dart';

class StartupNativeLanguageState extends BaseStartupState {
  final Languages? nativeLanguage;
  final List<Languages> supportedLanguages = Languages.values;

  StartupNativeLanguageState({required this.nativeLanguage})
      : super(canContinue: nativeLanguage != null);
}

@injectable
class StartupNativeLanguageViewModel
    extends BaseStartupViewModel<StartupNativeLanguageState> {
  StartupNativeLanguageViewModel()
      : super(StartupNativeLanguageState(nativeLanguage: null));
  


  void setNativeLanguage(Languages language) {
    updateState(StartupNativeLanguageState(nativeLanguage: language));
  }

}
