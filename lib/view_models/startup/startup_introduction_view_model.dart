import 'package:injectable/injectable.dart';
import 'package:vitalingu/app_router.dart';

@injectable
class StartupIntroductionViewModel {
  final AppRouter _appRouter;

  StartupIntroductionViewModel({required AppRouter appRouter}) : _appRouter = appRouter;

  void goToNativeLanguageSelectionPage()
  {
    _appRouter.push(StartupNativeLanguageRoute());
  }
}