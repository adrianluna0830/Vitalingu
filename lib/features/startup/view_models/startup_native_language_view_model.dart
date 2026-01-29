import 'package:injectable/injectable.dart';
import 'package:signals/signals_core.dart';
import 'package:vitalingu/core/router/app_router.dart';
import 'package:vitalingu/core/models/language/language_enum.dart';
import 'package:vitalingu/core/models/user_app_settings.dart';
@injectable
class StartupNativeLanguageViewModel {
  final NativeLanguageSignal _nativeLanguageSignal;
  final AppRouter _appRouter;
  
  
  StartupNativeLanguageViewModel(this._nativeLanguageSignal, this._appRouter);
  List<Language> get supportedLanguages {
    return Language.values;
  }
  late Computed<Language> nativeLanguageComputed = Computed<Language>(
    () => _nativeLanguageSignal.value,
  );
  void setNativeLanguage(Language lang) {
    _nativeLanguageSignal.value = lang;
  }
  
  void navigateToLanguageIntroductionPage() {
    _appRouter.push(StartupIntroductionRoute());
  }
  
  void navigateToTargetLanguageSelectionPage() {
    _appRouter.push(StartupTargetLanguageRoute());
  }

}

