import 'package:injectable/injectable.dart';
import 'package:vitalingu/router/app_router.dart';

@singleton
class NavigationService {
  late final AppRouter _appRouter;

  void initialize(AppRouter router) {
    _appRouter = router;
  }

  AppRouter get router => _appRouter;

  Future<void> goToLanguageView() {
    return _appRouter.push(const LanguageRoute());
  }

  Future<void> goToSettings() {
    return _appRouter.push(const SettingsRoute());
  }

  void popBack() {
    _appRouter.maybePop();
  }

  Future<void> replaceWithLanguageView() {
    return _appRouter.replace(const LanguageRoute());
  }
}
