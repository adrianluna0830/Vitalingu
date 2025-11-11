import 'package:injectable/injectable.dart';
import 'package:vitalingu/language/language.dart';
import 'package:vitalingu/router/app_router.dart';

@singleton
class NavigationService {
  late final AppRouter _appRouter;

  void initialize(AppRouter router) {
    
    _appRouter = router;
  }

  AppRouter get router => _appRouter;

  Future<void> goToLanguageView(Language language) {
    return _appRouter.push(LanguageRoute(language: language));
  }


  Future<void> goToSelectLanguageView() {
    return _appRouter.push(const SelectLanguageRoute());
  }
  Future<void> goToSettings() {
    return _appRouter.push(const SettingsRoute());
    
  }

  void popBack() {
    _appRouter.maybePop();
  }


}
