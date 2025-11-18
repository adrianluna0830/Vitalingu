import 'package:injectable/injectable.dart';
import 'package:vitalingu/router/app_router.dart';

@singleton
class NavigationService {
  final AppRouter _appRouter;

  NavigationService(this._appRouter);
  
  AppRouter get router => _appRouter;

  Future<void> goToLanguageView() {
    return _appRouter.push( LanguageRoute());
  }

 
  Future<void> replaceWithSelectLanguageView() {
    return _appRouter.replaceAll([const SelectLanguageRoute()]);
  }
  
  Future<void> goToSettings() {
    return _appRouter.push(const SettingsRoute());
  }

  Future<void> goToAppStartupLoadingView() {
    return _appRouter.replace(const AppStartupLoadingRoute());
  }

  Future<void> goToVoiceChatView() {
    return _appRouter.push(VoiceChatRoute());
  }

  void popBack() {
    _appRouter.maybePop();
  }
}
